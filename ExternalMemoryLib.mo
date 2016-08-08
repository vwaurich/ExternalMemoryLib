within ;
package ExternalMemoryLib
  class ExternalMemoryReal " An object for external memory"
    extends ExternalObject;
    function constructor
      "Creates an instance of an external array of type double."
      input Integer size = 1 "size of the array";
      output ExternalMemoryReal extMem;
      external "C" extMem =  externalMemoryRealConstructor(size)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end constructor;

    function destructor
      input ExternalMemoryReal extMem;
      external "C" externalMemoryRealDestructor(extMem)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end destructor;
  end ExternalMemoryReal;

  class ExternalMemoryInt " An object for external memory"
    extends ExternalObject;
    function constructor
      "Creates an instance of an external array of type double."
      input Integer size = 1 "size of the array";
      output ExternalMemoryInt extMem;
      external "C" extMem =  externalMemoryIntConstructor(size)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end constructor;

    function destructor
      input ExternalMemoryInt extMem;
      external "C" externalMemoryIntDestructor(extMem)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end destructor;
  end ExternalMemoryInt;

  class ExternalMemoryBool " An object for external memory"
    extends ExternalObject;
    function constructor
      "Creates an instance of an external array of type double."
      input Integer size = 1 "size of the array";
      output ExternalMemoryBool extMem;
      external "C" extMem =  externalMemoryBoolConstructor(size)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end constructor;

    function destructor
      input ExternalMemoryBool extMem;
      external "C" externalMemoryBoolDestructor(extMem)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end destructor;
  end ExternalMemoryBool;

  class ExternalMemoryRealTC " An object for external memory with time control"
    extends ExternalObject;
    function constructor
      "Creates an instance of an external array of type double."
      input Integer size = 1 "size of the array";
      input Real timeIn = 2 "time of the first value";
      output ExternalMemoryRealTC extMem;
      external "C" extMem =  externalMemoryRealTCConstructor(size,timeIn)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end constructor;

    function destructor
      input ExternalMemoryRealTC extMem;
      external "C" externalMemoryRealTCDestructor(extMem)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end destructor;
  end ExternalMemoryRealTC;

  package ExternalMemory_
    function setRealValueAt
      input ExternalMemoryReal extMem;
      input Integer idx "0-based";
      input Real value;
      external "C" setRealValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end setRealValueAt;

    function getRealValueAt
      input ExternalMemoryReal extMem;
      input Integer idx "0-based";
      output Real value;
      external "C" getRealValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getRealValueAt;

    function getRealRangeAt
      input ExternalMemoryReal extMem;
      input Integer startIdx "0-based";
      input Integer len "length of range";
      output Real[len] value;
      external "C" getRealRangeAt(extMem, startIdx, len, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getRealRangeAt;

    function setIntValueAt
      input ExternalMemoryInt extMem;
      input Integer idx "0-based";
      input Integer value;
      external "C" setIntValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end setIntValueAt;

    function getIntValueAt
      input ExternalMemoryInt extMem;
      input Integer idx "0-based";
      output Integer value;
      external "C" getIntValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getIntValueAt;

    function getIntRangeAt
      input ExternalMemoryInt extMem;
      input Integer startIdx "0-based";
      input Integer len "length of range";
      output Integer[len] value;
      external "C" getIntRangeAt(extMem, startIdx, len, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getIntRangeAt;

    function setBoolValueAt
      input ExternalMemoryBool extMem;
      input Integer idx "0-based";
      input Boolean value;
      external "C" setBoolValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end setBoolValueAt;

    function getBoolValueAt
      input ExternalMemoryBool extMem;
      input Integer idx "0-based";
      output Boolean value;
      external "C" getBoolValueAt(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getBoolValueAt;

    function getBoolRangeAt_notWorking
      "For any reason, this function is not working wiht dymola properly."
      input ExternalMemoryBool extMem;
      input Integer startIdx "0-based";
      input Integer len "length of range";
      output Boolean[len] value;
      external "C" getBoolRangeAt(extMem, startIdx, len, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getBoolRangeAt_notWorking;

    function setRealValueAtWithTC
      input ExternalMemoryRealTC extMem;
      input Integer idx "0-based";
      input Real value;
      external "C" setRealValueAtWithTC(extMem, idx, value)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end setRealValueAtWithTC;

    function getRealValueAtWithTC
      input ExternalMemoryRealTC extMem;
      input Integer idx "0-based";
      input Real timeIn;
      input Real fallbackValue;
      output Real value;
      external "C" getRealValueAtWithTC(extMem, idx, value, timeIn, fallbackValue)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getRealValueAtWithTC;

    function getRealRangeAtWithTC
      input ExternalMemoryReal extMem;
      input Integer startIdx "0-based";
      input Integer len "length of range";
      input Real timeIn;
      input Real[len] fallbackValue;
      output Real[len] value;
      external "C" getRealRangeAtWithTC(extMem, startIdx, len, value, timeIn, fallbackValue)
        annotation(Include = "#include \"ExternalMemory.h\"",
                   Library = "ExternalMemory",
                   IncludeDirectory = "modelica://ExternalMemoryLib/Resources/Include",
                   LibraryDirectory = "modelica://ExternalMemoryLib/Resources/Library/win32",
                   __iti_dll = "ExternalMemory.dll",
                   __iti_dllNoExport = true);
    end getRealRangeAtWithTC;

  end ExternalMemory_;

  package Examples
    extends Modelica.Icons.Example;
    model Minimum
      "Try to store the global minimum of the whole x-trajectory over time"
      Real x( start=3, fixed = true);
      Real der_x( start=-1, fixed = true);
      Real y1(start=3);
      Real y2(start=3);
      ExternalMemoryReal globalMin = ExternalMemoryReal(1);
    algorithm
      //It would be so cool, if this would work, but it doesn't
      y1 := min(y1,x);
      //Thats why, we have to do it like this:
      y2 := min(ExternalMemoryLib.ExternalMemory_.getRealValueAt(globalMin,0),x);
      ExternalMemoryLib.ExternalMemory_.setRealValueAt(globalMin,0,y2);
    equation
      der(x) = der_x;
      der(der_x) = - x +1.0 - 0.1*time;
    end Minimum;

    model RealArray "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryReal;
      parameter Integer arraySize = 3;
      ExternalMemoryReal realArray = ExternalMemoryReal(arraySize);

      Real val(start=0);
      Real v1(start=0),v2,v3;
    equation
      val = time;
      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,0,val-1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,1,val+1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,2,val);
      end when;

      when sample(0,0.2) then
        v1 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,0);
        v2 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,1);
        v3 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,2);

      end when;
    end RealArray;

    model RealArrayRange "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryReal;
      parameter Integer arraySize = 3;
      ExternalMemoryReal realArray = ExternalMemoryReal(arraySize);

      Real val(start=0);
      Real[3] v1;
    equation
      val = time;
      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,0,val-1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,1,val+1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,2,val);
      end when;

      when sample(0,0.2) then
        v1 = ExternalMemoryLib.ExternalMemory_.getRealRangeAt(realArray,0,3);
      end when;
    end RealArrayRange;

    model BoolArray "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryReal;
      parameter Integer arraySize = 3;
      ExternalMemoryBool boolArray = ExternalMemoryBool(arraySize);

      Boolean val(start=true);
      Boolean[3] v1;
    equation
      if (sin(time)>0.5) then
        val = true;
      else
        val = false;
      end if;

      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,0, not val);
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,1,val);
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,2,false);
      end when;

      when sample(0,0.1) then
        v1[1] = ExternalMemoryLib.ExternalMemory_.getBoolValueAt(boolArray,0);
        v1[2] = ExternalMemoryLib.ExternalMemory_.getBoolValueAt(boolArray,1);
        v1[3] = ExternalMemoryLib.ExternalMemory_.getBoolValueAt(boolArray,2);
      end when;
    end BoolArray;

    model BoolArrayRange_notWorking "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryBool;
      parameter Integer arraySize = 3;
      ExternalMemoryBool boolArray = ExternalMemoryBool(arraySize);

      Boolean val(start=true);
      Boolean[3] v1;
    equation
      if (sin(time)>0.5) then
        val = true;
      else
        val = false;
      end if;

      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,0, not val);
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,1,val);
        ExternalMemoryLib.ExternalMemory_.setBoolValueAt(boolArray,2,false);
        v1[1:3] = ExternalMemoryLib.ExternalMemory_.getBoolRangeAt_notWorking(boolArray,0,3);
      end when;

    end BoolArrayRange_notWorking;

    model IntArray "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryInt;
      parameter Integer arraySize = 3;
      ExternalMemoryInt intArray = ExternalMemoryInt(arraySize);

      Integer val(start=0);
      Integer[3] v1;
    equation
      if (sin(time)>0.5) then
        val = integer(time);
      else
        val = integer(time);
      end if;

      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,0, val+1);
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,1,val-1);
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,2,val);
      end when;

      when sample(0,0.1) then
        v1[1] = ExternalMemoryLib.ExternalMemory_.getIntValueAt(intArray,0);
        v1[2] = ExternalMemoryLib.ExternalMemory_.getIntValueAt(intArray,1);
        v1[3] = ExternalMemoryLib.ExternalMemory_.getIntValueAt(intArray,2);
      end when;
    end IntArray;

    model IntArrayRange "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryInt;
      parameter Integer arraySize = 3;
      ExternalMemoryInt intArray = ExternalMemoryInt(arraySize);

      Integer val(start=0);
      Integer[3] v1;
    equation
      if (sin(time)>0.5) then
        val = integer(time);
      else
        val = integer(time);
      end if;

      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,0, val+1);
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,1,val-1);
        ExternalMemoryLib.ExternalMemory_.setIntValueAt(intArray,2,val);
      end when;

      when sample(0,0.1) then
        v1 = ExternalMemoryLib.ExternalMemory_.getIntRangeAt(intArray,0,arraySize);
      end when;
    end IntArrayRange;

    model RealArray_withTimeControl "Just a simple testmodel."
      import ExternalMemoryLib.ExternalMemoryReal;
      parameter Integer arraySize = 3;
      ExternalMemoryRealTC realArray = ExternalMemoryRealTC(arraySize,time);

      Real val(start=0);
      Real v1(start=0),v2,v3;
    equation
      val = time;
      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setRealValueAtWithTC(realArray,0,val-1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAtWithTC(realArray,1,val+1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAtWithTC(realArray,2,val);
      end when;

      when sample(0,0.2) then
        v1 = ExternalMemoryLib.ExternalMemory_.getRealValueAtWithTC(realArray,0,time,8);
        v2 = ExternalMemoryLib.ExternalMemory_.getRealValueAtWithTC(realArray,1,time,8);
        v3 = ExternalMemoryLib.ExternalMemory_.getRealValueAtWithTC(realArray,2,time,8);

      end when;
    end RealArray_withTimeControl;
  end Examples;
  annotation (uses(Modelica(version="3.2.1")));
end ExternalMemoryLib;
