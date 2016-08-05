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
  end ExternalMemory_;

  package Examples
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
  end Examples;
  annotation (uses(Modelica(version="3.2.1")));
end ExternalMemoryLib;
