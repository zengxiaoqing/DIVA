MODULE array3DInterface
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
   USE modulearrayInteger2Definition
   USE modulearrayInteger4Definition
   USE modulearrayInteger8Definition
   USE modulearrayReal4Definition
   USE modulearrayReal8Definition

   USE modulearrayInteger2, ONLY : &
                           arrayGetValuesInteger2 => arrayGetValues,  &
                           arrayGetValueInteger2 => arrayGetValue, &
                           arrayGetAllocationStatusInteger2 => arrayGetAllocationStatus, &
                           arrayGetPointerOnValueInteger2 => arrayGetPointerOnValue, &
                           arrayArraySetToZeroInteger2 => arrayArraySetToZero, &
                           arrayArraySetToValueInteger2 => arrayArraySetToValue, &
                           arrayArrayInsertValueInteger2 => arrayArrayInsertValue, &
                           arrayArrayAddValueInteger2 => arrayArrayAddValue, &
                           arrayArrayFastInsertValueInteger2 => arrayArrayFastInsertValue, &
                           arrayArrayFastAddValueInteger2 => arrayArrayFastAddValue, &
                           arraySetIncreaseSizeInteger2 => arraySetIncreaseSize, &
                           arrayDestructorInteger2 => arrayDestructor, &
                           arrayPrintInformationInteger2 => arrayPrintInformation, &
                           arrayCreateBaseInteger2 => arrayCreateBase, &
                           arrayCreateWithDimensionInteger2 => arrayCreateWithDimension, &
                           arrayCreateWithDimensionAndFirstIndexInteger2 => arrayCreateWithDimensionAndFirstIndex, &
                           arraySetSizeInteger2 => arraySetSize, &
                           arrayGetFirstIndexXInteger2 => arrayGetFirstIndexX, &
                           arrayGetLastIndexXInteger2 => arrayGetLastIndexX, &
                           arrayGetSizeXInteger2 => arrayGetSizeX, &
                           arrayGetAllocatedSizeXInteger2 => arrayGetAllocatedSizeX , &
                           arrayGetIncreaseSizeXInteger2 => arrayGetIncreaseSizeX, &
                           arraySetIncreaseSizeXInteger2 => arraySetIncreaseSizeX, &
                           arrayGetFirstIndexYInteger2 => arrayGetFirstIndexY, &
                           arrayGetLastIndexYInteger2 => arrayGetLastIndexY, &
                           arrayGetSizeYInteger2 => arrayGetSizeY, &
                           arrayGetAllocatedSizeYInteger2 => arrayGetAllocatedSizeY , &
                           arrayGetIncreaseSizeYInteger2 => arrayGetIncreaseSizeY, &
                           arraySetIncreaseSizeYInteger2 => arraySetIncreaseSizeY, &
                           arrayArrayMinInteger2 => arrayArrayMin, &
                           arrayArrayMaxInteger2 => arrayArrayMax, &
                           arrayArrayAbsMinInteger2 => arrayArrayAbsMin, &
                           arrayArrayAbsMaxInteger2 => arrayArrayAbsMax, &
                           arrayGetFirstIndexZInteger2 => arrayGetFirstIndexZ, &
                           arrayGetLastIndexZInteger2 => arrayGetLastIndexZ, &
                           arrayGetSizeZInteger2 => arrayGetSizeZ, &
                           arrayGetAllocatedSizeZInteger2 => arrayGetAllocatedSizeZ , &
                           arrayGetIncreaseSizeZInteger2 => arrayGetIncreaseSizeZ, &
                           arraySetIncreaseSizeZInteger2 => arraySetIncreaseSizeZ

   USE modulearrayInteger4, ONLY : &
                           arrayGetValuesInteger4 => arrayGetValues,  &
                           arrayGetValueInteger4 => arrayGetValue, &
                           arrayGetAllocationStatusInteger4 => arrayGetAllocationStatus, &
                           arrayGetPointerOnValueInteger4 => arrayGetPointerOnValue, &
                           arrayArraySetToZeroInteger4 => arrayArraySetToZero, &
                           arrayArraySetToValueInteger4 => arrayArraySetToValue, &
                           arrayArrayInsertValueInteger4 => arrayArrayInsertValue, &
                           arrayArrayAddValueInteger4 => arrayArrayAddValue, &
                           arrayArrayFastInsertValueInteger4 => arrayArrayFastInsertValue, &
                           arrayArrayFastAddValueInteger4 => arrayArrayFastAddValue, &
                           arraySetIncreaseSizeInteger4 => arraySetIncreaseSize, &
                           arrayDestructorInteger4 => arrayDestructor, &
                           arrayPrintInformationInteger4 => arrayPrintInformation, &
                           arrayCreateBaseInteger4 => arrayCreateBase, &
                           arrayCreateWithDimensionInteger4 => arrayCreateWithDimension, &
                           arrayCreateWithDimensionAndFirstIndexInteger4 => arrayCreateWithDimensionAndFirstIndex, &
                           arraySetSizeInteger4 => arraySetSize, &
                           arrayGetFirstIndexXInteger4 => arrayGetFirstIndexX, &
                           arrayGetLastIndexXInteger4 => arrayGetLastIndexX, &
                           arrayGetSizeXInteger4 => arrayGetSizeX, &
                           arrayGetAllocatedSizeXInteger4 => arrayGetAllocatedSizeX , &
                           arrayGetIncreaseSizeXInteger4 => arrayGetIncreaseSizeX, &
                           arraySetIncreaseSizeXInteger4 => arraySetIncreaseSizeX, &
                           arrayGetFirstIndexYInteger4 => arrayGetFirstIndexY, &
                           arrayGetLastIndexYInteger4 => arrayGetLastIndexY, &
                           arrayGetSizeYInteger4 => arrayGetSizeY, &
                           arrayGetAllocatedSizeYInteger4 => arrayGetAllocatedSizeY , &
                           arrayGetIncreaseSizeYInteger4 => arrayGetIncreaseSizeY, &
                           arraySetIncreaseSizeYInteger4 => arraySetIncreaseSizeY, &
                           arrayArrayMinInteger4 => arrayArrayMin, &
                           arrayArrayMaxInteger4 => arrayArrayMax, &
                           arrayArrayAbsMinInteger4 => arrayArrayAbsMin, &
                           arrayArrayAbsMaxInteger4 => arrayArrayAbsMax, &
                           arrayGetFirstIndexZInteger4 => arrayGetFirstIndexZ, &
                           arrayGetLastIndexZInteger4 => arrayGetLastIndexZ, &
                           arrayGetSizeZInteger4 => arrayGetSizeZ, &
                           arrayGetAllocatedSizeZInteger4 => arrayGetAllocatedSizeZ , &
                           arrayGetIncreaseSizeZInteger4 => arrayGetIncreaseSizeZ, &
                           arraySetIncreaseSizeZInteger4 => arraySetIncreaseSizeZ

   USE modulearrayInteger8, ONLY : &
                           arrayGetValuesInteger8 => arrayGetValues,  &
                           arrayGetValueInteger8 => arrayGetValue, &
                           arrayGetAllocationStatusInteger8 => arrayGetAllocationStatus, &
                           arrayGetPointerOnValueInteger8 => arrayGetPointerOnValue, &
                           arrayArraySetToZeroInteger8 => arrayArraySetToZero, &
                           arrayArraySetToValueInteger8 => arrayArraySetToValue, &
                           arrayArrayInsertValueInteger8 => arrayArrayInsertValue, &
                           arrayArrayAddValueInteger8 => arrayArrayAddValue, &
                           arrayArrayFastInsertValueInteger8 => arrayArrayFastInsertValue, &
                           arrayArrayFastAddValueInteger8 => arrayArrayFastAddValue, &
                           arraySetIncreaseSizeInteger8 => arraySetIncreaseSize, &
                           arrayDestructorInteger8 => arrayDestructor, &
                           arrayPrintInformationInteger8 => arrayPrintInformation, &
                           arrayCreateBaseInteger8 => arrayCreateBase, &
                           arrayCreateWithDimensionInteger8 => arrayCreateWithDimension, &
                           arrayCreateWithDimensionAndFirstIndexInteger8 => arrayCreateWithDimensionAndFirstIndex, &
                           arraySetSizeInteger8 => arraySetSize, &
                           arrayGetFirstIndexXInteger8 => arrayGetFirstIndexX, &
                           arrayGetLastIndexXInteger8 => arrayGetLastIndexX, &
                           arrayGetSizeXInteger8 => arrayGetSizeX, &
                           arrayGetAllocatedSizeXInteger8 => arrayGetAllocatedSizeX , &
                           arrayGetIncreaseSizeXInteger8 => arrayGetIncreaseSizeX, &
                           arraySetIncreaseSizeXInteger8 => arraySetIncreaseSizeX, &
                           arrayGetFirstIndexYInteger8 => arrayGetFirstIndexY, &
                           arrayGetLastIndexYInteger8 => arrayGetLastIndexY, &
                           arrayGetSizeYInteger8 => arrayGetSizeY, &
                           arrayGetAllocatedSizeYInteger8 => arrayGetAllocatedSizeY , &
                           arrayGetIncreaseSizeYInteger8 => arrayGetIncreaseSizeY, &
                           arraySetIncreaseSizeYInteger8 => arraySetIncreaseSizeY, &
                           arrayArrayMinInteger8 => arrayArrayMin, &
                           arrayArrayMaxInteger8 => arrayArrayMax, &
                           arrayArrayAbsMinInteger8 => arrayArrayAbsMin, &
                           arrayArrayAbsMaxInteger8 => arrayArrayAbsMax, &
                           arrayGetFirstIndexZInteger8 => arrayGetFirstIndexZ, &
                           arrayGetLastIndexZInteger8 => arrayGetLastIndexZ, &
                           arrayGetSizeZInteger8 => arrayGetSizeZ, &
                           arrayGetAllocatedSizeZInteger8 => arrayGetAllocatedSizeZ , &
                           arrayGetIncreaseSizeZInteger8 => arrayGetIncreaseSizeZ, &
                           arraySetIncreaseSizeZInteger8 => arraySetIncreaseSizeZ

   USE modulearrayReal4, ONLY : &
                           arrayGetValuesReal4 => arrayGetValues,  &
                           arrayGetValueReal4 => arrayGetValue, &
                           arrayGetAllocationStatusReal4 => arrayGetAllocationStatus, &
                           arrayGetPointerOnValueReal4 => arrayGetPointerOnValue, &
                           arrayArraySetToZeroReal4 => arrayArraySetToZero, &
                           arrayArraySetToValueReal4 => arrayArraySetToValue, &
                           arrayArrayInsertValueReal4 => arrayArrayInsertValue, &
                           arrayArrayAddValueReal4 => arrayArrayAddValue, &
                           arrayArrayFastInsertValueReal4 => arrayArrayFastInsertValue, &
                           arrayArrayFastAddValueReal4 => arrayArrayFastAddValue, &
                           arraySetIncreaseSizeReal4 => arraySetIncreaseSize, &
                           arrayDestructorReal4 => arrayDestructor, &
                           arrayPrintInformationReal4 => arrayPrintInformation, &
                           arrayCreateBaseReal4 => arrayCreateBase, &
                           arrayCreateWithDimensionReal4 => arrayCreateWithDimension, &
                           arrayCreateWithDimensionAndFirstIndexReal4 => arrayCreateWithDimensionAndFirstIndex, &
                           arraySetSizeReal4 => arraySetSize, &
                           arrayGetFirstIndexXReal4 => arrayGetFirstIndexX, &
                           arrayGetLastIndexXReal4 => arrayGetLastIndexX, &
                           arrayGetSizeXReal4 => arrayGetSizeX, &
                           arrayGetAllocatedSizeXReal4 => arrayGetAllocatedSizeX , &
                           arrayGetIncreaseSizeXReal4 => arrayGetIncreaseSizeX, &
                           arraySetIncreaseSizeXReal4 => arraySetIncreaseSizeX, &
                           arrayGetFirstIndexYReal4 => arrayGetFirstIndexY, &
                           arrayGetLastIndexYReal4 => arrayGetLastIndexY, &
                           arrayGetSizeYReal4 => arrayGetSizeY, &
                           arrayGetAllocatedSizeYReal4 => arrayGetAllocatedSizeY , &
                           arrayGetIncreaseSizeYReal4 => arrayGetIncreaseSizeY, &
                           arraySetIncreaseSizeYReal4 => arraySetIncreaseSizeY, &
                           arrayArrayMinReal4 => arrayArrayMin, arrayArrayMaxReal4 => arrayArrayMax, &
                           arrayArrayAbsMinReal4 => arrayArrayAbsMin, arrayArrayAbsMaxReal4 => arrayArrayAbsMax, &
                           arrayArrayNorm1Real4 => arrayArrayNorm1, arrayArrayNorm2Real4 => arrayArrayNorm2, &
                           arrayArrayNormInfinityReal4 => arrayArrayNormInfinity, arrayArrayNormReal4 => arrayArrayNorm, &
                           arrayArraySqrtReal4 => arrayArraySqrt, arrayArraySumReal4 => arrayArraySum, &
                           arrayArrayScaleReal4 => arrayArrayScale, arrayGetFirstIndexZReal4 => arrayGetFirstIndexZ, &
                           arrayGetLastIndexZReal4 => arrayGetLastIndexZ, arrayGetSizeZReal4 => arrayGetSizeZ, &
                           arrayGetAllocatedSizeZReal4 => arrayGetAllocatedSizeZ , &
                           arrayGetIncreaseSizeZReal4 => arrayGetIncreaseSizeZ, &
                           arraySetIncreaseSizeZReal4 => arraySetIncreaseSizeZ

   USE modulearrayReal8, ONLY : &
                           arrayGetValuesReal8 => arrayGetValues,  arrayGetValueReal8 => arrayGetValue, &
                           arrayGetAllocationStatusReal8 => arrayGetAllocationStatus, &
                           arrayGetPointerOnValueReal8 => arrayGetPointerOnValue, &
                           arrayArraySetToZeroReal8 => arrayArraySetToZero, arrayArraySetToValueReal8 => arrayArraySetToValue, &
                           arrayArrayInsertValueReal8 => arrayArrayInsertValue, &
                           arrayArrayAddValueReal8 => arrayArrayAddValue, &
                           arrayArrayFastInsertValueReal8 => arrayArrayFastInsertValue, &
                           arrayArrayFastAddValueReal8 => arrayArrayFastAddValue, &
                           arraySetIncreaseSizeReal8 => arraySetIncreaseSize, &
                           arrayDestructorReal8 => arrayDestructor, arrayPrintInformationReal8 => arrayPrintInformation, &
                           arrayCreateBaseReal8 => arrayCreateBase, &
                           arrayCreateWithDimensionReal8 => arrayCreateWithDimension, &
                           arrayCreateWithDimensionAndFirstIndexReal8 => arrayCreateWithDimensionAndFirstIndex, &
                           arraySetSizeReal8 => arraySetSize, arrayGetFirstIndexXReal8 => arrayGetFirstIndexX, &
                           arrayGetLastIndexXReal8 => arrayGetLastIndexX, &
                           arrayGetSizeXReal8 => arrayGetSizeX, &
                           arrayGetAllocatedSizeXReal8 => arrayGetAllocatedSizeX , &
                           arrayGetIncreaseSizeXReal8 => arrayGetIncreaseSizeX, &
                           arrayGetDefaultIncreaseSizeXReal8 => arrayGetDefaultIncreaseSizeX, &
                           arraySetIncreaseSizeXReal8 => arraySetIncreaseSizeX, &
                           arrayGetFirstIndexYReal8 => arrayGetFirstIndexY, &
                           arrayGetLastIndexYReal8 => arrayGetLastIndexY, &
                           arrayGetSizeYReal8 => arrayGetSizeY, &
                           arrayGetAllocatedSizeYReal8 => arrayGetAllocatedSizeY , &
                           arrayGetIncreaseSizeYReal8 => arrayGetIncreaseSizeY, &
                           arrayGetDefaultIncreaseSizeYReal8 => arrayGetDefaultIncreaseSizeY, &
                           arraySetIncreaseSizeYReal8 => arraySetIncreaseSizeY, &
                           arrayArrayMinReal8 => arrayArrayMin, arrayArrayMaxReal8 => arrayArrayMax, &
                           arrayArrayAbsMinReal8 => arrayArrayAbsMin, arrayArrayAbsMaxReal8 => arrayArrayAbsMax, &
                           arrayArrayNorm1Real8 => arrayArrayNorm1, arrayArrayNorm2Real8 => arrayArrayNorm2, &
                           arrayArrayNormInfinityReal8 => arrayArrayNormInfinity, &
                           arrayArrayNormReal8 => arrayArrayNorm, arrayArraySqrtReal8 => arrayArraySqrt, &
                           arrayArraySumReal8 => arrayArraySum, arrayArrayScaleReal8 => arrayArrayScale, &
                           arrayGetFirstIndexZReal8 => arrayGetFirstIndexZ, arrayGetLastIndexZReal8 => arrayGetLastIndexZ, &
                           arrayGetSizeZReal8 => arrayGetSizeZ, arrayGetAllocatedSizeZReal8 => arrayGetAllocatedSizeZ , &
                           arrayGetIncreaseSizeZReal8 => arrayGetIncreaseSizeZ, &
                           arrayGetDefaultIncreaseSizeZReal8 => arrayGetDefaultIncreaseSizeZ, &
                           arraySetIncreaseSizeZReal8 => arraySetIncreaseSizeZ


! Interface
! =========
   INTERFACE array3DCreate
      MODULE PROCEDURE arrayCreateBaseReal8, arrayCreateWithDimensionReal8, arrayCreateWithDimensionAndFirstIndexReal8, &
                       arrayCreateBaseReal4, arrayCreateWithDimensionReal4, arrayCreateWithDimensionAndFirstIndexReal4, &
                   arrayCreateBaseInteger2, arrayCreateWithDimensionInteger2, arrayCreateWithDimensionAndFirstIndexInteger2, &
                   arrayCreateBaseInteger4, arrayCreateWithDimensionInteger4, arrayCreateWithDimensionAndFirstIndexInteger4, &
                   arrayCreateBaseInteger8, arrayCreateWithDimensionInteger8, arrayCreateWithDimensionAndFirstIndexInteger8
   END INTERFACE

   INTERFACE array3DPrint
      MODULE PROCEDURE arrayPrintInformationReal8, arrayPrintInformationReal4, &
                       arrayPrintInformationInteger2, arrayPrintInformationInteger4, arrayPrintInformationInteger8
   END INTERFACE

   INTERFACE array3DDestroy
      MODULE PROCEDURE arrayDestructorReal8, arrayDestructorReal4, &
                       arrayDestructorInteger2, arrayDestructorInteger4, arrayDestructorInteger8
   END INTERFACE

   INTERFACE array3DSetSize
      MODULE PROCEDURE arraySetSizeReal8, arraySetSizeReal4, &
                       arraySetSizeInteger2, arraySetSizeInteger4, arraySetSizeInteger8
   END INTERFACE

   INTERFACE array3DGetSizeX
      MODULE PROCEDURE arrayGetSizeXReal8, arrayGetSizeXReal4,&
                       arrayGetSizeXInteger2, arrayGetSizeXInteger4, arrayGetSizeXInteger8
   END INTERFACE

   INTERFACE array3DGetSizeY
      MODULE PROCEDURE arrayGetSizeYReal8, arrayGetSizeYReal4,&
                       arrayGetSizeYInteger2, arrayGetSizeYInteger4, arrayGetSizeYInteger8
   END INTERFACE

   INTERFACE array3DGetSizeZ
      MODULE PROCEDURE arrayGetSizeZReal8, arrayGetSizeZReal4,&
                       arrayGetSizeZInteger2, arrayGetSizeZInteger4, arrayGetSizeZInteger8
   END INTERFACE

   INTERFACE array3DSetToZero
      MODULE PROCEDURE arrayArraySetToZeroReal8, arrayArraySetToZeroReal4, &
                       arrayArraySetToZeroInteger2, arrayArraySetToZeroInteger4, arrayArraySetToZeroInteger8
   END INTERFACE

   INTERFACE array3DSetToValue
      MODULE PROCEDURE arrayArraySetToValueReal8, arrayArraySetToValueReal4, &
                       arrayArraySetToValueInteger2, arrayArraySetToValueInteger4, arrayArraySetToValueInteger8
   END INTERFACE

   INTERFACE array3DNorm1
      MODULE PROCEDURE arrayArrayNorm1Real8, arrayArrayNorm1Real4
   END INTERFACE

   INTERFACE array3DNorm2
      MODULE PROCEDURE arrayArrayNorm2Real8, arrayArrayNorm2Real4
   END INTERFACE

   INTERFACE array3DNormInfinity
      MODULE PROCEDURE  arrayArrayNormInfinityReal8, arrayArrayNormInfinityReal4
   END INTERFACE

   INTERFACE array3DSqrt
      MODULE PROCEDURE arrayArraySqrtReal8, arrayArraySqrtReal4
   END INTERFACE

   INTERFACE array3DSum
      MODULE PROCEDURE arrayArraySumReal8, arrayArraySumReal4
   END INTERFACE

   INTERFACE array3DMin
      MODULE PROCEDURE arrayArrayMinReal8, arrayArrayMinReal4, &
                       arrayArrayMinInteger2, arrayArrayMinInteger4, arrayArrayMinInteger8
   END INTERFACE

   INTERFACE array3DMax
      MODULE PROCEDURE arrayArrayMaxReal8, arrayArrayMaxReal4, &
                       arrayArrayMaxInteger2, arrayArrayMaxInteger4, arrayArrayMaxInteger8
   END INTERFACE

   INTERFACE array3DAbsMin
      MODULE PROCEDURE arrayArrayAbsMinReal8, arrayArrayAbsMinReal4, &
                       arrayArrayAbsMinInteger2, arrayArrayAbsMinInteger4, arrayArrayAbsMinInteger8
   END INTERFACE

   INTERFACE array3DAbsMax
      MODULE PROCEDURE arrayArrayAbsMaxReal8, arrayArrayAbsMaxReal4, &
                       arrayArrayAbsMaxInteger2, arrayArrayAbsMaxInteger4, arrayArrayAbsMaxInteger8
   END INTERFACE

   INTERFACE array3DInsertValue
      MODULE PROCEDURE arrayArrayInsertValueReal8, arrayArrayInsertValueReal4, &
                       arrayArrayInsertValueInteger2, arrayArrayInsertValueInteger4, arrayArrayInsertValueInteger8
   END INTERFACE

   INTERFACE array3DAddValue
      MODULE PROCEDURE arrayArrayAddValueReal8, arrayArrayAddValueReal4, &
                       arrayArrayAddValueInteger2, arrayArrayAddValueInteger4, arrayArrayAddValueInteger8
   END INTERFACE

   INTERFACE array3DFastInsertValue
      MODULE PROCEDURE arrayArrayFastInsertValueReal8, arrayArrayFastInsertValueReal4, &
                       arrayArrayFastInsertValueInteger2, arrayArrayFastInsertValueInteger4, arrayArrayFastInsertValueInteger8
   END INTERFACE

   INTERFACE array3DFastAddValue
      MODULE PROCEDURE arrayArrayFastAddValueReal8, arrayArrayFastAddValueReal4, &
                       arrayArrayFastAddValueInteger2, arrayArrayFastAddValueInteger4, arrayArrayFastAddValueInteger8
   END INTERFACE

   INTERFACE array3DScale
      MODULE PROCEDURE arrayArrayScaleReal8, arrayArrayScaleReal4
   END INTERFACE

   INTERFACE array3DGetValue
      MODULE PROCEDURE arrayGetValueReal8, arrayGetValueReal4, &
                       arrayGetValueInteger2, arrayGetValueInteger4, arrayGetValueInteger8
   END INTERFACE

   INTERFACE array3DNorm
      MODULE PROCEDURE arrayArrayNormReal8, arrayArrayNormReal4
   END INTERFACE

   INTERFACE array3DGetValues
      MODULE PROCEDURE arrayGetValuesReal8, arrayGetValuesReal4, &
                       arrayGetValuesInteger2, arrayGetValuesInteger4, arrayGetValuesInteger8
   END INTERFACE

   INTERFACE array3DGetFirstIndexX
      MODULE PROCEDURE arrayGetFirstIndexXReal8, arrayGetFirstIndexXReal4, &
                       arrayGetFirstIndexXInteger2, arrayGetFirstIndexXInteger4, arrayGetFirstIndexXInteger8
   END INTERFACE

   INTERFACE array3DGetFirstIndexY
      MODULE PROCEDURE arrayGetFirstIndexYReal8, arrayGetFirstIndexYReal4, &
                       arrayGetFirstIndexYInteger2, arrayGetFirstIndexYInteger4, arrayGetFirstIndexYInteger8
   END INTERFACE

   INTERFACE array3DGetFirstIndexZ
      MODULE PROCEDURE arrayGetFirstIndexZReal8, arrayGetFirstIndexZReal4, &
                       arrayGetFirstIndexZInteger2, arrayGetFirstIndexZInteger4, arrayGetFirstIndexZInteger8
   END INTERFACE

   INTERFACE array3DGetLastIndexX
      MODULE PROCEDURE arrayGetLastIndexXReal8, arrayGetLastIndexXReal4, &
                       arrayGetLastIndexXInteger2, arrayGetLastIndexXInteger4, arrayGetLastIndexXInteger8
   END INTERFACE

   INTERFACE array3DGetLastIndexY
      MODULE PROCEDURE arrayGetLastIndexYReal8, arrayGetLastIndexYReal4, &
                       arrayGetLastIndexYInteger2, arrayGetLastIndexYInteger4, arrayGetLastIndexYInteger8
   END INTERFACE

   INTERFACE array3DGetLastIndexZ
      MODULE PROCEDURE arrayGetLastIndexZReal8, arrayGetLastIndexZReal4, &
                       arrayGetLastIndexZInteger2, arrayGetLastIndexZInteger4, arrayGetLastIndexZInteger8
   END INTERFACE

   INTERFACE array3DGetAllocationStatus
      MODULE PROCEDURE arrayGetAllocationStatusReal8, arrayGetAllocationStatusReal4, &
                       arrayGetAllocationStatusInteger2, arrayGetAllocationStatusInteger4, arrayGetAllocationStatusInteger8
   END INTERFACE

   INTERFACE array3DGetAllocatedSizeX
      MODULE PROCEDURE arrayGetAllocatedSizeXReal8, arrayGetAllocatedSizeXReal4, &
                       arrayGetAllocatedSizeXInteger2, arrayGetAllocatedSizeXInteger4, arrayGetAllocatedSizeXInteger8
   END INTERFACE

   INTERFACE array3DGetAllocatedSizeY
      MODULE PROCEDURE arrayGetAllocatedSizeYReal8, arrayGetAllocatedSizeYReal4, &
                       arrayGetAllocatedSizeYInteger2, arrayGetAllocatedSizeYInteger4, arrayGetAllocatedSizeYInteger8
   END INTERFACE

   INTERFACE array3DGetAllocatedSizeZ
      MODULE PROCEDURE arrayGetAllocatedSizeZReal8, arrayGetAllocatedSizeZReal4, &
                       arrayGetAllocatedSizeZInteger2, arrayGetAllocatedSizeZInteger4, arrayGetAllocatedSizeZInteger8
   END INTERFACE

   INTERFACE array3DGetPointerOnValue
      MODULE PROCEDURE arrayGetPointerOnValueReal8, arrayGetPointerOnValueReal4, &
                       arrayGetPointerOnValueInteger2, arrayGetPointerOnValueInteger4, arrayGetPointerOnValueInteger8
   END INTERFACE

   INTERFACE array3DGetDefaultIncreaseSizeX
      MODULE PROCEDURE arrayGetDefaultIncreaseSizeXReal8
   END INTERFACE

   INTERFACE array3DGetIncreaseSizeX
      MODULE PROCEDURE arrayGetIncreaseSizeXReal8, arrayGetIncreaseSizeXReal4, &
                       arrayGetIncreaseSizeXInteger2, arrayGetIncreaseSizeXInteger4, arrayGetIncreaseSizeXInteger8
   END INTERFACE

   INTERFACE array3DSetIncreaseSizeX
      MODULE PROCEDURE arraySetIncreaseSizeXReal8, arraySetIncreaseSizeXReal4, &
                       arraySetIncreaseSizeXInteger2, arraySetIncreaseSizeXInteger4, arraySetIncreaseSizeXInteger8
   END INTERFACE

   INTERFACE array3DGetDefaultIncreaseSizeY
      MODULE PROCEDURE arrayGetDefaultIncreaseSizeYReal8
   END INTERFACE

   INTERFACE array3DGetIncreaseSizeY
      MODULE PROCEDURE arrayGetIncreaseSizeYReal8, arrayGetIncreaseSizeYReal4, &
                       arrayGetIncreaseSizeYInteger2, arrayGetIncreaseSizeYInteger4, arrayGetIncreaseSizeYInteger8
   END INTERFACE

   INTERFACE array3DSetIncreaseSizeY
      MODULE PROCEDURE arraySetIncreaseSizeYReal8, arraySetIncreaseSizeYReal4, &
                       arraySetIncreaseSizeYInteger2, arraySetIncreaseSizeYInteger4, arraySetIncreaseSizeYInteger8
   END INTERFACE

   INTERFACE array3DGetDefaultIncreaseSizeZ
      MODULE PROCEDURE arrayGetDefaultIncreaseSizeZReal8
   END INTERFACE

   INTERFACE array3DGetIncreaseSizeZ
      MODULE PROCEDURE arrayGetIncreaseSizeZReal8, arrayGetIncreaseSizeZReal4, &
                       arrayGetIncreaseSizeZInteger2, arrayGetIncreaseSizeZInteger4, arrayGetIncreaseSizeZInteger8
   END INTERFACE

   INTERFACE array3DSetIncreaseSizeZ
      MODULE PROCEDURE arraySetIncreaseSizeZReal8, arraySetIncreaseSizeZReal4, &
                       arraySetIncreaseSizeZInteger2, arraySetIncreaseSizeZInteger4, arraySetIncreaseSizeZInteger8
   END INTERFACE

END MODULE array3DInterface
