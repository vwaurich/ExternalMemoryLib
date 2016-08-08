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


/*
--------- Functions for INTEGER type ---------
*/

/** Constructor for integer array
*/
DllExport void* externalMemoryIntConstructor(int size) {
	extMemInt* extMem = calloc(1, sizeof(extMemInt));
	extMem->size = size;
	extMem->extMemArray = (int*)calloc(size, sizeof(int));
	return (void*)extMem;
}

/** Destructor for Int array
*/
DllExport void externalMemoryIntDestructor(void* extMemObj) {
	extMemInt* extMem = (extMemInt*)extMemObj;
	if (extMem) {
		free(extMem);
	}
}

/** Set data in ExternalMemory
*/
DllExport void setIntValueAt(void* extMemObj, int idx, int value) {
	extMemInt* extMem = (extMemInt*)extMemObj;
	if (extMem->size > idx) {
		extMem->extMemArray[idx] = value;
	}
	else {
		ModelicaFormatError("ExternalMemory::setIntValueAt failed! The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}

/** Get data in ExternalMemory
*/
DllExport void getIntValueAt(void* extMemObj, int idx, int* outValue) {
	extMemInt* extMem = (extMemInt*)extMemObj;
	if (extMem->size > idx) {
		outValue[0] = extMem->extMemArray[idx];
	}
	else
	{
		ModelicaFormatError("ExternalMemory::getIntValueAt failed. The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}

/** Get data range in ExternalMemory
*/
DllExport void getIntRangeAt(void* extMemObj, int startIdx, int len, int* outValue) {
	extMemInt* extMem = (extMemInt*)extMemObj;
	if (extMem->size >= (startIdx + len)) {
		memcpy(outValue, &extMem->extMemArray[startIdx], sizeof(int)*(len));
	}
	else
	{
		ModelicaFormatError("ExternalMemory::getIntRangeAt failed. The zero-based index [%d + %d]is higher than the array size %d.", startIdx, len, extMem->size);
	}
}


/*
--------- Functions for BOOLEAN type ---------
*/

/** Constructor for Bool array
*/
DllExport void* externalMemoryBoolConstructor(int size) {
	extMemBool* extMem = calloc(1, sizeof(extMemBool));
	extMem->size = size;
	extMem->extMemArray = (boolean*)calloc(size, sizeof(boolean));
	return (void*)extMem;
}

/** Destructor for Bool array
*/
DllExport void externalMemoryBoolDestructor(void* extMemObj) {
	extMemBool* extMem = (extMemBool*)extMemObj;
	if (extMem) {
		free(extMem);
	}
}

/** Set data in ExternalMemory
*/
DllExport void setBoolValueAt(void* extMemObj, int idx, boolean value) {
	extMemBool* extMem = (extMemBool*)extMemObj;
	if (extMem->size > idx) {
		ModelicaFormatMessage(" setBoolValueAt\n");

		extMem->extMemArray[idx] = value;
	}
	else {
		ModelicaFormatError("ExternalMemory::setBoolValueAt failed! The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}

/** Get data in ExternalMemory
*/
DllExport void getBoolValueAt(void* extMemObj, int idx, boolean* outValue) {
	extMemBool* extMem = (extMemBool*)extMemObj;
	if (extMem->size > idx) {
		outValue[0] = extMem->extMemArray[idx];
	}
	else
	{
		ModelicaFormatError("ExternalMemory::getBoolValueAt failed. The zero-based index %d is higher than the array size %d.", idx, extMem->size);
	}
}

/** Get data range in ExternalMemory
*/
DllExport void getBoolRangeAt(void* extMemObj, int startIdx, int len, boolean* outValue) {
	extMemBool* extMem = (extMemBool*)extMemObj;
	if (extMem->size >= (startIdx + len)) {
		ModelicaFormatMessage(" extMemObj %d  %d  %d", extMem->extMemArray[0], extMem->extMemArray[1], extMem->extMemArray[2]);
		memcpy(outValue, &extMem->extMemArray[startIdx], sizeof(boolean)*(len));

	}
	else
	{
		ModelicaFormatError("ExternalMemory::getBoolRangeAt failed. The zero-based index [%d + %d]is higher than the array size %d.", startIdx, len, extMem->size);
	}
	ModelicaFormatMessage(" outValue %d  %d  %d", outValue[0], outValue[1], outValue[2]);
}
