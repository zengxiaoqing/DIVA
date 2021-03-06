!
      PROGRAM DV4DYRWT
!
      implicit none
!
!--------------------------------------------------------------------!
!
      INTEGER :: ivar, istep,MINLEV,MAXLEV
      INTEGER :: step,ipar
!
      DOUBLE PRECISION :: lon,lat,val
!
      integer , DIMENSION(:) ,  ALLOCATABLE :: flags
      integer*4 ,DIMENSION(:),  ALLOCATABLE :: idep
      REAL*4 , DIMENSION(:)  ,  ALLOCATABLE :: dep,time_yr
      real*8 :: mjd
      REAL*4 , DIMENSION(:)  ,  ALLOCATABLE :: XLON,YLAT
     &                                       , CORLEN, SN, VARBAK
!
      REAL*4 ,DIMENSION(:,:),    ALLOCATABLE :: resmax1,resmin1,clbnds
     &                                        , varbot
     &                                        , varb1, varb2
!
      REAL*4 , DIMENSION(:,:,:),  ALLOCATABLE :: var, var1, var2
     &                                        , verr,reler,dbins
     &                                        , obins,rlfield
!
      integer                   :: i,j,k,klev,ic,top_lev,kuw,time_len
     &                           , list_len,time_Yval1,time_Yval2
     &				 , delta_mjd
      integer                   :: NX,NY,NK,ndata,nl,ivars,chlen,lev
      integer			:: len1,len2,len3,len4
      integer*4                 :: KMAX,ipr,nw,IMAX,JMAX
      integer                   :: ICOOC,IREG,ISPEC, ilev, nbdat, icdf
!
      real*4                  :: time_val,time_Yval,time_Mval,time_Dval
      real*4                     :: VALEXC, zz,
     &              var_min,var_max,ver_min,ver_max,dbin_min,dbin_max,
     &              vbt_min,vbt_max,var1_min,var1_max,
     &              vbt1_min,vbt1_max,vbt2_min,vbt2_max,
     &              var2_min,var2_max,verel_min,verel_max,
     &             obin_min,obin_max,rl_min,rl_max,x,y,xr,yr
      real*4                     ::
     &              var_min0,var_max0,ver_min0,ver_max0,dbin_min0,
     &              vbt_min0,vbt_max0,var1_min0,var1_max0,dbin_max0,
     &              vbt1_min0,vbt1_max0,vbt2_min0,vbt2_max0,
     &              var2_min0,var2_max0,verel_min0,verel_max0,
     &              obin_min0,obin_max0,rl_min0,rl_max0
!
      real*4                     :: xorig, yorig, dx, dy, xend, yend
     &                            , WestBL,SouthBL,EastBL,NorthBL
!
      integer                    :: xy1,xy2
!
      character (len=4)          :: yy1,yy2
      CHARACTER (len=255)        :: divafile,comments
      CHARACTER (len=20)         :: EXECIN
      CHARACTER (len=22)         :: DEPTHS
      CHARACTER (len=99)         :: VARFILEIN
      CHARACTER (len=255)        :: file_name, file_name2, file_4Dnc
     &				  , buffer
      character (len=255)        :: title_string,cellmeth
     &                            , INSTITUT, PRODUCTION
     &                            , SOURCE, COMMENT, Email
     &				  , Acknowledgements
      character (len=30)         :: Ref_time
      CHARACTER (len=99)         :: var_cfname, var_name
     &                            , dat_name, var1_name, prmliste
      character (len=99)         :: var_lgname,sdn_units
      character (len=5)          :: chname
      character (len=20)         :: var_units,vrb_units
      character (len=20)                          :: s_units
      character (len=20) , DIMENSION(2)           :: l_units
      character (len=255), DIMENSION(:),ALLOCATABLE :: all_vars
     &                                               , all_files
     &                                               , les_files
     &                                               , var_shname
     &                                               , var_shname_l
     &                                               , cellmeth_l
     &                                               , Ref_time_l
!
      LOGICAL    :: exist
!--------------------------------------------------------------
!
      EXECIN='./fort.44'
      OPEN(2,FILE=EXECIN,STATUS='OLD')
      READ(2,*) list_len
      CLOSE(2)
      time_len = list_len
!
      WRITE(*,*) 'dv4DYRwrt: ',list_len,time_len
!
      ALLOCATE(flags(time_len))
      ALLOCATE(all_vars(time_len))
      ALLOCATE(all_files(time_len))
      ALLOCATE(les_files(time_len))
      ALLOCATE(clbnds(2,time_len))
      ALLOCATE(time_yr(time_len))
!
      EXECIN='../3DWORK/3Dncliste'
      OPEN(2,FILE=EXECIN,STATUS='OLD')
      DO I = 1,time_len
      read(2,'(a)') buffer
!      write(0,*) buffer, len(buffer)
        j=0
        len1=999
        len2=999
        len3=999
        len4=999
      	Do while (j.le.(len(buffer)-1))
      	  j=j+1
      	  If ((buffer(j:j).ne.' ').and.(len1.eq.999)) then
      	   len1=j
!      	   write(0,*) buffer(j:j)
      	  Endif
      	  If ((buffer(j:j).eq.' ').and.(buffer(j+1:j+1).eq.' ')
     &.and.(len2.eq.999)) then
      	   len2=j-1
!      	   write(0,*) buffer(j-1:j-1)
      	  Endif
      	  If ((buffer(j:j).ne.' ').and.(len3.eq.999).and.(j.gt.len2))
     &then
      	   len3=j
!      	   write(0,*) buffer(j:j)
      	  Endif
      	  If ((buffer(j:j).eq.' ').and.(buffer(j+1:j+1).eq.' ')
     &.and.(len4.eq.999).and.(j.gt.len3)) then
      	   len4=j-1
!      	   write(0,*) buffer(j-1:j-1)
      	  Endif      	  
      	Enddo
!      READ(2,*) les_files(I),flags(I)
!      write(0,*) buffer(len3:len4)
      read(buffer(len3:len4),*) flags(I)
      les_files(I)=buffer(len1:len2)
!      write(0,*) les_files(I),flags(I)
!      call sleep(10)
      ENDDO
!
      write(*,*)' WRITE 4D NetCdf file gathering:'      
      J = 0
      DO I = 1, time_len
           J = J + 1
           all_files(J) = les_files(I)
           write(*,*)TRIM(all_files(J))
      ENDDO
!
      ALLOCATE(var_shname(time_len))
      ALLOCATE(var_shname_l(time_len))
      ALLOCATE(cellmeth_l(time_len))
      ALLOCATE(Ref_time_l(time_len))
!
      WRITE(file_name,'(a)')TRIM(all_files(1))
      chlen = 1
      DO while ((file_name(chlen:chlen).ne.' ')
     &.or.(file_name(chlen+1:chlen+1).ne.' '))
         chlen = chlen + 1
      ENDDO
      chlen = chlen - 1
      chname = file_name(chlen-17:chlen-13)
      read(chname,'(I5)') MINLEV
      chname = file_name(chlen-11:chlen-7)
      read(chname,'(I5)')MAXLEV
      MINLEV = MINLEV - 10000
      MAXLEV = MAXLEV - 10000
      var_shname(1) = file_name(1:chlen-24)
      DO I = 1,time_len
      WRITE(file_name,'(a)')TRIM(all_files(I))
      var_shname(I) = file_name(1:chlen-24)
      all_vars(I) = file_name(1:chlen-19)
      ENDDO
      top_lev = MAXLEV - MINLEV + 1
      ALLOCATE(dep(top_lev))
      ALLOCATE(idep(top_lev))
      ALLOCATE(CORLEN(top_lev))
      ALLOCATE(SN(top_lev))
      ALLOCATE(VARBAK(top_lev))
!
!     Read the grid data from GridInfo.dat
!--------------------------------------------------------------
!
!      divafile = '../output/3Danalysis/Fields/GridInfo.dat'
      divafile = '../output/3Danalysis/GridInfo.dat'
      open(unit=90,file=divafile)
      read(90,*) xorig
      read(90,*) yorig
      read(90,*) dx
      read(90,*) dy
      read(90,*) xend
      read(90,*) yend
      CLOSE(90)
!
      NX = INT(xend)
      NY = INT(yend)
      NK = top_lev
      ALLOCATE(XLON(NX))
      ALLOCATE(YLAT(NY))
      ALLOCATE(var(NX,NY,NK))
      ALLOCATE(var1(NX,NY,NK))
      ALLOCATE(var2(NX,NY,NK))
      ALLOCATE(verr(NX,NY,NK))
      ALLOCATE(reler(NX,NY,NK))
      ALLOCATE(dbins(NX,NY,NK))
      ALLOCATE(obins(NX,NY,NK))
      ALLOCATE(rlfield(NX,NY,NK))
!
      ALLOCATE(resmax1(1:NY,NK))
      ALLOCATE(resmin1(1:NY,NK))
      ALLOCATE(varbot(1:NX,1:NY))
      ALLOCATE(varb1(1:NX,1:NY))
      ALLOCATE(varb2(1:NX,1:NY))
!
      EXECIN='../3DWORK/3DNCinfo'
      INQUIRE(FILE=EXECIN,EXIST=exist)
      if(exist) then
          close(12)
          OPEN(UNIT=12,FILE=EXECIN)
          read(12,*) INSTITUT
          read(12,*) PRODUCTION
          read(12,*) SOURCE
          read(12,*) COMMENT
          read(12,*) Email
	  read(12,*) Acknowledgements
          read(12,*) var_lgname
          read(12,*) var_units
          read(12,*) vrb_units
          read(12,*) title_string
          read(12,*) l_units(1)
          read(12,*) l_units(2)
          J = 0
          DO  I = 1, time_len
            IF(flags(I) == 1) then
              J = J+1
              read(12,*) var_shname_l(J)
              read(12,*) cellmeth_l(J)
              read(12,*) Ref_time_l(J)
            ELSE
              read(12,*) comments
              read(12,*) comments
              read(12,*) comments
            ENDIF
          ENDDO
      endif
!
! Writing an info text file for matadata files:
      WRITE(file_name2,'("../output/3Danalysis/",
     &a,".4DNCMetainfo")')TRIM(var_shname_l(1))
      close(12)
      OPEN(UNIT=12,FILE=file_name2)
!
      chlen = 1
      DO while(l_units(1)(chlen:chlen) .ne. ' ')
         chlen = chlen + 1
      ENDDO
      chlen = chlen - 1
      if (chlen == 2) then
         s_units = l_units(1)
         WRITE(sdn_units,'("SDN:P061:38:ULKM = Kilometres (km)")')
      else
         s_units = l_units(1)(1:chlen-5)
         WRITE(sdn_units,'("SDN:P061:38:UAAA = Degrees (deg)")')
      endif
!
      write(12,*) NX
      write(12,*) NY
      write(12,*) TRIM(sdn_units)
      write(12,*) TRIM(var_units)
!s_units
!
      WestBL = xorig
      SouthBL = yorig
      EastBL = xorig + dx*xend
      NorthBL =yorig + dy*yend
!
      write(12,1111)SouthBL
      write(12,1111)NorthBL
      write(12,1111)WestBL
      write(12,1111)EastBL
      write(12,1112)dx
      write(12,1112)dy
!
 1111 FORMAT(1X,F7.3)
 1112 FORMAT(1X,F5.3)
!--------------------------------------------------------------!
! Writing an info text file for matadata files:
      WRITE(file_name2,'("../output/3Danalysis/",
     &a,".Metainfo.txt")')TRIM(var_shname_l(time_len))
      close(12)
      OPEN(UNIT=12,FILE=file_name2)
!
      write(12,1201)
      write(12,1202)NorthBL
      write(12,1204)WestBL
      write(12,1203)EastBL
      write(12,1205)SouthBL
      write(12,1206)dx,dy,s_units
!
!--------------------------------------------------------------
!x      chlen = 1
!x      DO while(var_shname(chlen:chlen) .ne. ' ')
!x         chlen = chlen + 1
!x      ENDDO
!x      chlen = chlen - 1
      var_name = var_shname_l(time_len)  !(1:chlen-9)
!
      WRITE(file_4Dnc,'("../output/3Danalysis/",
     &a,".4Danl.nc")')TRIM(var_name)
!
      clbnds = 0.
      ipar = 1
!
      WRITE(title_string,'("DIVA 4D analysis of ",a)')TRIM(var_name)
!
      DO ivars = 1,time_len

      WRITE(file_name,'("../output/3Danalysis/",
     &a)')TRIM(all_files(ivars))

      imax = NX
      jmax = NY
!
      var1_name = all_files(ivars)
      chlen = 1
      DO while ((var1_name(chlen:chlen).ne.' ')
     &.or.(var1_name(chlen+1:chlen+1).ne.' '))
         chlen = chlen + 1
      ENDDO
      chlen = chlen - 1
      dat_name = var1_name(1:chlen-18)

      WRITE(var1_name,'("../output/3Danalysis/",
     &a,"nbrdata")')TRIM(dat_name)
      close(2)
      OPEN(UNIT=2,FILE=TRIM(var1_name))
      read(2,*) comments

      WRITE(prmliste,'("../output/3Danalysis/",
     &a,"3Dparam")')TRIM(dat_name)
        close(3)
        OPEN(UNIT=3,FILE=prmliste)
!
      CALL NC_RD3DCL(imax,jmax,nk,ipar,time_val,clbnds(1:2,ivars),
     &  var,var1,var2,verr,reler,dbins,obins,rlfield,varbot,varb1,varb2,
     &  xlon,ylat,dep,CORLEN,SN,VARBAK,IREG,ISPEC,ICOOC,
     &  var_min,var_max,vbt_min,vbt_max,ver_min,ver_max,dbin_min,
     &  dbin_max,var1_min,var1_max,var2_min,var2_max,verel_min,
     &  verel_max,vbt1_min,vbt1_max,vbt2_min,vbt2_max,
     &  obin_min,obin_max,rl_min,rl_max,VALEXC,
     &  file_name,var_shname_l(ivars))
!
      write(12,2001)TRIM(var_shname_l(ivars)),time_val
      write(12,2002)
!
      do lev=1,NK
      read(2,*) ilev, nbdat
      read(3,*)CORLEN(lev),SN(lev),VARBAK(lev)
      write(12,2003)dep(lev),nbdat,CORLEN(lev),SN(lev),VARBAK(lev)
      enddo
 
      write(12,2015)
      write(12,2004)var_min,var_max
      write(12,2008)var1_min,var1_max
      write(12,2009)var2_min,var2_max
      write(12,2005)vbt_min,vbt_max
      write(12,2011)vbt1_min,vbt1_max
      write(12,2012)vbt2_min,vbt2_max
      write(12,2006)ver_min,ver_max
      write(12,2010)verel_min,verel_max
      write(12,2007)dbin_min,dbin_max
      write(12,2013)obin_min,obin_max
      write(12,2014)rl_min,rl_max

      IF(ivars == 1) THEN
        time_yr(1) = time_val
        var_min0 = var_min
        var_max0 = var_max
        ver_min0 = ver_min
        ver_max0 = ver_max
        dbin_min0 = dbin_min
        var1_min0 = var1_min
        var1_max0 = var1_max
        dbin_max0 = dbin_max
        var2_min0 = var2_min
        var2_max0 = var2_max
        verel_min0 = verel_min
        verel_max0 = verel_max
        obin_min0 = obin_min
        obin_max0 = obin_max
        rl_min0 = rl_min
        rl_max0 = rl_max
        vbt_min0 = vbt_min
        vbt_max0 = vbt_max
        vbt1_min0 = vbt1_min
        vbt1_max0 = vbt1_max
        vbt2_min0 = vbt2_min
        vbt2_max0 = vbt2_max
      ENDIF
!
        IF(var_min0 >= var_min) var_min0 = var_min
        IF(var_max0 <= var_max) var_max0 = var_max
        IF(ver_min0 >= ver_min) ver_min0 = ver_min
        IF(ver_max0 <= ver_max) ver_max0 = ver_max
        IF(dbin_min0 >= dbin_min) dbin_min0 = dbin_min
        IF(dbin_max0 <= dbin_max) dbin_max0 = dbin_max
        IF(var1_min0 >= var1_min) var1_min0 = var1_min
        IF(var1_max0 <= var1_max) var1_max0 = var1_max
        IF(var2_min0 >= var2_min) var2_min0 = var2_min
        IF(var2_max0 <= var2_max) var2_max0 = var2_max
        IF(verel_min0 >= verel_min) verel_min0 = verel_min
        IF(verel_max0 <= verel_max) verel_max0 = verel_max
        IF(obin_min0 >= obin_min) obin_min0 = obin_min
        IF(obin_max0 <= obin_max) obin_max0 = obin_max
        IF(rl_min0 >= rl_min) rl_min0 = rl_min
        IF(rl_max0 <= rl_max) rl_max0 = rl_max
        IF(vbt_min0 >= vbt_min) vbt_min0 = vbt_min
        IF(vbt_max0 <= vbt_max) vbt_max0 = vbt_max
        IF(vbt1_min0 >= vbt1_min) vbt1_min0 = vbt1_min
        IF(vbt1_max0 <= vbt1_max) vbt1_max0 = vbt1_max
        IF(vbt2_min0 >= vbt2_min) vbt2_min0 = vbt2_min
        IF(vbt2_max0 <= vbt2_max) vbt2_max0 = vbt2_max
!
        cellmeth =  cellmeth_l(ivars)
        Ref_time = Ref_time_l(ivars)
        
! Adding days to time_val when the reference year is different from the first netcdf
        
        chlen=len(trim(Ref_time_l(1)))
	If (Ref_time(chlen-9:chlen-6) /=
     & Ref_time_l(1)(chlen-9:chlen-6)) then
	       read(Ref_time_l(1)(chlen-9:chlen-6),'(i4)') time_Yval1
	       read(Ref_time(chlen-9:chlen-6),'(i4)') time_Yval2
!	       write(0,*) time_Yval1,time_Yval2
	       delta_mjd=mjd(time_Yval2,1,1,0.)-mjd(time_Yval1,1,1,0.)
	       time_val=time_val+delta_mjd
	       clbnds(1:2,ivars)=clbnds(1:2,ivars)+delta_mjd
	Endif
!
!	write(0,*) time_yr(ivars)
      IF(ivars .gt. 1) time_yr(ivars)=time_val
!        write(0,*) time_yr(ivars)
!
      CALL NC_4DYEAR(imax,jmax,nk,ipar,list_len,time_yr(ivars),clbnds,
     &  var,var1,var2,verr,reler,dbins,obins,rlfield,varbot,varb1,varb2,
     &  xlon,ylat,dep,CORLEN,SN,VARBAK,IREG,ISPEC,ICOOC,
     &  var_min0,var_max0,vbt_min0,vbt_max0,ver_min0,ver_max0,
     &  dbin_min0,dbin_max0,var1_min0,var1_max0,var2_min0,var2_max0,
     &  verel_min0,verel_max0,vbt1_min0,vbt1_max0,vbt2_min0,vbt2_max0,
     &  obin_min0,obin_max0,rl_min,rl_max,
     &  VALEXC,l_units,
     &  LEN_TRIM(file_4Dnc),TRIM(file_4Dnc),
     &  LEN_TRIM(var_shname_l(ivars)),TRIM(var_shname_l(ivars)),
     &  LEN_TRIM(var_lgname),TRIM(var_lgname),
     &  LEN_TRIM(var_units),TRIM(var_units),
     &  LEN_TRIM(vrb_units),TRIM(vrb_units),
     &  LEN_TRIM(title_string),TRIM(title_string),
     &  LEN_TRIM(cellmeth),TRIM(cellmeth),
     &  LEN_TRIM(Ref_time),TRIM(Ref_time),
     &  LEN_TRIM(INSTITUT),TRIM(INSTITUT),
     &  LEN_TRIM(PRODUCTION),TRIM(PRODUCTION),
     &  LEN_TRIM(SOURCE),TRIM(SOURCE),
     &  LEN_TRIM(Email),TRIM(Email),
     &  LEN_TRIM(COMMENT),TRIM(COMMENT),
     &  LEN_TRIM(Acknowledgements),TRIM(Acknowledgements))
!
      ENDDO  !ivars
!
      WRITE(file_name2,'("../output/3Danalysis/",
     &a,".4DNCMetainfo")')TRIM(var_shname_l(1))
      close(12)
      idep(:)=NINT(dep(:))
      OPEN(UNIT=12,FILE=file_name2,STATUS='OLD',POSITION='APPEND')
      write(12,*)(idep(lev),lev=1,NK)
      write(12,*)dep(1)
      write(12,*)dep(NK)
      close(12)
!
 1201 FORMAT(//,10X,'Geographical coordinates:',/,
     &          10X,'*************************')
 1202 FORMAT(4X,'Northen boundary ..........:',F10.5)
 1203 FORMAT(4X,'Eastern boundary ..........:',F10.5)
 1204 FORMAT(4X,'Western boundary ..........:',F10.5)
 1205 FORMAT(4X,'Southern boundary .........:',F10.5)
 1206 FORMAT(4X,'Grid resolution  ..........:',F6.4,' by ',F6.4,1X,a)

 2001 FORMAT(//,4X,'VARIABLE: ',a,' at month ',F10.5,/,4X,'********')
 2002 FORMAT(4X,'DEPTH',4X,'LAYER DATA NUMBER',2X,'CORELATION LENGTH'
     &,4X,'S/N RATIO',4X,'VARBAK')
 2003 FORMAT(4X,F8.2,6X,I6.4,14X,F6.4,10X,F6.3,4X,F6.3)
 2015 FORMAT(/,4X,'%%%%%%%%%%%%%%%%%%%%%%',12X,'MIN VALUE',
     &4X,'MAX VALUE')
                   
 2004 FORMAT(4X,'VARIABLE                  ',6X,F10.5,4X,F10.5)
 2005 FORMAT(4X,'BOTTOM VARIABLE Val       ',6X,F10.5,4X,F10.5)
 2006 FORMAT(4X,'VARIABLE ERROR            ',6X,F10.5,4X,F10.5)
 2007 FORMAT(4X,'DATA/BINS                 ',6X,F10.5,4X,F10.5)
 2008 FORMAT(4X,'MASKED VARIABLE treshold 1',6X,F10.5,4X,F10.5)
 2009 FORMAT(4X,'MASKED VARIABLE treshold 2',6X,F10.5,4X,F10.5)
 2010 FORMAT(4X,'VARIABLE RELATIVE ERROR   ',6X,F10.5,4X,F10.5)
 2011 FORMAT(4X,'MASKED BOTTOM treshold 1  ',6X,F10.5,4X,F10.5)
 2012 FORMAT(4X,'MASKED BOTTOM treshold 2  ',6X,F10.5,4X,F10.5)
 2013 FORMAT(4X,'OUTLIERS BINS             ',6X,F10.5,4X,F10.5)
 2014 FORMAT(4X,'RELATIVE CORELATION LENGTH',6X,F10.5,4X,F10.5)
!
      stop
      end
      
      function mjd(y,m,d,s)
      implicit none
      integer d,m,y
      real s
      real*8 mjd

! Mathematicians and programmers have naturally 
! interested themselves in mathematical and computational 
! algorithms to convert between Julian day numbers and 
! Gregorian dates. The following conversion algorithm is due 
! to Henry F. Fliegel and Thomas C. Van Flandern: 
! The Julian day (jd) is computed from Gregorian day, month
! and year (d, m, y) as follows:
! http://hermetic.magnet.ch/cal_stud/jdn.htm

! ModifiedJulianDay = 0 for 1858-11-17 CE.

      mjd = (( 1461 * ( y + 4800 + ( m - 14 ) / 12 ) ) / 4 +    
     &       ( 367 * ( m - 2 - 12 * ( ( m - 14 ) / 12 ) ) ) / 12 -
     &       ( 3 * ( ( y + 4900 + ( m - 14 ) / 12 ) / 100 ) ) / 4 +
     &       d - 32075 - 2400001)*1d0 + s/(24*60*60d0)               

      end function mjd
