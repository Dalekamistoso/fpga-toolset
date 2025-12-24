#       FPGA Toolset for Mist compatible FPGAS
#              By DrWh0/Dalekamistoso
This is the first version of this tool made in order to make easier to 
update & prepare your SD cards for your Mist FPGA or compatible.

FPGA currently supported:

* SiDi (both 32 & 64 versions)
* SiDi128
* Mist/Mistica
* Poseidon (EGPCX150 & 10CL120 boards)
* Other partially supported (only for Jotego cores)


Features:

* Multilingual interface (currently Spanish/English)
* Automated save files creation for cores that can't do it itselves
* Checks and downloads latest version of the firmware
* Downloads latest cores from official repositories
* Sorts downloads by publisher & FPGA platform
* Partitions & formats SD cards in desired file system (exFat recommended)
* ROM & ARC creation from zips/mra files
* All file operations are folder recursive
* Easy MRA tool update (just replace included MRA.EXE)
* Compact & portable executable


Requeriments:

* Windows 10 (or any Windows with Powershell 5.1 installed)
* Latest mra tool (already included with this program)

Notes: 

Windows 7 SP1 onwards can work if you install powershell 5.1 but I haven`t
tested, try at your own risk (I will be happy if you can test it properly)

To keep it clear, if you don't install powershell 5.1 or later:

Online related functions WILL NOT WORK PROPERLY OR NOT WORKING AT ALL!!!

Known bugs:

* I forgot to remove a date in title bar (I realized just now LoL)


Planned features:

* Full auto structured sd image creation in one click button
* Adding an additional repository with best unofficial cores
* Adding a full customized sd card structure
* Access to external flasher tools
* Adding more languages (if you ask for it)
* Disable online buttons if powershell is not detected
* Changes in version naming

Version changelog:

20/12/2025 Initial Beta version



