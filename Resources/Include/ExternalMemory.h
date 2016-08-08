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

typedef struct {
	double* extMemArray;
	int size;
	double time;
} extMemRealTC;

typedef struct {
	int* extMemArray;
	int size;
} extMemInt;

typedef struct {
	boolean* extMemArray;
	int size;
} extMemBool;

/*
--------- Functions for REAL type --------- 
*/

/** Constructor for ExternalMemory of type double*/
DllExport void* externalMemoryRealConstructor(int size);

/** Destructor for ExternalMemory of type double*/
DllExport void externalMemoryRealDestructor(void* extMemObj);

/** Set double data in ExternalMemory */
DllExport void setRealValueAt(void* extMemObj, int idx, double value);

/** Get double data in ExternalMemory */
DllExport void getRealValueAt(void* extMemObj, int idx, double* outValue);

/** Get double range data in ExternalMemory */
DllExport void getRealRangeAt(void* extMemObj, int startIdx, int len, double* outValue);

/*
--------- Functions for INTEGER type ---------
*/

/** Constructor for ExternalMemory of type double*/
DllExport void* externalMemoryIntConstructor(int size);

/** Destructor for ExternalMemory of type double*/
DllExport void externalMemoryIntDestructor(void* extMemObj);

/** Set double data in ExternalMemory */
DllExport void setIntValueAt(void* extMemObj, int idx, int value);

/** Get double data in ExternalMemory */
DllExport void getIntValueAt(void* extMemObj, int idx, int* outValue);

/** Get double range data in ExternalMemory */
DllExport void getIntRangeAt(void* extMemObj, int startIdx, int len, int* outValue);

/*
--------- Functions for BOOLEAN type ---------
*/

/** Constructor for ExternalMemory of type boolean*/
DllExport void* externalMemoryBoolConstructor(int size);

/** Destructor for ExternalMemory of type boolean*/
DllExport void externalMemoryBoolDestructor(void* extMemObj);

/** Set boolean data in ExternalMemory */
DllExport void setBoolValueAt(void* extMemObj, int idx, boolean value);

/** Get boolean data in ExternalMemory */
DllExport void getBoolValueAt(void* extMemObj, int idx, boolean* outValue);

/** Get boolean range data in ExternalMemory */
DllExport void getBoolRangeAt(void* extMemObj, int startIdx, int len, boolean* outValue);

/*
--------- Functions for REAL type  with time control ---------
*/

/** Constructor for ExternalMemory of type double with time control*/
DllExport void* externalMemoryRealTCConstructor(int size, double time);

/** Destructor for ExternalMemory of type double with time control*/
DllExport void externalMemoryRealTCDestructor(void* extMemObj);

/** Set double data in ExternalMemory with time control*/
DllExport void setRealValueAtWithTC(void* extMemObj, int idx, double value);

/** Get double data in ExternalMemory  with time control*/
DllExport void getRealValueAtWithTC(void* extMemObj, int idx, double* outValue, double time, double fallbackValue);

/** Get double range data in ExternalMemory  with time control*/
DllExport void getRealRangeAtWithTC(void* extMemObj, int startIdx, int len, double* outValue, double time, double* fallBackArray);


#endif /* defined(_MSC_VER) */

#endif /* EXTERNALMEMORY_H */
