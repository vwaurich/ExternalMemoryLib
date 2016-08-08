# ExternalMemoryLib
A Modelica Library to get permanent access to some memory in case you want to conserve some data over simulation.

The library contains external functions to allocate memory which persists across timesteps. This is useful to store values of previous time steps without declaring discrete variables and using costly time events.

You can create arrays for Real, Integer and Boolean values, set values at certain indexes, get values at certain positions or copy ranges of the array into your Modelica variables.

Please deploy these functions with considerations since the values are written in every call no matter if the calculated time step is invalid or not. There is a possibility to check the time every step and provide a fallback value in case the step is before the last time the function was called.
See ExternalMemoryRealTC (i.e. real array with time control)

The projects contains binary for 32-bit widows. In case you need something different, try to build it yourself. All the sources are on board.