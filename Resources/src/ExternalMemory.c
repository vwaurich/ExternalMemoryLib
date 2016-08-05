/** Handle External Memory
 *
 * @file
 * @author    vwaurich
 *
*/

#include "..\Include\ExternalMemory.h"


DllExport void* externalMemoryRealConstructor(int size) {
    double *extMem = (double*) calloc(size,sizeof(double));
    return (void*) extMem;
}

DllExport void externalMemoryRealDestructor(void* extMemObj) {
    double* extMem = (double*)extMemObj;
    if (extMem) {
        free(extMem);
    }
}

/** Set data in ExternalMemory
 */
DllExport void setRealValueAt(void* extMemObj, int idx, double value) {
    double* extMem = (double*)extMemObj;
    if (extMem) {
    extMem[idx] = value;
    }
}

/** Get data in ExternalMemory
 */
DllExport void getRealValueAt(void* extMemObj, int idx, double* outValue) {
    double* extMem = (double*)extMemObj;
    if (extMem) {
      outValue[0] = extMem[idx];
    }
	else
	{
	  outValue[0] = -123456789.0;
	}
}
