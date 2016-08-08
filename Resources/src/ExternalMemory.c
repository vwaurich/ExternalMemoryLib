/** Handle External Memory
 *
 * @file
 * @author    vwaurich
 *
*/

#include "..\Include\ExternalMemory.h"


DllExport void* externalMemoryRealConstructor(int size) {
	extMemReal* extMem = calloc(1, sizeof(extMemReal));
	extMem->size = size;
	extMem->extMemArray = (double*)calloc(size, sizeof(double));
    return (void*)extMem;
}

DllExport void externalMemoryRealDestructor(void* extMemObj) {
	extMemReal* extMem = (extMemReal*)extMemObj;
    if (extMem) {
        free(extMem);
    }
}

/** Set data in ExternalMemory
 */
DllExport void setRealValueAt(void* extMemObj, int idx, double value) {
	extMemReal* extMem = (extMemReal*)extMemObj;
	if (extMem->size > idx) {
		extMem->extMemArray[idx] = value;
	}
	else {
		ModelicaFormatError("ExternalMemory::setRealValueAt failed! The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}

/** Get data in ExternalMemory
 */
DllExport void getRealValueAt(void* extMemObj, int idx, double* outValue) {
	extMemReal* extMem = (extMemReal*)extMemObj;
    if (extMem->size > idx) {
      outValue[0] = extMem->extMemArray[idx];
    }
	else
	{
	  ModelicaFormatError("ExternalMemory::getRealValueAt failed. The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}
