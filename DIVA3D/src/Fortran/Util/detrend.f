       parameter(icl=50,imax=1000000,ig=5)
C First; data index, second: class index, third: group index
       real*4 d(imax*icl)
       real*4 da(imax*icl)
       real*4 w(imax*icl)
       integer*4 ic(icl,ig),ipoint(imax,icl,ig),indy
       integer*4 indi(ig),ndata,iclm(ig),nd
       real*4 rm(icl,ig),wm(icl,ig)
       real*8 rms1,rms2,rms3
       integer*4 IP(IG)
       
       character*12 cn
       character*1 groupe
       rms1=0
       rms2=0
       rms3=0
       read(5,*) MG
       write(6,*) 'Number of groups',MG
       
       
       
       if(MG.GT.IG) then
       write(6,*) 'Too many classes, decrease input classes'
       write(6,*) ' or increase IG in detrend.f and recompile'
       stop
       endif
       
       read(56,*,ERR=4414,END=4414) (IP(i),i=1,MG)
       GOTO 445
 4414   continue
       write(6,*) 'Severe error, detrend.order corrupted'
       write(6,*) 'I will try to recover by using columns 5 6 7 etc'
       do ii=1,MG
       IP(ii)=ii+4
       enddo
 445   continue
       do ii=1,MG
       IP(ii)=IP(ii)-4
       enddo
       
       
       write(6,*) 'Order',(IP(ki),ki=1,MG)
C make a 2 pass algo
       do j=1,ig
       do i=1,icl
       ic(i,j)=0
       rm(i,j)=0
       wm(i,j)=0
       enddo
       enddo
       do k=1,IG
       iclm(k)=0
       enddo
       ndata=0
       MGM=1
C Calculate maximum columns MGM
       do ii=1,MG
       MGM=max(MG,IP(ii))
       enddo
       if(MGM.GT.IG) then
       write(6,*) 'Too many classes, decrease input classes'
       write(6,*) ' or increase IG in detrend.f and recompile'
       stop
       endif
       
       
       
 1     continue
       read(88,*,end=99,err=99) x,y,dd,ww,(indi(k),k=1,MGM)
       read(89,*,end=99,err=99) x,y,dda
       ndata=ndata+1
       do k=1,MGM
       iclm(k)=max(iclm(k),indi(k))
C       write(6,*) k,iclm(k),indi(k)
       enddo
       do ki=1,MG
       k=IP(ki)
       ii=indi(k)
       
C       write(6,*) k,iclm(k)
       ic(ii,k)=ic(ii,k)+1
       ipoint(ic(ii,k),ii,k)=ndata
       enddo
       d(ndata)=dd
       w(ndata)=ww
       da(ndata)=dda
       rms1=rms1+ww*(dd-dda)*(dd-dda)
       rms3=rms3+ww
       goto 1
 99    continue
C now subtract
       write(6,*) 'Summary'
       write(6,*) 'Data',ndata
       write(6,*) 'Groups',MG,MGM
       write(6,*) 'Classes',(iclm(k),k=1,MGM)
       
C Now do the ordering thing
C first group
       do ki=1,MG
       k=IP(ki)
       ijmclass=iclm(k)
       do i=1,iclm(k)
       
       do jj=1,ic(i,k)
       indy=ipoint(jj,i,k)
       rm(i,k)=rm(i,k)+w(indy)*(d(indy)-da(indy))
       wm(i,k)=wm(i,k)+w(indy)
       enddo
       if (wm(i,k).eq.0.) then
C  no data in class
       write(6,*) 'No data in class',i, 'group',k
       rm(i,k)=0.
       ijmclass=ijmclass-1
                          else
       rm(i,k)=rm(i,k)/wm(i,k)/(1+1/sqrt(0.001+ic(i,k)))
       endif

       enddo
       RR=0
       do i=1,iclm(k)
       RR=RR+rm(i,k)
       enddo
       RR=RR/max(ijmclass,1)
       write(6,*) ' Mean to be subtracted', RR,ijmclass
       do i=1,iclm(k)
       rm(i,k)=rm(i,k)-RR
       enddo
       
      write(groupe,88) k
 88   format(I1)
      cn="trends."//groupe//".dat"
       open(file=cn,unit=97)
       do i=1,iclm(k)
       write(97,*) i,rm(i,k)
       enddo
       close(97)
       rewind(97)
C now subtract from data
       do i=1,iclm(k)
       do jj=1,ic(i,k)
       indy=ipoint(jj,i,k)
       d(indy)=d(indy)-rm(i,k)
       enddo
       enddo
C now next group
       enddo
       rewind(88)


       nd=0
 11     continue
       read(88,*,end=999,err=999) x,y,dd,ww,(indi(k),k=1,MGM)
       nd=nd+1
       rms2=rms2+ww*(d(nd)-da(nd))*(d(nd)-da(nd))
       write(90,444) x,y,d(nd),ww,(indi(k),k=1,MGM)
       goto 11
 999    continue
 444   format(4(1X,E16.5),5(1X,I6))
       write(6,*) 'Misfit after detrend/misfit before',rms2/rms1
       write(42,*) rms2/rms1,sqrt(rms2/rms3),sqrt(rms1/rms3)
       stop
       end  
