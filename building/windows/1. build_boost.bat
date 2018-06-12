@call set_vars.bat
@echo Building boost...
@cd %LIB:/=\%\%BOOST:/=\%
@echo.
@echo.
@echo building...
b2 --build-type=minimal --with-chrono --with-filesystem --with-program_options --with-system --with-thread toolset=gcc --layout=versioned -sNO_BZIP2=1 -sNO_ZLIB=1^
 variant=release^
 link=static^
 threading=multi^
 target-os=windows^
 threadapi=win32^
 cxxflags="%ADDITIONALCCFLAGS%"^
 cflags="%ADDITIONALCCFLAGS%"^
 runtime-link=static^
 stage
@cd ..\..
@if not "%RUNALL%"=="1" pause
