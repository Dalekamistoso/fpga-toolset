==========================================================================
       FPGA Toolset for Mist compatible FPGA by DrWh0/Dalekamistoso
==========================================================================

This is a tool I made in order to make easier to update & prepare
your SD cards to start using your Mist FPGA or compatibles.

FPGAs currently supported:
--------------------------

* SiDi (both 32 & 64 versions)
* SiDi128
* Mist/Mistica
* Poseidon (EGPCX150 & 10CL120 boards)
* Other partially supported (only for Jotego cores)


Features:
---------

* Multilingual interface (currently Spanish/English more possible)
* Automated save files creation for cores that can't do it itselves
* Checks and downloads latest version of the firmware
* Downloads latest cores from official repositories
* Sorts downloads by FPGA platform
* Partitions & formats SD cards in desired file system (exFat recommended)
* ROM & ARC creation from zip/mra files
* All file operations are folder recursive
* Easy MRA tool update (just replace included MRA.EXE)
* Compact & portable executable


Requirements:
-------------

* Windows 10 (or any Windows with Powershell 5.1 installed)
* Latest mra tool binary (already included with this program)

Notes: 
------

* Windows 7 SP1 onwards can work if you install powershell 5.1 but is
  not tested, try at your own risk.

* To keep it clear, if you don't install powershell 5.1 or later: Online functions WILL NOT WORK PROPERLY

* Nes/FC core saves are 32KB in size instead of 8KB because some games
  stores more than common 8KB saves

* This programs uses for arc/roms generation "mra-tools-c":
  https://github.com/sebdel/mra-tools-c/



Planned features:
-----------------

* Full auto structured SD image creation in one click button
* Adding an additional repository with best unofficial cores
* Adding a full customized sd card structure
* Access to external flasher tools
* Adding more languages (if you ask for it)
* Disable online buttons if powershell 5.1 is not detected
* Cosmetical changes & menu rearrange


Credits (I hide complete names for privacy):
--------------------------------------------

My warm grattitude for their support to:

 Alberto R. (Kraptol)
 Armand C.
 Angel A.
 Orlando B. 
 Andreas W.
 David C. 
 Francisco J.
 Inacio S.
 Pedro S.
 Juan Ramón L.
 Manuel F. (Manuferhi)

Also thanks to:

 Carlos P.
 Turri21 (Main Senhor developer)
 Ramon B.
 Somhic
 Rampa069
 Vince (amigagames)
 And all developers/testers that helped me in any moment

Thanks to this people I didn't drop everything!

Wall of shame:
--------------

 Ignorant, lazy & bad manered people who "knows everything"
 People who ask things already solved in FAQ (importante.txt) 
 People who refuses to read or understand the most basic things

Authors:
--------

DrWh0 (aka Dalekamistoso)
Sebdel (author of the mra tool)

Contact:
--------

For bug reports, donations or any kind of help

Website: https://x.com/Dalekamistoso
Github:  https://t.co/cIcYgHMKQE


