/** Handle External Memory
 *
 * @file
 * @author    vwaurich
 *
*/

#include "..\Include\ExternalMemory.h"

/** Constructor for real array
*/
DllExport void* externalMemoryRealConstructor(int size) {
	extMemReal* extMem = calloc(1, sizeof(extMemReal));
	extMem->size = size;
	extMem->extMemArray = (double*)calloc(size, sizeof(double));
    return (void*)extMem;
}

/** Destructor for real array
*/
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

/** Get data range in ExternalMemory
*/
DllExport void getRealRangeAt(void* extMemObj, int startIdx, int len,  double* outValue) {
	extMemReal* extMem = (extMemReal*)extMemObj;
	if (extMem->size >= (startIdx + len)) {
		memcpy(outValue, &extMem->extMemArray[startIdx], sizeof(double)*(len));
	}
	else
	{
		ModelicaFormatError("ExternalMemory::getRealRangeAt failed. The zero-based index [%d + %d]is higher than the array size %d.", startIdx, len, extMem->size);
	}
}
