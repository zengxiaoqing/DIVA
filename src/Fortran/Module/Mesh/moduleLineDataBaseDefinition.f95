MODULE moduleLineDataBaseDefinition

! ============================================================
! ============================================================
! ============================================================
! ===                                                      ===
! ===                                                      ===
! ===                  Module specifications               ===
! ===                                                      ===
! ===                                                      ===
! ============================================================
! ============================================================
! ============================================================

! Include file
! ============
   USE moduleLineDefinition
   USE moduleNodeDataBaseDefinition, ONLY : printNode => printInformation

! Declaration
! ===========

! Procedures status
! =================

!  General part
!  ------------
   PUBLIC :: printInformation, initialise


! ============================================================
! ============================================================
! ============================================================
! ===                                                      ===
! ===                                                      ===
! ===                  Module procedures                   ===
! ===                                                      ===
! ===                                                      ===
! ============================================================
! ============================================================
! ============================================================
 CONTAINS


! =============================================================
! ===            Internal procedure ("PUBLIC")  : Others    ===
! =============================================================
! Procedure 1 : print Information
! --------------------------------
SUBROUTINE printInformation(output,ptr)

!     Declaration
!     - - - - - -
      INTEGER :: output
      TYPE(lineType), POINTER :: ptr
      TYPE(nodeType), POINTER :: ptrNode

!     Body
!     - - -
      WRITE(output,*)    'object type is line'
      WRITE(output,*)    '   index  = ', ptr%indexValue
      ptrNode => ptr%startNode
      CALL printNode(output,ptrNode)
      ptrNode => ptr%endNode
      CALL printNode(output,ptrNode)
      WRITE(output,*)    ' '

END SUBROUTINE

! Procedure 2 : initialise
! ------------------------
SUBROUTINE initialise(ptrTarget,indexValue)

!     Declaration
!     - - - - - -
      INTEGER, INTENT(IN) :: indexValue
      TYPE(lineType), INTENT(INOUT) :: ptrTarget

!     Body
!     - - -
!      ptrTarget%startNode => NULL()
!      ptrTarget%endNode => NULL()
      ptrTarget%startNode = nodeType(0.,0.,0.,0,0.)
      ptrTarget%endNode = nodeType(0.,0.,0.,0,0.)

      ptrTarget%indexValue = indexValue
      ptrTarget%characteristicLength = 0.

END SUBROUTINE

END MODULE moduleLineDataBaseDefinition
