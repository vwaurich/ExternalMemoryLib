/** Handle External Memory
 *
 * @file
 * @author    vwaurich
 *
*/

#ifndef EXTERNALMEMORY_H
#define EXTERNALMEMORY_H

# define DllExport \
__declspec( dllexport )


#include "ModelicaUtilities.h"
#include <windows.h>
#include <mmsystem.h>
#include <stdlib.h>

#if defined(_MSC_VER) || defined(__CYGWIN__) || defined(__MINGW32__)

typedef struct {
	double* extMemArray;
	int size;
} extMemReal;

/** Constructor for ExternalMemory of type double*/
DllExport void* externalMemoryRealConstructor(int size);

/** Destructor for ExternalMemory of type double*/
DllExport void externalMemoryRealDestructor(void* extMemObj);

/** Set double data in ExternalMemory */
DllExport void setRealValueAt(void* extMemObj, int idx, double value);

/** Get double data in ExternalMemory */
DllExport void getRealValueAt(void* extMemObj, int idx, double* outValue);


#endif /* defined(_MSC_VER) */

#endif /* EXTERNALMEMORY_H */
