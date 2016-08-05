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
  annotation (uses(Modelica(version="3.2.1")));
  package Examples
    model realArray
      import ExternalMemoryLib.ExternalMemoryReal;
      parameter Integer arraySize = 5;
      ExternalMemoryReal realArray = ExternalMemoryReal(arraySize);

      Real val(start=0);
      Real v1(start=0),v2,v3;
    equation
      val = time;
      when sample(0,0.1) then
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,0,val-1);
        ExternalMemoryLib.ExternalMemory_.setRealValueAt(realArray,1,val+1);
      end when;

      when sample(0,0.2) then
        v1 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,0);
        v2 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,1);
        v3 = ExternalMemoryLib.ExternalMemory_.getRealValueAt(realArray,5);

      end when;
    end realArray;
  end Examples;
end ExternalMemoryLib;
