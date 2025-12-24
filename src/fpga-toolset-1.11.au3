; =============================================
; FPGA TOOLSET TEST MULTILENGUAJE V 1.11
; IDIOMAS SOPORTADOS: INGLES Y ESPAÑOL
; Programado por DrWh0 (Dalekamistoso) 24/12/25
; =============================================

; ============================================
; AQUI SE EXIGEN DERECHOS DE ADMINISTRADOR
; PARA EVITAR ERRORES ACCEDIENDO A CARPETAS
; DE PERFIL O DE SISTEMA Y SE OCULTA EL ICONO
; DE SCRIPTING POR ESTETICA Y POR SEGURIDAD
; ============================================

#RequireAdmin
#NoTrayIcon


; ============================================
; VARIABLES GLOBALES DE IDIOMA
; ============================================
Global $g_idioma = ""
Global $g_textos[150]

; ============================================
; INCLUDES - Funciones que emplea el programa
; ============================================

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#include <ProgressConstants.au3>
#include <EditConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <InetConstants.au3>
#include <WinAPIFiles.au3>
#include <WinAPI.au3>

; ============================================
; Verificación de Windows 10 o superior (aviso)
; ============================================

Func AvisarWindowsInferior10()
    If @OSBuild < 10240 Then
        If $g_idioma = "ES" Then
            MsgBox(48, "Aviso", _
                "Las funciones online de este programa necesitan funciones integradas únicamente desde Windows 10 o superior..." & @CRLF & @CRLF & "En Windows 7 SP1 puede funcionar si instalas Powershell 5.1")
        Else
            MsgBox(48, "Warning", _
                "This program's online functions require features only available from Windows 10 or later..." & @CRLF & @CRLF & "On Windows 7 SP1 it may work if you install PowerShell 5.1")
        EndIf
    EndIf
EndFunc

; ============================================
; MENÚ DE SELECCIÓN DE IDIOMA
; ============================================
Func MostrarMenuIdioma()
    Local $hIdiomaWin = GUICreate("Language Selection / Selección de idioma", 400, 180, -1, -1)

    GUICtrlCreateLabel("Select language / Seleccione idioma", 50, 20, 300, 30, 1) ; SS_CENTER = 1
    GUICtrlSetFont(-1, 12, 600)

    Local $btnEspanol = GUICtrlCreateButton("Español", 50, 70, 300, 40)
    GUICtrlSetFont(-1, 11, 600)

    Local $btnEnglish = GUICtrlCreateButton("English", 50, 120, 300, 40)
    GUICtrlSetFont(-1, 11, 600)

    GUISetState(@SW_SHOW, $hIdiomaWin)

    While 1
        Local $msg = GUIGetMsg()
        Switch $msg
            Case $GUI_EVENT_CLOSE
                Exit
            Case $btnEspanol
                $g_idioma = "ES"
                InicializarTextosEspanol()
                GUIDelete($hIdiomaWin)
                Return
            Case $btnEnglish
                $g_idioma = "EN"
                InicializarTextosIngles()
                GUIDelete($hIdiomaWin)
                Return
        EndSwitch
    WEnd
EndFunc

; ============================================
; TEXTOS EN ESPAÑOL
; ============================================
Func InicializarTextosEspanol()
    $g_textos[0] = "Kit de herramientas para FPGA compatibles con MiST/SiDi128/Poseidon (DrWh0/DalekAmistoso) - Made in Borg City"
    $g_textos[1] = "SELECCIONE LA ACCIÓN DESEADA"
    $g_textos[2] = "CREAR ARCHIVOS DE GUARDADO POR CORE"
    $g_textos[3] = "CREAR ARCHIVOS DE GUARDADO PARA MEGADRIVE" & @CRLF & "(.BIN/.SMD/.GEN)"
    $g_textos[4] = "CREAR ARCHIVOS DE GUARDADO PARA SNES" & @CRLF & "(.SFC/.SMC)"
    $g_textos[5] = "CREAR ARCHIVOS DE GUARDADO PARA PC-ENGINE" & @CRLF & "(.PCE)"
    $g_textos[6] = "CREAR ARCHIVOS DE GUARDADO PARA NES/FC" & @CRLF & "(.NES)"
    $g_textos[7] = "CREAR ARCHIVOS DE GUARDADO PARA FAMICOM DISK" & @CRLF & "(.FDS)"
    $g_textos[8] = "CREAR ARCHIVOS DE GUARDADO PARA SEGA SMS/GG" & @CRLF & "(.SMS/.GG)"
    $g_textos[9] = "HERRAMIENTAS Y ACTUALIZACIONES"
    $g_textos[10] = "AUTO GENERADOR DE ARCHIVOS DE GUARDADO" & @CRLF & "(CREA GUARDADOS PARA TODOS LOS SISTEMAS)"
    $g_textos[11] = "PROCESAMIENTO DE ARCHIVOS MRA" & @CRLF & "(GENERA LOS ROMS/ARC NECESARIOS)"
    $g_textos[12] = "DESCARGAR FIRMWARE ACTUALIZADO" & @CRLF & "(REPOSITORIO OFICIAL DE MIST)"
    $g_textos[13] = "FORMATEAR TARJETA SD" & @CRLF & "(SE RECOMIENDA EXFAT PARA USO NORMAL)"
    $g_textos[14] = "DESCARGAR CORES FPGA" & @CRLF & "(REPOSITORIOS OFICIALES / MIST-SIDI-POSEIDON)"
    $g_textos[15] = "SALIR DEL PROGRAMA"
    $g_textos[16] = "NOTA: Una vez iniciado el proceso los botones se desactivan por seguridad"
    $g_textos[17] = "Programado por DrWh0/Dalekamistoso - Versión actual: 24/12/2025"
    $g_textos[18] = "Aviso"
    $g_textos[19] = "No se seleccionó ningún directorio."
    $g_textos[20] = "Seleccione el directorio donde descargar los cores"
    $g_textos[21] = "Descarga de cores en curso - Por favor, espere..."
    $g_textos[22] = "DESCARGANDO CORES DESDE LOS REPOSITORIOS DE GITHUB"
    $g_textos[23] = "Preparando descarga..."
    $g_textos[24] = "Guardar registro"
    $g_textos[25] = "Salir / Cancelar"
    $g_textos[26] = "Cancelar descarga"
    $g_textos[27] = "Confirmar cancelación"
    $g_textos[28] = "¿Desea cancelar la descarga de cores?"
    $g_textos[29] = "Proceso cancelado por el usuario"
    $g_textos[30] = "Descarga cancelada por el usuario"
    $g_textos[31] = "¿Desea cancelar las descargas actuales?"
    $g_textos[32] = "Volver al menú principal"
    $g_textos[33] = "¿Desea volver al menú principal y cancelar las descargas en curso?"
    $g_textos[34] = "Volviendo al menú principal - Descargas canceladas"
    $g_textos[35] = "Error de Descarga"
    $g_textos[36] = "No se pudo iniciar la descarga:"
    $g_textos[37] = "Descarga Completada"
    $g_textos[38] = "¡Todos los cores han sido descargados exitosamente!"
    $g_textos[39] = "Ubicación:"
    $g_textos[40] = "Carpetas creadas:"
    $g_textos[41] = "No hay contenido para guardar en el registro."
    $g_textos[42] = "Guardar registro como"
    $g_textos[43] = "Archivos de texto (*.txt)"
    $g_textos[44] = "Error"
    $g_textos[45] = "No se pudo crear el archivo de registro."
    $g_textos[46] = "Registro Guardado"
    $g_textos[47] = "El registro se ha guardado exitosamente en:"
    $g_textos[48] = "No hay unidades extraí­bles"
    $g_textos[49] = "No se encontraron unidades extraí­bles (USB/SD) conectadas." & @CRLF & "Conecte una unidad USB o tarjeta SD y vuelva a intentarlo."
    $g_textos[50] = "Formatear y preparar SD para MiST"
    $g_textos[51] = "SELECCIONE LA UNIDAD A FORMATEAR"
    $g_textos[52] = "¡ADVERTENCIA! ¡TODOS LOS DATOS DE LA UNIDAD SELECCIONADA SE ELIMINARÁN!"
    $g_textos[53] = "Selección requerida"
    $g_textos[54] = "Debe seleccionar una unidad de la lista."
    $g_textos[55] = "CONFIRMACIÓN FINAL"
    $g_textos[56] = "¿ESTÁ ABSOLUTAMENTE SEGURO DE QUE DESEA FORMATEAR LA UNIDAD"
    $g_textos[57] = "Cancelado"
    $g_textos[58] = "Descarga cancelada."
    $g_textos[59] = "Seleccione el directorio para buscar ROMs de"
    $g_textos[60] = "No se encontraron archivos con las extensiones especificadas."
    $g_textos[61] = "Procesando archivos..."
    $g_textos[62] = "Creando archivos .SAV para"
    $g_textos[63] = "Proceso Finalizado"
    $g_textos[64] = "Proceso completado para"
    $g_textos[65] = "Archivos encontrados:"
    $g_textos[66] = "Archivos .SAV creados:"
    $g_textos[67] = "Archivos .SAV ya existentes:"
    $g_textos[68] = "Seleccione el directorio base para buscar todas las ROMs"
    $g_textos[69] = "Proceso automático completado"
    $g_textos[70] = "Total de archivos encontrados:"
    $g_textos[71] = "Total de archivos .SAV creados:"
    $g_textos[72] = "Total de archivos .SAV ya existentes:"
    $g_textos[73] = "MRA.EXE no encontrado en la ubicación de este programa"
    $g_textos[74] = "Ruta esperada:"
    $g_textos[75] = "Selecciona carpeta con archivos .MRA"
    $g_textos[76] = "Procesador de MRA para SiDi/Mist/Poseidon FPGA"
    $g_textos[77] = "No se encontraron archivos .mra"
    $g_textos[78] = "Descarga de Firmware MiST"
    $g_textos[79] = "Conectando con GitHub..."
    $g_textos[80] = "No se pudo conectar con el repositorio de GitHub." & @CRLF & @CRLF & "Verifique su conexión a Internet."
    $g_textos[81] = "Descargando"
    $g_textos[82] = "URL:"
    $g_textos[83] = "Archivo:"
    $g_textos[84] = "Carpeta destino:"
    $g_textos[85] = "Iniciando descarga..."
    $g_textos[86] = "ERROR: No se pudo iniciar la descarga"
    $g_textos[87] = "Código de error:"
    $g_textos[88] = "Descarga completada:"
    $g_textos[89] = "Descomprimiendo"
    $g_textos[90] = "Carpeta creada:"
    $g_textos[91] = "La carpeta ya existe:"
    $g_textos[92] = "Descompresión completada exitosamente"
    $g_textos[93] = "Moviendo contenido desde:"
    $g_textos[94] = "Contenido movido correctamente (omitiendo directorio base)"
    $g_textos[95] = "ADVERTENCIA: Código de retorno al mover archivos:"
    $g_textos[96] = "No se encontró subdirectorio base, moviendo contenido directamente"
    $g_textos[97] = "Eliminando archivos temporales..."
    $g_textos[98] = "ADVERTENCIA: Código de retorno de descompresión:"
    $g_textos[99] = "Eliminando archivo ZIP temporal..."
    $g_textos[100] = "Archivo ZIP eliminado"
    $g_textos[101] = "DESCARGA CANCELADA POR EL USUARIO"
    $g_textos[102] = "¡Descarga y descompresión completadas!"
    $g_textos[103] = "PROCESO COMPLETADO EXITOSAMENTE"
    $g_textos[104] = "Todos los cores han sido descargados y descomprimidos en:"
    $g_textos[105] = "Proceso Cancelado"
    $g_textos[106] = "El procesamiento de archivos MRA ha sido cancelado."
    $g_textos[107] = "Archivos procesados:"
    $g_textos[108] = "SELECCIONE TIPO DE FORMATEO (SE RECOMIENDA EXFAT)"
    $g_textos[109] = "Sistema de archivos:"
    $g_textos[110] = "Tamaño de cluster:"
    $g_textos[111] = "Tamaño por defecto"
    $g_textos[112] = "Nombre del volumen:"
    $g_textos[113] = "CONTINUAR CON EL FORMATEO"
    $g_textos[114] = "CANCELAR"
    $g_textos[115] = "¿Desea continuar con el formateo?"
    $g_textos[116] = "TODOS LOS DATOS EN ESTA UNIDAD SERÁN ELIMINADOS PERMANENTEMENTE."
    $g_textos[117] = "Esta acción NO se puede deshacer."
    $g_textos[118] = "Formateando unidad..."
    $g_textos[119] = "Formateando"
    $g_textos[120] = "Preparando..."
    $g_textos[121] = "Desmontando unidad..."
    $g_textos[122] = "Iniciando formateo..."
    $g_textos[123] = "Ejecutando formateo (esto puede tomar varios minutos)..."
    $g_textos[124] = "Formateo completado exitosamente!"
    $g_textos[125] = "Formateo completado"
    $g_textos[126] = "¡Formateo completado exitosamente!"
    $g_textos[127] = "Unidad:"
    $g_textos[128] = "La unidad está lista para usar con MiST."
    $g_textos[129] = "Error durante el formateo (código:"
    $g_textos[130] = "Error de formateo"
    $g_textos[131] = "Hubo un error durante el proceso de formateo."
    $g_textos[132] = "La unidad puede estar protegida contra escritura o en uso."
    $g_textos[133] = "Procesando: "
    $g_textos[134] = "Escaneando recursivamente carpeta:"
    $g_textos[135] = "Buscando archivos .mra..."
    $g_textos[136] = "No se encontraron archivos .mra en modo recursivo."
    $g_textos[137] = "Encontrados"
    $g_textos[138] = "archivos .mra"
    $g_textos[139] = "¿Está seguro de que desea cancelar el procesamiento de archivos MRA?"
    $g_textos[140] = "Se detendrá el proceso actual y no se procesarán los archivos restantes."
    $g_textos[141] = "CANCELAR / SALIR"
    $g_textos[142] = "ABRIR REGISTRO"
    $g_textos[143] = "*** PROCESO CANCELADO POR EL USUARIO ***"
    $g_textos[144] = "El proceso ha sido cancelado. Para ver el registro pulse en 'ABRIR REGISTRO'."
    $g_textos[145] = "-------------------------------------------"
    $g_textos[146] = "PROCESO COMPLETADO"
    $g_textos[147] = "Archivos .rom y .arc procesados movidos a:"
    $g_textos[148] = "Procesamiento de archivos MRA completado."
    $g_textos[149] = "Los archivos generados se encuentran en:"
EndFunc

; ============================================
; TEXTOS EN INGLÉS
; ============================================
Func InicializarTextosIngles()
    $g_textos[0] = "Toolkit for MiST/SiDi128/Poseidon compatible FPGA (DrWh0/DalekAmistoso) - Made in Borg City"
    $g_textos[1] = "SELECT THE DESIRED ACTION"
    $g_textos[2] = "CREATE SAVE FILES PER CORE"
    $g_textos[3] = "CREATE SAVE FILES FOR MEGADRIVE" & @CRLF & "(.BIN/.SMD/.GEN)"
    $g_textos[4] = "CREATE SAVE FILES FOR SNES" & @CRLF & "(.SFC/.SMC)"
    $g_textos[5] = "CREATE SAVE FILES FOR PC-ENGINE" & @CRLF & "(.PCE)"
    $g_textos[6] = "CREATE SAVE FILES FOR NES/FC" & @CRLF & "(.NES)"
    $g_textos[7] = "CREATE SAVE FILES FOR FAMICOM DISK" & @CRLF & "(.FDS)"
    $g_textos[8] = "CREATE SAVE FILES FOR SEGA SMS/GG" & @CRLF & "(.SMS/.GG)"
    $g_textos[9] = "TOOLS AND UPDATES"
    $g_textos[10] = "AUTOMATIC SAVE FILE GENERATOR" & @CRLF & "(CREATES SAVE FILES FOR ALL SYSTEMS)"
    $g_textos[11] = "MRA FILE PROCESSING" & @CRLF & "(GENERATES ROMS AND ARC)"
    $g_textos[12] = "DOWNLOAD UPDATED FIRMWARE" & @CRLF & "(OFFICIAL MIST REPOSITORY)"
    $g_textos[13] = "FORMAT SD CARD" & @CRLF & "(EXFAT RECOMMENDED FOR NORMAL USE)"
    $g_textos[14] = "DOWNLOAD FPGA CORES" & @CRLF & "(OFFICIAL REPOSITORIES / MIST-SIDI-POSEIDON)"
    $g_textos[15] = "EXIT PROGRAM"
    $g_textos[16] = "NOTE: Once the process starts, buttons are disabled for safety"
    $g_textos[17] = "Programmed by DrWh0/Dalekamistoso - Current version: 24/12/2025"
    $g_textos[18] = "Warning"
    $g_textos[19] = "No directory was selected."
    $g_textos[20] = "Select the directory where to download cores"
    $g_textos[21] = "Core download in progress - Please wait..."
    $g_textos[22] = "DOWNLOADING CORES FROM GITHUB REPOSITORIES"
    $g_textos[23] = "Preparing download..."
    $g_textos[24] = "Save log"
    $g_textos[25] = "Exit / Cancel"
    $g_textos[26] = "Cancel download"
    $g_textos[27] = "Confirm cancellation"
    $g_textos[28] = "Do you want to cancel the core download?"
    $g_textos[29] = "Process aborted by user"
    $g_textos[30] = "Download aborted by user"
    $g_textos[31] = "Do you want to cancel the current downloads?"
    $g_textos[32] = "Return to main menu"
    $g_textos[33] = "Do you want to return to the main menu aborting all downloads in progress?"
    $g_textos[34] = "Returning to main menu - Downloads cancelled"
    $g_textos[35] = "Download Error"
    $g_textos[36] = "Could not start download:"
    $g_textos[37] = "Download Completed"
    $g_textos[38] = "All cores have been downloaded successfully!"
    $g_textos[39] = "Location:"
    $g_textos[40] = "Folders created:"
    $g_textos[41] = "No content to save in the log."
    $g_textos[42] = "Save log as"
    $g_textos[43] = "Text files (*.txt)"
    $g_textos[44] = "Error"
    $g_textos[45] = "Could not create log file."
    $g_textos[46] = "Log Saved"
    $g_textos[47] = "The log has been saved successfully to:"
    $g_textos[48] = "No removable drives"
    $g_textos[49] = "No removable drives (USB/SD) were found connected." & @CRLF & "Connect a USB drive or SD card and try again."
    $g_textos[50] = "Format and prepare SD for MiST"
    $g_textos[51] = "SELECT THE DRIVE TO FORMAT"
    $g_textos[52] = "WARNING! ALL DATA ON THE SELECTED DRIVE WILL BE DELETED!"
    $g_textos[53] = "Selection required"
    $g_textos[54] = "You must select a drive from the list."
    $g_textos[55] = "FINAL CONFIRMATION"
    $g_textos[56] = "ARE YOU ABSOLUTELY SURE YOU WANT TO FORMAT DRIVE"
    $g_textos[57] = "Cancelled"
    $g_textos[58] = "Download cancelled."
    $g_textos[59] = "Select the directory to search for ROMs of"
    $g_textos[60] = "No files found with the specified extensions."
    $g_textos[61] = "Processing files..."
    $g_textos[62] = "Creating .SAV files for"
    $g_textos[63] = "Process Finished"
    $g_textos[64] = "Process completed for"
    $g_textos[65] = "Files found:"
    $g_textos[66] = ".SAV files created:"
    $g_textos[67] = ".SAV files already existing:"
    $g_textos[68] = "Select the base directory to search for all ROMs"
    $g_textos[69] = "Automatic process completed"
    $g_textos[70] = "Total files found:"
    $g_textos[71] = "Total .SAV files created:"
    $g_textos[72] = "Total .SAV files already existing:"
    $g_textos[73] = "MRA.EXE not found in this program's location"
    $g_textos[74] = "Expected path:"
    $g_textos[75] = "Select folder with .MRA files"
    $g_textos[76] = "MRA Processor for SiDi/Mist/Poseidon FPGA"
    $g_textos[77] = "No .mra files found"
    $g_textos[78] = "MiST Firmware Download"
    $g_textos[79] = "Connecting to GitHub..."
    $g_textos[80] = "Could not connect to GitHub repository." & @CRLF & @CRLF & "Check your Internet connection."
    $g_textos[81] = "Downloading"
    $g_textos[82] = "URL:"
    $g_textos[83] = "File:"
    $g_textos[84] = "Destination folder:"
    $g_textos[85] = "Starting download..."
    $g_textos[86] = "ERROR: Could not start download"
    $g_textos[87] = "Error code:"
    $g_textos[88] = "Download completed:"
    $g_textos[89] = "Extracting"
    $g_textos[90] = "Folder created:"
    $g_textos[91] = "Folder already exists:"
    $g_textos[92] = "Extraction completed successfully"
    $g_textos[93] = "Moving content from:"
    $g_textos[94] = "Content moved correctly (skipping base directory)"
    $g_textos[95] = "WARNING: Return code when moving files:"
    $g_textos[96] = "Base subdirectory not found, moving content directly"
    $g_textos[97] = "Deleting temporary files..."
    $g_textos[98] = "WARNING: Extraction return code:"
    $g_textos[99] = "Deleting temporary ZIP file..."
    $g_textos[100] = "ZIP file deleted"
    $g_textos[101] = "DOWNLOAD ABORTED BY USER"
    $g_textos[102] = "Download and extraction completed!"
    $g_textos[103] = "PROCESS COMPLETED SUCCESSFULLY"
    $g_textos[104] = "All cores have been downloaded and extracted to:"
    $g_textos[105] = "Process Cancelled"
    $g_textos[106] = "MRA file processing has been cancelled."
    $g_textos[107] = "Files processed:"
    $g_textos[108] = "SELECT FORMAT TYPE (EXFAT RECOMMENDED)"
    $g_textos[109] = "File system:"
    $g_textos[110] = "Cluster size:"
    $g_textos[111] = "Default size"
    $g_textos[112] = "Volume name:"
    $g_textos[113] = "CONTINUE WITH FORMAT"
    $g_textos[114] = "CANCEL"
    $g_textos[115] = "Do you want to continue with the format?"
    $g_textos[116] = "ALL DATA ON THIS DRIVE WILL BE PERMANENTLY DELETED."
    $g_textos[117] = "This action CANNOT be undone."
    $g_textos[118] = "Formatting drive..."
    $g_textos[119] = "Formatting"
    $g_textos[120] = "Preparing..."
    $g_textos[121] = "Unmounting drive..."
    $g_textos[122] = "Starting format..."
    $g_textos[123] = "Executing format (this may take several minutes)..."
    $g_textos[124] = "Format completed successfully!"
    $g_textos[125] = "Format completed"
    $g_textos[126] = "Format completed successfully!"
    $g_textos[127] = "Drive:"
    $g_textos[128] = "The drive is ready to use with MiST."
    $g_textos[129] = "Error during format (code:"
    $g_textos[130] = "Format error"
    $g_textos[131] = "An error occurred during the format process."
    $g_textos[132] = "The drive may be write-protected or in use."
    $g_textos[133] = "Processing: "
    $g_textos[134] = "Recursively scanning folder:"
    $g_textos[135] = "Searching for .mra files..."
    $g_textos[136] = "No .mra files found in recursive mode."
    $g_textos[137] = "Found"
    $g_textos[138] = ".mra files"
    $g_textos[139] = "Are you sure you want to cancel MRA file processing?"
    $g_textos[140] = "The current process will stop and remaining files will not be processed."
    $g_textos[141] = "CANCEL / EXIT"
    $g_textos[142] = "OPEN LOG"
    $g_textos[143] = "*** PROCESS ABORTED BY USER ***"
    $g_textos[144] = "The process has been aborted. To view the log click on 'OPEN LOG'."
    $g_textos[145] = "-------------------------------------------"
    $g_textos[146] = "PROCESS COMPLETED"
    $g_textos[147] = ".rom and .arc processed files moved to:"
    $g_textos[148] = "MRA file processing completed."
    $g_textos[149] = "Generated files are located at:"
EndFunc

; ============================================
; INICIALIZACIÓN
; ============================================

; Mostrar menú de idioma
MostrarMenuIdioma()

; Ejecutar verificación antes de iniciar
AvisarWindowsInferior10()

Global $hGUI, $hProgress, $hProgressWin

; Crear la ventana principal con textos según idioma
$hGUI = GUICreate($g_textos[0], 800, 500)

; Tí­tulo centrado
GUICtrlCreateLabel($g_textos[1], 20, 10, 760, 30, $SS_CENTER)
GUICtrlSetFont(-1, 12, 600)

; Columna izquierda
GUICtrlCreateLabel($g_textos[2], 40, 50, 340, 25, $SS_CENTER)
GUICtrlSetFont(-1, 10, 600)
GUICtrlSetBkColor(-1, 0xF0F0F0)

$btnMegaDrive = GUICtrlCreateButton($g_textos[3], 40, 80, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnSNES = GUICtrlCreateButton($g_textos[4], 40, 130, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnPCEngine = GUICtrlCreateButton($g_textos[5], 40, 180, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnNES = GUICtrlCreateButton($g_textos[6], 40, 230, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnFDS = GUICtrlCreateButton($g_textos[7], 40, 280, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnSMSGG = GUICtrlCreateButton($g_textos[8], 40, 330, 340, 45, $BS_MULTILINE + $BS_CENTER)

; Separador vertical
GUICtrlCreateLabel("", 395, 50, 10, 330, $SS_SUNKEN)

; Columna derecha
GUICtrlCreateLabel($g_textos[9], 420, 50, 340, 25, $SS_CENTER)
GUICtrlSetFont(-1, 10, 600)
GUICtrlSetBkColor(-1, 0xF0F0F0)

$btnAuto = GUICtrlCreateButton($g_textos[10], 420, 80, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnMRA = GUICtrlCreateButton($g_textos[11], 420, 130, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnFirmware = GUICtrlCreateButton($g_textos[12], 420, 180, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnFormatearSD = GUICtrlCreateButton($g_textos[13], 420, 230, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnDescargarCores = GUICtrlCreateButton($g_textos[14], 420, 280, 340, 45, $BS_MULTILINE + $BS_CENTER)
$btnSalir = GUICtrlCreateButton($g_textos[15], 420, 330, 340, 45, $BS_CENTER)

; Línea separadora
GUICtrlCreateLabel("", 20, 390, 760, 2, $SS_SUNKEN)

; Nota inferior
GUICtrlCreateLabel($g_textos[16], 20, 400, 760, 30, $SS_CENTER)
GUICtrlSetFont(-1, 9)
GUICtrlSetColor(-1, 0xFF0000)

; Información del creador
GUICtrlCreateLabel($g_textos[17], 20, 430, 760, 20, $SS_CENTER)
GUICtrlSetFont(-1, 8)
GUICtrlSetColor(-1, 0x808080)

GUISetState(@SW_SHOW)

; Bucle principal
While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE, $btnSalir
            Exit
        Case $btnMegaDrive
            ProcesarArchivos("*.md;*.bin;*.smd;*.gen", 32768, "MegaDrive")
        Case $btnSNES
            ProcesarArchivos("*.sfc;*.smc", 32768, "SNES")
        Case $btnPCEngine
            ProcesarArchivos("*.pce", 2048, "PC Engine")
        Case $btnNES
            ProcesarArchivos("*.nes", 32768, "NES/FC")
        Case $btnFDS
            ProcesarArchivos("*.fds", 131072, "FDS")
        Case $btnSMSGG
            ProcesarArchivos("*.sms;*.gg", 8192, "SMS/GG")
        Case $btnAuto
            ModoAutomatico()
        Case $btnMRA
            EjecutarProcesamientoMRA()
        Case $btnFirmware
            DescargarFirmwareMist()
        Case $btnFormatearSD
            FormatearUnidadSD()
        Case $btnDescargarCores
            DescargarCores()
    EndSwitch
WEnd

; ==================== FUNCIÓN PARA DESCARGAR CORES ====================

Func DescargarCores()
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $directorioDescarga = FileSelectFolder($g_textos[20], "")
    If @error Or $directorioDescarga = "" Then
        MsgBox(48, $g_textos[18], $g_textos[19])
        HabilitarBotones()
        Return
    EndIf

    Local $hCoresWin = GUICreate($g_textos[21], 700, 300, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU, $WS_MINIMIZEBOX), -1, $hGUI)
    GUICtrlCreateLabel($g_textos[22], 10, 10, 680, 30, $SS_CENTER)
    GUICtrlSetFont(-1, 11, 600)

    Local $idCoresProgress = GUICtrlCreateProgress(10, 50, 680, 25)
    Local $idCoresStatus = GUICtrlCreateLabel($g_textos[23], 10, 85, 680, 20, $SS_CENTER)
    Local $idCoresLog = GUICtrlCreateEdit("", 10, 115, 680, 120, $ES_MULTILINE + $ES_READONLY + $WS_VSCROLL)

    Local $idBtnGuardarLog = GUICtrlCreateButton($g_textos[24], 140, 245, 120, 30)
    Local $idBtnVolver = GUICtrlCreateButton($g_textos[25], 290, 245, 120, 30)
    Local $idBtnCancelar = GUICtrlCreateButton($g_textos[26], 440, 245, 120, 30)
    GUICtrlSetState($idBtnGuardarLog, $GUI_DISABLE)

    Local $cancelarProceso = False
    Local $hDownload = 0

    Local $aDescargas[4][3]
    $aDescargas[0][0] = "https://github.com/jotego/jtbin/archive/refs/heads/master.zip"
    $aDescargas[0][1] = "jtbin-master.zip"
    $aDescargas[0][2] = "arcade cores"

    $aDescargas[1][0] = "https://github.com/mist-devel/mist-binaries/archive/refs/heads/master.zip"
    $aDescargas[1][1] = "mist-binaries-master.zip"
    $aDescargas[1][2] = "mist cores"

    $aDescargas[2][0] = "https://github.com/ManuFerHi/SiDi-FPGA/archive/refs/heads/master.zip"
    $aDescargas[2][1] = "SiDi-FPGA-master.zip"
    $aDescargas[2][2] = "sidi cores"

    $aDescargas[3][0] = "https://github.com/ManuFerHi/Poseidon/archive/refs/heads/main.zip"
    $aDescargas[3][1] = "Poseidon-main.zip"
    $aDescargas[3][2] = "poseidon cores"

    Local $totalDescargas = 4
    Local $descargaActual = 0

    GUISetState(@SW_SHOW, $hCoresWin)

    For $i = 0 To $totalDescargas - 1
        Local $msg = GUIGetMsg()
        Switch $msg
            Case $GUI_EVENT_CLOSE
                Local $respuesta = MsgBox(36, $g_textos[27], $g_textos[28], 0, $hCoresWin)
                If $respuesta = 6 Then
                    $cancelarProceso = True
                    _LogCores($idCoresLog, $g_textos[29])
                EndIf
            Case $idBtnCancelar
                Local $respuesta = MsgBox(36, $g_textos[27], $g_textos[31], 0, $hCoresWin)
                If $respuesta = 6 Then
                    $cancelarProceso = True
                    _LogCores($idCoresLog, $g_textos[30])
                EndIf
            Case $idBtnVolver
                Local $respuesta = MsgBox(36, $g_textos[32], $g_textos[33], 0, $hCoresWin)
                If $respuesta = 6 Then
                    If $hDownload <> 0 Then
                        InetClose($hDownload)
                        $hDownload = 0
                    EndIf
                    $cancelarProceso = True
                    _LogCores($idCoresLog, $g_textos[34])
                    ExitLoop
                EndIf
            Case $idBtnGuardarLog
                GuardarRegistroDescarga($idCoresLog)
        EndSwitch

        If $cancelarProceso Then ExitLoop

        $descargaActual = $i + 1
        Local $url = $aDescargas[$i][0]
        Local $nombreZip = $aDescargas[$i][1]
        Local $carpetaDestino = $aDescargas[$i][2]
        Local $rutaZip = $directorioDescarga & "\" & $nombreZip
        Local $rutaCarpeta = $directorioDescarga & "\" & $carpetaDestino

        Local $progresoBase = Int(($i / $totalDescargas) * 100)
        GUICtrlSetData($idCoresProgress, $progresoBase)

        _LogCores($idCoresLog, "")
        _LogCores($idCoresLog, "========================================")
        _LogCores($idCoresLog, $g_textos[81] & " " & $descargaActual & " " & ($g_idioma = "ES" ? "de" : "of") & " " & $totalDescargas)
        _LogCores($idCoresLog, "========================================")
        _LogCores($idCoresLog, $g_textos[82] & " " & $url)
        _LogCores($idCoresLog, $g_textos[83] & " " & $nombreZip)
        _LogCores($idCoresLog, $g_textos[84] & " " & $carpetaDestino)

        GUICtrlSetData($idCoresStatus, $g_textos[81] & " " & $carpetaDestino & " (" & $descargaActual & "/" & $totalDescargas & ")...")

        _LogCores($idCoresLog, $g_textos[85])

        $hDownload = InetGet($url, $rutaZip, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

        If @error Then
            _LogCores($idCoresLog, $g_textos[86])
            _LogCores($idCoresLog, $g_textos[87] & " " & @error)
            MsgBox(16, $g_textos[35], $g_textos[36] & @CRLF & $nombreZip & @CRLF & @CRLF & $g_textos[44] & ": " & @error, 0, $hCoresWin)
            GUIDelete($hCoresWin)
            HabilitarBotones()
            Return
        EndIf

        Local $bytesDescargados = 0
        Local $bytesTotales = 0
        Local $descargaCompleta = False
        Local $hDownloadCancelado = False

        While 1
            Local $msg = GUIGetMsg()
            Switch $msg
                Case $GUI_EVENT_CLOSE
                    Local $respuesta = MsgBox(36, $g_textos[27], $g_textos[28], 0, $hCoresWin)
                    If $respuesta = 6 Then
                        $cancelarProceso = True
                        $hDownloadCancelado = True
                        InetClose($hDownload)
                        $hDownload = 0
                        _LogCores($idCoresLog, $g_textos[30])
                        ExitLoop 2
                    EndIf
                Case $idBtnCancelar
                    Local $respuesta = MsgBox(36, $g_textos[27], $g_textos[31], 0, $hCoresWin)
                    If $respuesta = 6 Then
                        $cancelarProceso = True
                        $hDownloadCancelado = True
                        InetClose($hDownload)
                        $hDownload = 0
                        _LogCores($idCoresLog, $g_textos[30])
                        ExitLoop 2
                    EndIf
                Case $idBtnVolver
                    Local $respuesta = MsgBox(36, $g_textos[32], $g_textos[33], 0, $hCoresWin)
                    If $respuesta = 6 Then
                        $cancelarProceso = True
                        $hDownloadCancelado = True
                        InetClose($hDownload)
                        $hDownload = 0
                        _LogCores($idCoresLog, $g_textos[34])
                        ExitLoop 3
                    EndIf
                Case $idBtnGuardarLog
                    GuardarRegistroDescarga($idCoresLog)
            EndSwitch

            If $cancelarProceso Then ExitLoop

            Local $infoDescarga = InetGetInfo($hDownload)
            If @error Then
                _LogCores($idCoresLog, $g_textos[86])
                ExitLoop
            EndIf

            If IsArray($infoDescarga) Then
                If $infoDescarga[2] Then
                    $descargaCompleta = True
                    ExitLoop
                ElseIf $infoDescarga[3] Then
                    _LogCores($idCoresLog, $g_textos[86])
                    ExitLoop
                EndIf

                If $infoDescarga[0] > 0 Then
                    $bytesDescargados = $infoDescarga[0]
                    $bytesTotales = $infoDescarga[1]

                    Local $porcentajeDescarga = 0
                    If $bytesTotales > 0 Then
                        $porcentajeDescarga = Int(($bytesDescargados / $bytesTotales) * 25)
                    EndIf

                    Local $progresoTotal = $progresoBase + $porcentajeDescarga
                    If $progresoTotal > 100 Then $progresoTotal = 100
                    GUICtrlSetData($idCoresProgress, $progresoTotal)

                    Local $mbDescargados = Round($bytesDescargados / (1024*1024), 2)
                    Local $mbTotales = Round($bytesTotales / (1024*1024), 2)
                    GUICtrlSetData($idCoresStatus, $g_textos[81] & " " & $carpetaDestino & " (" & $descargaActual & "/" & $totalDescargas & ") - " & $mbDescargados & " MB / " & $mbTotales & " MB")
                EndIf
            EndIf

            Sleep(100)
        WEnd

        If Not $hDownloadCancelado And $hDownload <> 0 Then
            InetClose($hDownload)
            $hDownload = 0
        EndIf

        If $cancelarProceso Then ExitLoop

        If Not $descargaCompleta Then
            _LogCores($idCoresLog, $g_textos[86])
            MsgBox(16, $g_textos[35], $g_textos[36] & @CRLF & $nombreZip, 0, $hCoresWin)
            GUIDelete($hCoresWin)
            HabilitarBotones()
            Return
        EndIf

        _LogCores($idCoresLog, $g_textos[88] & " " & Round(FileGetSize($rutaZip) / (1024*1024), 2) & " MB")

        GUICtrlSetData($idCoresProgress, $progresoBase + 25)
        GUICtrlSetData($idCoresStatus, $g_textos[89] & " " & $carpetaDestino & "...")

        If Not FileExists($rutaCarpeta) Then
            DirCreate($rutaCarpeta)
            _LogCores($idCoresLog, $g_textos[90] & " " & $rutaCarpeta)
        Else
            _LogCores($idCoresLog, $g_textos[91] & " " & $rutaCarpeta)
        EndIf

        Local $rutaTemporal = $directorioDescarga & "\temp_extract_" & $i
        If Not FileExists($rutaTemporal) Then
            DirCreate($rutaTemporal)
        EndIf

        _LogCores($idCoresLog, $g_textos[85])
        Local $comandoPowerShell = 'powershell.exe -Command "Expand-Archive -Path ''' & $rutaZip & ''' -DestinationPath ''' & $rutaTemporal & ''' -Force"'
        Local $resultado = RunWait($comandoPowerShell, "", @SW_HIDE)

        If $resultado = 0 Then
            _LogCores($idCoresLog, $g_textos[92])

            Local $aSubDirs = _FileListToArray($rutaTemporal, "*", $FLTA_FOLDERS)

            If Not @error And IsArray($aSubDirs) And $aSubDirs[0] > 0 Then
                Local $subdirBase = $rutaTemporal & "\" & $aSubDirs[1]
                _LogCores($idCoresLog, $g_textos[93] & " " & $aSubDirs[1])

                Local $comandoMover = 'xcopy "' & $subdirBase & '\*" "' & $rutaCarpeta & '\" /E /I /Y /H'
                Local $resultadoMover = RunWait(@ComSpec & ' /c ' & $comandoMover, "", @SW_HIDE)

                If $resultadoMover = 0 Then
                    _LogCores($idCoresLog, $g_textos[94])
                Else
                    _LogCores($idCoresLog, $g_textos[95] & " " & $resultadoMover)
                EndIf
            Else
                _LogCores($idCoresLog, $g_textos[96])
                Local $comandoMover = 'xcopy "' & $rutaTemporal & '\*" "' & $rutaCarpeta & '\" /E /I /Y /H'
                RunWait(@ComSpec & ' /c ' & $comandoMover, "", @SW_HIDE)
            EndIf

            _LogCores($idCoresLog, $g_textos[97])
            DirRemove($rutaTemporal, 1)

        Else
            _LogCores($idCoresLog, $g_textos[98] & " " & $resultado)
        EndIf

        _LogCores($idCoresLog, $g_textos[99])
        FileDelete($rutaZip)
        _LogCores($idCoresLog, $g_textos[100])

        GUICtrlSetData($idCoresProgress, Int((($i + 1) / $totalDescargas) * 100))

        Sleep(500)
    Next

    GUICtrlSetState($idBtnGuardarLog, $GUI_ENABLE)

    If $cancelarProceso Then
        GUICtrlSetData($idCoresStatus, $g_textos[30])
        _LogCores($idCoresLog, "")
        _LogCores($idCoresLog, "========================================")
        _LogCores($idCoresLog, $g_textos[101])
        _LogCores($idCoresLog, "========================================")

        While 1
            Local $msg = GUIGetMsg()
            Switch $msg
                Case $GUI_EVENT_CLOSE
                    ExitLoop
                Case $idBtnGuardarLog
                    GuardarRegistroDescarga($idCoresLog)
                Case $idBtnVolver
                    ExitLoop
            EndSwitch
            Sleep(100)
        WEnd

        GUIDelete($hCoresWin)
        HabilitarBotones()
        Return
    EndIf

    GUICtrlSetData($idCoresProgress, 100)
    GUICtrlSetData($idCoresStatus, $g_textos[102])

    _LogCores($idCoresLog, "")
    _LogCores($idCoresLog, "========================================")
    _LogCores($idCoresLog, $g_textos[103])
    _LogCores($idCoresLog, "========================================")
    _LogCores($idCoresLog, $g_textos[104])
    _LogCores($idCoresLog, $directorioDescarga)
    _LogCores($idCoresLog, "")
    _LogCores($idCoresLog, $g_textos[40])
    _LogCores($idCoresLog, "  - arcade cores")
    _LogCores($idCoresLog, "  - mist cores")
    _LogCores($idCoresLog, "  - sidi cores")
    _LogCores($idCoresLog, "  - poseidon cores")

    MsgBox(64, $g_textos[37], $g_textos[38] & @CRLF & @CRLF & _
           $g_textos[39] & " " & $directorioDescarga & @CRLF & @CRLF & _
           $g_textos[40] & @CRLF & _
           "  - arcade cores" & @CRLF & _
           "  - mist cores" & @CRLF & _
           "  - sidi cores" & @CRLF & _
           "  - poseidon cores", 0, $hCoresWin)

    While 1
        Local $msg = GUIGetMsg()
        Switch $msg
            Case $GUI_EVENT_CLOSE
                ExitLoop
            Case $idBtnGuardarLog
                GuardarRegistroDescarga($idCoresLog)
            Case $idBtnVolver
                ExitLoop
        EndSwitch
        Sleep(100)
    WEnd

    GUIDelete($hCoresWin)
    HabilitarBotones()
EndFunc

; ==================== FUNCIÓN PARA GUARDAR REGISTRO ====================

Func GuardarRegistroDescarga($logCtrl)
    Local $textoLog = GUICtrlRead($logCtrl)
    If $textoLog = "" Then
        MsgBox(48, $g_textos[18], $g_textos[41])
        Return
    EndIf

    Local $nombreArchivo = "download-log.txt"
    Local $rutaArchivo = FileSaveDialog($g_textos[42], @ScriptDir, $g_textos[43], 16, $nombreArchivo)

    If @error Or $rutaArchivo = "" Then
        Return
    EndIf

    If Not StringRight($rutaArchivo, 4) = ".txt" Then
        $rutaArchivo &= ".txt"
    EndIf

    Local $hFile = FileOpen($rutaArchivo, 2 + 8)
    If $hFile = -1 Then
        MsgBox(16, $g_textos[44], $g_textos[45])
        Return
    EndIf

    Local $tituloLog = ($g_idioma = "ES" ? "==== REGISTRO DE DESCARGA DE CORES ====" : "==== CORE DOWNLOAD LOG ====")
    Local $fechaTexto = ($g_idioma = "ES" ? "Fecha:" : "Date:")

    FileWrite($hFile, $tituloLog & @CRLF)
    FileWrite($hFile, $fechaTexto & " " & @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF)
    FileWrite($hFile, "=======================================" & @CRLF & @CRLF)
    FileWrite($hFile, $textoLog)
    FileClose($hFile)

    MsgBox(64, $g_textos[46], $g_textos[47] & @CRLF & $rutaArchivo)
EndFunc

Func _LogCores($logCtrl, $msg)
    Local $currentText = GUICtrlRead($logCtrl)
    If $currentText <> "" Then
        $currentText &= @CRLF
    EndIf
    GUICtrlSetData($logCtrl, $currentText & $msg)
EndFunc

; ==================== FUNCIÓN PARA FORMATEAR UNIDAD SD ====================

Func FormatearUnidadSD()
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $aUnidades = ObtenerUnidadesExtraibles()

    If @error Or UBound($aUnidades) = 0 Then
        MsgBox(48, $g_textos[48], $g_textos[49])
        HabilitarBotones()
        Return
    EndIf

    Local $hFormatearWin = GUICreate($g_textos[50], 600, 400, -1, -1, -1, -1, $hGUI)

    GUICtrlCreateLabel($g_textos[51], 10, 10, 580, 30, $SS_CENTER)
    GUICtrlSetFont(-1, 11, 600)

    GUICtrlCreateLabel($g_textos[52], 10, 45, 580, 40, $SS_CENTER)
    GUICtrlSetColor(-1, 0xFF0000)
    GUICtrlSetFont(-1, 9, 600)

    Local $idListaUnidades = GUICtrlCreateList("", 50, 90, 500, 150, $WS_BORDER + $WS_VSCROLL)

    For $i = 0 To UBound($aUnidades) - 1
        Local $info = $aUnidades[$i][0] & ":\ - " & $aUnidades[$i][1] & " (" & _
                     Round($aUnidades[$i][2] / (1024*1024*1024), 2) & " GB " & ($g_idioma = "ES" ? "total" : "total") & ", " & _
                     Round($aUnidades[$i][3] / (1024*1024*1024), 2) & " GB " & ($g_idioma = "ES" ? "libres" : "free") & ")"
        GUICtrlSetData($idListaUnidades, $info)
    Next

    GUICtrlSetState($idListaUnidades, $GUI_FOCUS)

    GUICtrlCreateLabel($g_textos[108], 10, 250, 580, 20, $SS_CENTER)
    GUICtrlSetFont(-1, 10, 600)

    GUICtrlCreateLabel($g_textos[109], 50, 280, 150, 20)
    Local $idSistemaArchivos = GUICtrlCreateCombo("exFAT", 200, 275, 150, 25)
    GUICtrlSetData($idSistemaArchivos, "FAT32|FAT|NTFS", "exFAT")

    GUICtrlCreateLabel($g_textos[110], 50, 310, 150, 20)
    Local $idTamanioCluster = GUICtrlCreateCombo($g_textos[111], 200, 305, 150, 25)
    GUICtrlSetData($idTamanioCluster, "512 bytes|1024 bytes|2048 bytes|4096 bytes|8192 bytes|16384 bytes|32768 bytes|65536 bytes", $g_textos[111])

    GUICtrlCreateLabel($g_textos[112], 50, 340, 150, 20)
    Local $idNombreVolumen = GUICtrlCreateInput("DRWH0_SD", 200, 335, 150, 25)

    Local $idBtnContinuar = GUICtrlCreateButton($g_textos[113], 100, 370, 180, 25)
    Local $idBtnCancelar = GUICtrlCreateButton($g_textos[114], 320, 370, 180, 25)

    GUISetState(@SW_SHOW, $hFormatearWin)

    Local $unidadSeleccionada = ""

    While 1
        Local $msg = GUIGetMsg()
        Switch $msg
            Case $GUI_EVENT_CLOSE, $idBtnCancelar
                GUIDelete($hFormatearWin)
                HabilitarBotones()
                Return

            Case $idBtnContinuar
                Local $seleccion = GUICtrlRead($idListaUnidades)
                If $seleccion = "" Then
                    MsgBox(48, $g_textos[53], $g_textos[54])
                    ContinueLoop
                EndIf

                $unidadSeleccionada = StringLeft($seleccion, 2)

                Local $msgConfirmacion = $g_textos[56] & " " & $unidadSeleccionada & "?" & @CRLF & @CRLF & _
                    ($g_idioma = "ES" ? "UNIDAD:" : "DRIVE:") & " " & $seleccion & @CRLF & @CRLF & _
                    $g_textos[116] & @CRLF & @CRLF & _
                    $g_textos[117] & @CRLF & @CRLF & _
                    $g_textos[115]

                Local $confirmacion = MsgBox(52 + 256, $g_textos[55], $msgConfirmacion)

                If $confirmacion = 6 Then
                    ExitLoop
                EndIf
        EndSwitch
    WEnd

    Local $sistemaArchivos = GUICtrlRead($idSistemaArchivos)
    Local $tamanioCluster = GUICtrlRead($idTamanioCluster)
    Local $nombreVolumen = GUICtrlRead($idNombreVolumen)

    GUIDelete($hFormatearWin)

    Local $hProgresoWin = GUICreate($g_textos[118], 500, 150, -1, -1, -1, -1, $hGUI)
    GUICtrlCreateLabel($g_textos[119] & " " & $unidadSeleccionada & " " & ($g_idioma = "ES" ? "a" : "to") & " " & $sistemaArchivos & "...", 10, 10, 480, 30, $SS_CENTER)
    GUICtrlSetFont(-1, 10, 600)

    Local $idProgreso = GUICtrlCreateProgress(10, 50, 480, 25)
    Local $idEtiqueta = GUICtrlCreateLabel($g_textos[120], 10, 85, 480, 20, $SS_CENTER)

    GUISetState(@SW_SHOW, $hProgresoWin)

    GUICtrlSetData($idProgreso, 10)
    GUICtrlSetData($idEtiqueta, $g_textos[121])
    Sleep(1000)

    Local $output = ""
    Local $pid = Run(@ComSpec & " /c diskpart", "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)

    If $pid Then
        StdinWrite($pid, "select volume " & StringLeft($unidadSeleccionada, 1) & @CRLF)
        StdinWrite($pid, "remove letter=" & StringLeft($unidadSeleccionada, 1) & @CRLF)
        StdinWrite($pid, "exit" & @CRLF)
        ProcessWaitClose($pid)
    EndIf

    GUICtrlSetData($idProgreso, 30)
    GUICtrlSetData($idEtiqueta, $g_textos[122])
    Sleep(1000)

    Local $comandoFormato = "format " & $unidadSeleccionada & " /FS:" & $sistemaArchivos & " /Q /Y"

    If $tamanioCluster <> $g_textos[111] Then
        Local $clusterSize = StringReplace($tamanioCluster, " bytes", "")
        $clusterSize = StringReplace($clusterSize, " ", "")
        $comandoFormato &= " /A:" & $clusterSize
    EndIf

    If $nombreVolumen <> "" Then
        $comandoFormato &= " /V:" & $nombreVolumen
    EndIF

    GUICtrlSetData($idProgreso, 50)
    GUICtrlSetData($idEtiqueta, $g_textos[123])

    Local $resultado = RunWait(@ComSpec & " /c " & $comandoFormato, "", @SW_HIDE)

    If $resultado = 0 Then
        GUICtrlSetData($idProgreso, 90)
        GUICtrlSetData($idEtiqueta, $g_textos[124])

        $pid = Run(@ComSpec & " /c diskpart", "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
        If $pid Then
            StdinWrite($pid, "select volume " & StringLeft($unidadSeleccionada, 1) & @CRLF)
            StdinWrite($pid, "assign letter=" & StringLeft($unidadSeleccionada, 1) & @CRLF)
            StdinWrite($pid, "exit" & @CRLF)
            ProcessWaitClose($pid)
        EndIf

        Sleep(2000)
        GUICtrlSetData($idProgreso, 100)

        MsgBox(64, $g_textos[125], _
            $g_textos[126] & @CRLF & @CRLF & _
            $g_textos[127] & " " & $unidadSeleccionada & @CRLF & _
            $g_textos[109] & " " & $sistemaArchivos & @CRLF & _
            $g_textos[112] & " " & ($nombreVolumen <> "" ? $nombreVolumen : "(" & ($g_idioma = "ES" ? "ninguno" : "none") & ")") & @CRLF & @CRLF & _
            $g_textos[128])

    Else
        GUICtrlSetData($idEtiqueta, $g_textos[129] & " " & $resultado & ")")
        MsgBox(16, $g_textos[130], _
            $g_textos[131] & @CRLF & @CRLF & _
            $g_textos[87] & " " & $resultado & @CRLF & _
            $g_textos[132])
    EndIf

    Sleep(2000)
    GUIDelete($hProgresoWin)
    HabilitarBotones()
EndFunc

Func ObtenerUnidadesExtraibles()
    Local $aResultado[0][4]
    Local $driveLetters = DriveGetDrive("REMOVABLE")

    If Not @error Then
        For $i = 1 To $driveLetters[0]
            Local $letter = $driveLetters[$i]
            Local $label = DriveGetLabel($letter)
            If @error Then $label = ($g_idioma = "ES" ? "Sin etiqueta" : "No label")

            Local $totalSize = DriveSpaceTotal($letter)
            Local $freeSpace = DriveSpaceFree($letter)

            ReDim $aResultado[UBound($aResultado) + 1][4]
            $aResultado[UBound($aResultado) - 1][0] = $letter
            $aResultado[UBound($aResultado) - 1][1] = $label
            $aResultado[UBound($aResultado) - 1][2] = $totalSize * 1024 * 1024
            $aResultado[UBound($aResultado) - 1][3] = $freeSpace * 1024 * 1024
        Next
    EndIf

    Return $aResultado
EndFunc

Func ProcesarArchivos($extensiones, $tamano, $sistema)
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $directorioBase = FileSelectFolder($g_textos[59] & " " & $sistema, "")
    If @error Or $directorioBase = "" Then
        MsgBox(48, $g_textos[18], $g_textos[19])
        HabilitarBotones()
        Return
    EndIf

    Local $aArchivos = BuscarArchivosRecursivos($directorioBase, $extensiones)

    If UBound($aArchivos) = 0 Then
        MsgBox(48, $g_textos[18], $g_textos[60])
        HabilitarBotones()
        Return
    EndIf

    $hProgressWin = GUICreate($g_textos[61], 400, 80, -1, -1, -1, -1, $hGUI)
    GUICtrlCreateLabel($g_textos[62] & " " & $sistema & "...", 10, 10, 380, 20, $SS_CENTER)
    $hProgress = GUICtrlCreateProgress(10, 35, 380, 25)
    GUISetState(@SW_SHOW, $hProgressWin)

    Local $totalArchivos = UBound($aArchivos)
    Local $archivosCreados = 0
    Local $archivosExistentes = 0

    For $i = 0 To $totalArchivos - 1
        Local $rutaCompleta = $aArchivos[$i]
        Local $rutaSinExt = StringLeft($rutaCompleta, StringInStr($rutaCompleta, ".", 0, -1) - 1)
        Local $rutaSAV = $rutaSinExt & ".sav"

        If FileExists($rutaSAV) Then
            $archivosExistentes += 1
        Else
            Local $hFile = FileOpen($rutaSAV, 2 + 8)
            If $hFile <> -1 Then
                Local $bloque = ""
                For $k = 1 To 1024
                    $bloque &= "00"
                Next
                $bloque = Binary("0x" & $bloque)

                For $j = 0 To Floor($tamano / 1024) - 1
                    FileWrite($hFile, $bloque)
                Next

                Local $resto = Mod($tamano, 1024)
                If $resto > 0 Then
                    Local $bloqueResto = ""
                    For $k = 1 To $resto
                        $bloqueResto &= "00"
                    Next
                    FileWrite($hFile, Binary("0x" & $bloqueResto))
                EndIf

                FileClose($hFile)
                $archivosCreados += 1
            EndIf
        EndIf

        GUICtrlSetData($hProgress, ($i + 1) / $totalArchivos * 100)
    Next

    GUIDelete($hProgressWin)

    Local $mensaje = $g_textos[64] & " " & $sistema & @CRLF & @CRLF
    $mensaje &= $g_textos[65] & " " & $totalArchivos & @CRLF
    $mensaje &= $g_textos[66] & " " & $archivosCreados & @CRLF
    $mensaje &= $g_textos[67] & " " & $archivosExistentes

    MsgBox(64, $g_textos[63], $mensaje)
    HabilitarBotones()
EndFunc

Func HabilitarBotones()
    GUICtrlSetState($btnMegaDrive, $GUI_ENABLE)
    GUICtrlSetState($btnSNES, $GUI_ENABLE)
    GUICtrlSetState($btnPCEngine, $GUI_ENABLE)
    GUICtrlSetState($btnNES, $GUI_ENABLE)
    GUICtrlSetState($btnFDS, $GUI_ENABLE)
    GUICtrlSetState($btnSMSGG, $GUI_ENABLE)
    GUICtrlSetState($btnAuto, $GUI_ENABLE)
    GUICtrlSetState($btnMRA, $GUI_ENABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_ENABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_ENABLE)
    GUICtrlSetState($btnFirmware, $GUI_ENABLE)
    GUICtrlSetState($btnSalir, $GUI_ENABLE)
EndFunc

Func BuscarArchivosRecursivos($directorio, $extensiones)
    Local $aResultados[0]
    Local $aExtensiones = StringSplit($extensiones, ";", 2)

    For $i = 0 To UBound($aExtensiones) - 1
        Local $busqueda = FileFindFirstFile($directorio & "\" & $aExtensiones[$i])
        If $busqueda <> -1 Then
            While 1
                Local $archivo = FileFindNextFile($busqueda)
                If @error Then ExitLoop
                If Not StringInStr(FileGetAttrib($directorio & "\" & $archivo), "D") Then
                    ReDim $aResultados[UBound($aResultados) + 1]
                    $aResultados[UBound($aResultados) - 1] = $directorio & "\" & $archivo
                EndIf
            WEnd
            FileClose($busqueda)
        EndIf
    Next

    Local $busquedaDir = FileFindFirstFile($directorio & "\*.*")
    If $busquedaDir <> -1 Then
        While 1
            Local $carpeta = FileFindNextFile($busquedaDir)
            If @error Then ExitLoop
            If StringInStr(FileGetAttrib($directorio & "\" & $carpeta), "D") And $carpeta <> "." And $carpeta <> ".." Then
                Local $aSubResultados = BuscarArchivosRecursivos($directorio & "\" & $carpeta, $extensiones)
                For $j = 0 To UBound($aSubResultados) - 1
                    ReDim $aResultados[UBound($aResultados) + 1]
                    $aResultados[UBound($aResultados) - 1] = $aSubResultados[$j]
                Next
            EndIf
        WEnd
        FileClose($busquedaDir)
    EndIf

    Return $aResultados
EndFunc

Func ModoAutomatico()
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $directorioBase = FileSelectFolder($g_textos[68], "")
    If @error Or $directorioBase = "" Then
        MsgBox(48, $g_textos[18], $g_textos[19])
        HabilitarBotones()
        Return
    EndIf

    Local $sistemas[6][3]
    $sistemas[0][0] = "*.md;*.bin;*.smd;*.gen"
    $sistemas[0][1] = 32768
    $sistemas[0][2] = "MegaDrive"

    $sistemas[1][0] = "*.sfc;*.smc"
    $sistemas[1][1] = 32768
    $sistemas[1][2] = "SNES"

    $sistemas[2][0] = "*.pce"
    $sistemas[2][1] = 2048
    $sistemas[2][2] = "PC Engine"

    $sistemas[3][0] = "*.nes"
    $sistemas[3][1] = 32768
    $sistemas[3][2] = "NES/FC"

    $sistemas[4][0] = "*.fds"
    $sistemas[4][1] = 131072
    $sistemas[4][2] = "FDS"

    $sistemas[5][0] = "*.sms;*.gg"
    $sistemas[5][1] = 8192
    $sistemas[5][2] = "SMS/GG"

    Local $totalCreados = 0
    Local $totalExistentes = 0
    Local $totalEncontrados = 0

    For $i = 0 To 5
        Local $extensiones = $sistemas[$i][0]
        Local $tamano = $sistemas[$i][1]
        Local $sistema = $sistemas[$i][2]

        Local $aArchivos = BuscarArchivosRecursivos($directorioBase, $extensiones)

        If UBound($aArchivos) > 0 Then
            $hProgressWin = GUICreate($g_textos[61], 400, 80, -1, -1, -1, -1, $hGUI)
            GUICtrlCreateLabel($g_textos[62] & " " & $sistema & "...", 10, 10, 380, 20, $SS_CENTER)
            $hProgress = GUICtrlCreateProgress(10, 35, 380, 25)
            GUISetState(@SW_SHOW, $hProgressWin)

            Local $totalArchivos = UBound($aArchivos)
            $totalEncontrados += $totalArchivos

            For $j = 0 To $totalArchivos - 1
                Local $rutaCompleta = $aArchivos[$j]
                Local $rutaSinExt = StringLeft($rutaCompleta, StringInStr($rutaCompleta, ".", 0, -1) - 1)
                Local $rutaSAV = $rutaSinExt & ".sav"

                If FileExists($rutaSAV) Then
                    $totalExistentes += 1
                Else
                    Local $hFile = FileOpen($rutaSAV, 2 + 8)
                    If $hFile <> -1 Then
                        Local $bloque = ""
                        For $k = 1 To 1024
                            $bloque &= "00"
                        Next
                        $bloque = Binary("0x" & $bloque)

                        For $k = 0 To Floor($tamano / 1024) - 1
                            FileWrite($hFile, $bloque)
                        Next

                        Local $resto = Mod($tamano, 1024)
                        If $resto > 0 Then
                            Local $bloqueResto = ""
                            For $k = 1 To $resto
                                $bloqueResto &= "00"
                            Next
                            FileWrite($hFile, Binary("0x" & $bloqueResto))
                        EndIf

                        FileClose($hFile)
                        $totalCreados += 1
                    EndIf
                EndIf

                GUICtrlSetData($hProgress, ($j + 1) / $totalArchivos * 100)
            Next

            GUIDelete($hProgressWin)
        EndIf
    Next

    Local $mensaje = $g_textos[69] & @CRLF & @CRLF
    $mensaje &= $g_textos[70] & " " & $totalEncontrados & @CRLF
    $mensaje &= $g_textos[71] & " " & $totalCreados & @CRLF
    $mensaje &= $g_textos[72] & " " & $totalExistentes

    MsgBox(64, $g_textos[63], $mensaje)
    HabilitarBotones()
EndFunc

; ==================== FUNCIONES PARA PROCESAMIENTO MRA ====================

Func EjecutarProcesamientoMRA()
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $mraPath = @ScriptDir & "\mra.exe"
    If Not FileExists($mraPath) Then
        MsgBox(16, $g_textos[44], $g_textos[73] & @CRLF & @CRLF & $g_textos[74] & " " & $mraPath)
        HabilitarBotones()
        Return
    EndIf

    Local $path = FileSelectFolder($g_textos[75], "")
    If @error Or $path = "" Then
        MsgBox(48, $g_textos[18], $g_textos[19])
        HabilitarBotones()
        Return
    EndIf

    Local $hMRAWin = GUICreate($g_textos[76], 820, 540, -1, -1, -1, -1, $hGUI)
    Local $idMRAProgress = GUICtrlCreateProgress(10, 10, 800, 20, $PBS_SMOOTH)
    Local $idMRALog = GUICtrlCreateEdit("", 10, 40, 800, 440, $ES_MULTILINE + $ES_READONLY + $WS_VSCROLL)
    Local $idBtnCancelar = GUICtrlCreateButton($g_textos[141], 240, 490, 160, 35)
    Local $idBtnAbrirLog = GUICtrlCreateButton($g_textos[142], 420, 490, 160, 35)
    GUICtrlSetState($idBtnAbrirLog, $GUI_DISABLE)
    GUISetState(@SW_SHOW, $hMRAWin)

    Local $logFilePath = @ScriptDir & "\mra-log.txt"
    Local $hLogFile = FileOpen($logFilePath, 2)
    If $hLogFile <> -1 Then
        Local $tituloLog = ($g_idioma = "ES" ? "=== LOG DE PROCESAMIENTO MRA ====" : "=== MRA PROCESSING LOG ====")
        Local $fechaTexto = ($g_idioma = "ES" ? "Fecha y hora:" : "Date and time:")
        FileWrite($hLogFile, $tituloLog & @CRLF)
        FileWrite($hLogFile, $fechaTexto & " " & @MDAY & "-" & @MON & "-" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF)
        FileWrite($hLogFile, "=================================" & @CRLF & @CRLF)
        FileClose($hLogFile)
    EndIf

    Local $ultimasAcciones[30]
    For $x = 0 To 29
        $ultimasAcciones[$x] = ""
    Next

    Local $romsReadyPath = $path & "\roms-ready"
    If Not FileExists($romsReadyPath) Then
        DirCreate($romsReadyPath)
        Local $msgCarpeta = ($g_idioma = "ES" ? "Carpeta creada:" : "Folder created:")
        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $msgCarpeta & " " & $romsReadyPath)
    EndIf

    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[134] & " " & $path)
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[135])

    Local $aFiles = _GetRecursiveFilesMRA($path, "mra", $idMRALog, $logFilePath, $ultimasAcciones)

    If UBound($aFiles) = 0 Then
        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[136])
        MsgBox(48, $g_textos[18], $g_textos[77])
        GUIDelete($hMRAWin)
        HabilitarBotones()
        Return
    EndIf

    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[137] & " " & UBound($aFiles) & " " & $g_textos[138])
    GUICtrlSetData($idMRAProgress, 0)

    Local $total = UBound($aFiles)
    Local $cancelarProceso = False
    Local $pidActual = 0

    For $i = 0 To $total - 1
        Local $msg = GUIGetMsg()
        If $msg = $idBtnCancelar Or $msg = $GUI_EVENT_CLOSE Then
            Local $respuesta = MsgBox(292, $g_textos[27], $g_textos[139] & @CRLF & @CRLF & $g_textos[140], 0, $hMRAWin)
            If $respuesta = 6 Then
                If $pidActual > 0 Then
                    ProcessClose($pidActual)
                EndIf
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[143])
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                MsgBox(48, $g_textos[105], $g_textos[106] & @CRLF & @CRLF & $g_textos[107] & " " & $i & " " & ($g_idioma = "ES" ? "de" : "of") & " " & $total, 0, $hMRAWin)
                $cancelarProceso = True
                ExitLoop
            EndIf
        ElseIf $msg = $idBtnAbrirLog Then
            ShellExecute($logFilePath)
        EndIf

        Local $fullPath = $aFiles[$i]
        Local $folder = StringLeft($fullPath, StringInStr($fullPath, "\", 0, -1) - 1)
        Local $fileName = StringMid($fullPath, StringInStr($fullPath, "\", 0, -1) + 1)

        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[133] & $fileName)

        Local $cmd = '"' & $mraPath & '" -A "' & $fullPath & '"'
        $pidActual = Run($cmd, $folder, @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
        Local $outputCompleto = ""
        Local $errorDetectado = False
        Local $tipoError = ""
        Local $detalleError = ""

        While 1
            $msg = GUIGetMsg()
            If $msg = $idBtnCancelar Or $msg = $GUI_EVENT_CLOSE Then
                Local $respuesta = MsgBox(292, $g_textos[27], $g_textos[139] & @CRLF & @CRLF & $g_textos[140], 0, $hMRAWin)
                If $respuesta = 6 Then
                    ProcessClose($pidActual)
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[143])
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                    MsgBox(48, $g_textos[105], $g_textos[106] & @CRLF & @CRLF & $g_textos[107] & " " & $i & " " & ($g_idioma = "ES" ? "de" : "of") & " " & $total, 0, $hMRAWin)
                    $cancelarProceso = True
                    ExitLoop 2
                EndIf
            ElseIf $msg = $idBtnAbrirLog Then
                ShellExecute($logFilePath)
            EndIf

            Local $data = StdoutRead($pidActual)
            Local $dataErr = StderrRead($pidActual)

            If Not ProcessExists($pidActual) Then
                Local $remainingData = StdoutRead($pidActual)
                Local $remainingErr = StderrRead($pidActual)
                If $remainingData <> "" Then
                    $outputCompleto &= $remainingData
                    _LogMRAToFile($logFilePath, $remainingData)
                EndIf
                If $remainingErr <> "" Then
                    $outputCompleto &= $remainingErr
                    _LogMRAToFile($logFilePath, $remainingErr)
                EndIf
                ExitLoop
            EndIf

            If $data <> "" Then
                $outputCompleto &= $data
                _LogMRAToFile($logFilePath, $data)
            EndIf

            If $dataErr <> "" Then
                $outputCompleto &= $dataErr
                _LogMRAToFile($logFilePath, $dataErr)
            EndIf

            If StringInStr($outputCompleto, "Error reading") Or _
               StringInStr($outputCompleto, "corrupted") Or _
               StringInStr($outputCompleto, "CRC failed") Or _
               StringInStr($outputCompleto, "bad CRC") Or _
               StringInStr($outputCompleto, "unexpected end of archive") Or _
               StringInStr($outputCompleto, "invalid compressed data") Then
                $errorDetectado = True
                $tipoError = ($g_idioma = "ES" ? "ZIP Corrupto" : "Corrupted ZIP")
                $detalleError = ($g_idioma = "ES" ? "Se ha detectado un archivo ZIP en mal estado." : "A corrupted ZIP file has been detected.")
                ExitLoop
            EndIf

            If StringInStr($outputCompleto, "Error") Or _
               StringInStr($outputCompleto, "ERROR") Or _
               StringInStr($outputCompleto, "Failed") Or _
               StringInStr($outputCompleto, "FAILED") Or _
               StringInStr($outputCompleto, "not found") Or _
               StringInStr($outputCompleto, "cannot open") Or _
               StringInStr($outputCompleto, "access denied") Then
                $errorDetectado = True
                $tipoError = ($g_idioma = "ES" ? "Un archivo MRA no ha podido procesarse" : "An MRA file could not be processed")
                $detalleError = ($g_idioma = "ES" ? "No se pudo generar la rom/arc (compruebe el zip)" : "Could not generate rom/arc (check the zip)")
                ExitLoop
            EndIf
        WEnd

        If $errorDetectado Then
            ProcessClose($pidActual)
            _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
            _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "*** " & ($g_idioma = "ES" ? "ERROR DETECTADO:" : "ERROR DETECTED:") & " " & $tipoError & " ***")
            _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, ($g_idioma = "ES" ? "Archivo MRA:" : "MRA file:") & " " & $fileName)
            _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")

            Local $msgContinuar = ($g_idioma = "ES" ? "¿Desea continuar procesando los archivos restantes?" : "Do you want to continue processing the remaining files?")
            Local $msgCancelar = ($g_idioma = "ES" ? "Pulse 'Cancelar' para abortar el proceso." : "Press 'Cancel' to abort the process.")
            Local $msgReintentar = ($g_idioma = "ES" ? "Pulse 'Reintentar' para continuar el proceso." : "Press 'Retry' to continue the process.")

            Local $respuesta = MsgBox(53, ($g_idioma = "ES" ? "Error:" : "Error:") & " " & $tipoError, $detalleError & @CRLF & @CRLF & _
                   ($g_idioma = "ES" ? "Archivo MRA:" : "MRA file:") & @CRLF & $fileName & @CRLF & @CRLF & _
                   ($g_idioma = "ES" ? "Ubicación:" : "Location:") & @CRLF & $folder & @CRLF & @CRLF & _
                   $msgContinuar & @CRLF & @CRLF & _
                   $msgCancelar & @CRLF & _
                   $msgReintentar, 0, $hMRAWin)
            If $respuesta = 7 Then
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "*** " & ($g_idioma = "ES" ? "PROCESO DETENIDO POR EL USUARIO TRAS ERROR" : "PROCESS STOPPED BY USER AFTER ERROR") & " ***")
                GUICtrlSetState($idBtnAbrirLog, $GUI_ENABLE)
                MsgBox(64, ($g_idioma = "ES" ? "Proceso Detenido" : "Process Stopped"), ($g_idioma = "ES" ? "El proceso ha sido abortado. Para ver el registro pulse en 'ABRIR REGISTRO'." : "The process has been aborted. To view the log press 'OPEN LOG'."), 0, $hMRAWin)

                While 1
                    $msg = GUIGetMsg()
                    If $msg = $GUI_EVENT_CLOSE Or $msg = $idBtnCancelar Then
                        ExitLoop
                    ElseIf $msg = $idBtnAbrirLog Then
                        ShellExecute($logFilePath)
                    EndIf
                WEnd

                GUIDelete($hMRAWin)
                HabilitarBotones()
                Return
            Else
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, ($g_idioma = "ES" ? "Continuando con el siguiente archivo..." : "Continuing with the next file..."))
                _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
            EndIf
        Else
            Sleep(500)

            If Not $cancelarProceso Then
                Local $exitCode = 0
                If ProcessExists($pidActual) Then
                    $exitCode = ProcessWaitClose($pidActual, 10)
                EndIf

                If $exitCode <> 0 And $exitCode <> -1 And $exitCode <> 1 Then
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "*** " & ($g_idioma = "ES" ? "ADVERTENCIA: El proceso terminó con código de error:" : "WARNING: The process ended with error code:") & " " & $exitCode & " ***")
                    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")

                    Local $msgAdvertencia = ($g_idioma = "ES" ? "El proceso MRA.EXE terminó con un código de error inesperado." : "The MRA.EXE process ended with an unexpected error code.")
                    Local $msgPregunta = ($g_idioma = "ES" ? "¿Desea continuar procesando los archivos restantes?" : "Do you want to continue processing the remaining files?")
                    Local $msgSi = ($g_idioma = "ES" ? "Presione 'Sí­' para continuar con el siguiente archivo." : "Press 'Yes' to continue with the next file.")
                    Local $msgNo = ($g_idioma = "ES" ? "Presione 'No' para detener el proceso completamente." : "Press 'No' to stop the process completely.")

                    Local $respuesta = MsgBox(53, ($g_idioma = "ES" ? "Advertencia: Código de Error" : "Warning: Error Code"), $msgAdvertencia & @CRLF & @CRLF & _
                           ($g_idioma = "ES" ? "Archivo MRA:" : "MRA file:") & " " & $fileName & @CRLF & _
                           ($g_idioma = "ES" ? "Código de error:" : "Error code:") & " " & $exitCode & @CRLF & @CRLF & _
                           $msgPregunta & @CRLF & @CRLF & _
                           $msgSi & @CRLF & _
                           $msgNo, 0, $hMRAWin)

                    If $respuesta = 7 Then
                        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "*** " & ($g_idioma = "ES" ? "PROCESO DETENIDO POR EL USUARIO TRAS ADVERTENCIA" : "PROCESS STOPPED BY USER AFTER WARNING") & " ***")
                        GUICtrlSetState($idBtnAbrirLog, $GUI_ENABLE)
                        MsgBox(64, ($g_idioma = "ES" ? "Proceso Detenido" : "Process Stopped"), ($g_idioma = "ES" ? "El proceso ha sido detenido. Puede ver el registro pulsando en 'ABRIR REGISTRO'." : "The process has been stopped. You can view the log by pressing 'OPEN LOG'."), 0, $hMRAWin)

                        While 1
                            $msg = GUIGetMsg()
                            If $msg = $GUI_EVENT_CLOSE Or $msg = $idBtnCancelar Then
                                ExitLoop
                            ElseIf $msg = $idBtnAbrirLog Then
                                ShellExecute($logFilePath)
                            EndIf
                        WEnd

                        GUIDelete($hMRAWin)
                        HabilitarBotones()
                        Return
                    Else
                        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, ($g_idioma = "ES" ? "Continuando con el siguiente archivo..." : "Continuing with the next file..."))
                        _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "")
                    EndIf
                EndIf
            EndIf

            Sleep(200)
            _MoveGeneratedFilesMRA($folder, $romsReadyPath, $idMRALog, $logFilePath, $ultimasAcciones)
        EndIf

        GUICtrlSetData($idMRAProgress, Int((($i + 1) / $total) * 100))
        $pidActual = 0
    Next

    If $cancelarProceso Then
        GUICtrlSetState($idBtnAbrirLog, $GUI_ENABLE)
        MsgBox(48, $g_textos[105], ($g_idioma = "ES" ? "El proceso fue cancelado. Puede ver el registro completo pulsando en 'ABRIR REGISTRO'." : "The process was cancelled. You can view the complete log by pressing 'OPEN LOG'."), 0, $hMRAWin)

        While 1
            $msg = GUIGetMsg()
            If $msg = $GUI_EVENT_CLOSE Or $msg = $idBtnCancelar Then
                ExitLoop
            ElseIf $msg = $idBtnAbrirLog Then
                ShellExecute($logFilePath)
            EndIf
        WEnd

        GUIDelete($hMRAWin)
        HabilitarBotones()
        Return
    EndIf

    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "                 ")
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[145])
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[146])
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[145])
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, "                 ")
    _LogMRA($idMRALog, $logFilePath, $ultimasAcciones, $g_textos[147] & " " & $romsReadyPath)

    GUICtrlSetState($idBtnAbrirLog, $GUI_ENABLE)
    MsgBox(64, $g_textos[63], $g_textos[148] & @CRLF & @CRLF & $g_textos[149] & @CRLF & $romsReadyPath & @CRLF & @CRLF & ($g_idioma = "ES" ? "Puede ver el registro pulsando en 'ABRIR REGISTRO'." : "You can view the log by pressing 'OPEN LOG'."), 0, $hMRAWin)

    While 1
        $msg = GUIGetMsg()
        If $msg = $GUI_EVENT_CLOSE Or $msg = $idBtnCancelar Then
            ExitLoop
        ElseIf $msg = $idBtnAbrirLog Then
            ShellExecute($logFilePath)
        EndIf
    WEnd

    GUIDelete($hMRAWin)
    HabilitarBotones()
EndFunc

Func _GetRecursiveFilesMRA($basePath, $ext, $logCtrl, $logFilePath, ByRef $ultimasAcciones)
    Local $result[0]
    Local $queue[1] = [$basePath]
    Local $fileCount = 0

    While UBound($queue) > 0
        Local $current = $queue[0]
        _ArrayDelete($queue, 0)

        Local $list = _FileListToArray($current, '*.' & $ext, $FLTA_FILES)
        If Not @error Then
            For $i = 1 To $list[0]
                _ArrayAdd($result, $current & '\' & $list[$i])
                $fileCount += 1
                If Mod($fileCount, 10) = 0 Then
                    _LogMRA($logCtrl, $logFilePath, $ultimasAcciones, $g_textos[137] & " " & $fileCount & " " & ($g_idioma = "ES" ? "archivos..." : "files..."))
                    GUIGetMsg()
                EndIf
            Next
        EndIf

        Local $sub = _FileListToArray($current, '*', $FLTA_FOLDERS)
        If Not @error Then
            For $j = 1 To $sub[0]
                If $sub[$j] <> "." And $sub[$j] <> ".." Then
                    _ArrayAdd($queue, $current & '\' & $sub[$j])
                EndIf
            Next
        EndIf
    WEnd

    Return $result
EndFunc

Func _MoveGeneratedFilesMRA($sourceFolder, $destFolder, $logCtrl, $logFilePath, ByRef $ultimasAcciones)
    Local $romFiles = _FileListToArray($sourceFolder, '*.rom', $FLTA_FILES)
    Local $arcFiles = _FileListToArray($sourceFolder, '*.arc', $FLTA_FILES)

    Local $msgMovido = ($g_idioma = "ES" ? "Movido:" : "Moved:")
    Local $msgErrorMover = ($g_idioma = "ES" ? "ERROR al mover:" : "ERROR moving:")

    If Not @error And IsArray($romFiles) Then
        For $i = 1 To $romFiles[0]
            Local $source = $sourceFolder & '\' & $romFiles[$i]
            Local $dest = $destFolder & '\' & $romFiles[$i]
            If FileMove($source, $dest, $FC_OVERWRITE) Then
                _LogMRA($logCtrl, $logFilePath, $ultimasAcciones, $msgMovido & " " & $romFiles[$i])
            Else
                _LogMRA($logCtrl, $logFilePath, $ultimasAcciones, $msgErrorMover & " " & $romFiles[$i])
            EndIf
        Next
    EndIf

    If Not @error And IsArray($arcFiles) Then
        For $j = 1 To $arcFiles[0]
            Local $source = $sourceFolder & '\' & $arcFiles[$j]
            Local $dest = $destFolder & '\' & $arcFiles[$j]
            If FileMove($source, $dest, $FC_OVERWRITE) Then
                _LogMRA($logCtrl, $logFilePath, $ultimasAcciones, $msgMovido & " " & $arcFiles[$j])
            Else
                _LogMRA($logCtrl, $logFilePath, $ultimasAcciones, $msgErrorMover & " " & $arcFiles[$j])
            EndIf
        Next
    EndIf
EndFunc

Func _LogMRA($logCtrl, $logFilePath, ByRef $ultimasAcciones, $msg)
    _LogMRAToFile($logFilePath, $msg)

    Local $limite = UBound($ultimasAcciones)

    For $i = 0 To $limite - 2
        $ultimasAcciones[$i] = $ultimasAcciones[$i + 1]
    Next

    $ultimasAcciones[$limite - 1] = $msg

    Local $textoVentana = ""
    For $i = 0 To $limite - 1
        If $ultimasAcciones[$i] <> "" Then
            $textoVentana &= $ultimasAcciones[$i] & @CRLF
        EndIf
    Next

    GUICtrlSetData($logCtrl, $textoVentana)
EndFunc

Func _LogMRAToFile($logFilePath, $msg)
    Local $hFile = FileOpen($logFilePath, 1)
    If $hFile <> -1 Then
        FileWrite($hFile, $msg & @CRLF)
        FileClose($hFile)
    EndIf
EndFunc

; ==================== FUNCIONES PARA DESCARGA DE FIRMWARE ====================

Func DescargarFirmwareMist()
    GUICtrlSetState($btnMegaDrive, $GUI_DISABLE)
    GUICtrlSetState($btnSNES, $GUI_DISABLE)
    GUICtrlSetState($btnPCEngine, $GUI_DISABLE)
    GUICtrlSetState($btnNES, $GUI_DISABLE)
    GUICtrlSetState($btnFDS, $GUI_DISABLE)
    GUICtrlSetState($btnSMSGG, $GUI_DISABLE)
    GUICtrlSetState($btnAuto, $GUI_DISABLE)
    GUICtrlSetState($btnMRA, $GUI_DISABLE)
    GUICtrlSetState($btnFirmware, $GUI_DISABLE)
    GUICtrlSetState($btnFormatearSD, $GUI_DISABLE)
    GUICtrlSetState($btnDescargarCores, $GUI_DISABLE)
    GUICtrlSetState($btnSalir, $GUI_DISABLE)

    Local $hFirmwareWin = GUICreate($g_textos[78], 600, 200, -1, -1, -1, -1, $hGUI)
    Local $idFirmwareLabel = GUICtrlCreateLabel($g_textos[79], 20, 20, 560, 20, $SS_CENTER)
    Local $idFirmwareProgress = GUICtrlCreateProgress(20, 50, 560, 25)
    Local $idFirmwareStatus = GUICtrlCreateEdit("", 20, 85, 560, 100, $ES_MULTILINE + $ES_READONLY + $WS_VSCROLL)
    GUISetState(@SW_SHOW, $hFirmwareWin)

    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Iniciando descarga de firmware MiST..." : "Starting MiST firmware download..."))
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Conectando con:" : "Connecting to:") & " https://github.com/mist-devel/mist-binaries")

    Local $apiURL = "https://api.github.com/repos/mist-devel/mist-binaries/contents/firmware"

    GUICtrlSetData($idFirmwareLabel, ($g_idioma = "ES" ? "Obteniendo lista de archivos..." : "Getting file list..."))
    GUICtrlSetData($idFirmwareProgress, 25)

    Local $jsonData = BinaryToString(InetRead($apiURL, $INET_FORCERELOAD))

    If @error Or $jsonData = "" Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "ERROR: No se pudo conectar con GitHub" : "ERROR: Could not connect to GitHub"))
        MsgBox(16, $g_textos[44], $g_textos[80])
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Respuesta recibida de GitHub" : "Response received from GitHub"))
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Buscando archivos .upg..." : "Searching for .upg files..."))

    Local $upgFile = ""
    Local $upgURL = ""

    Local $aMatches = StringRegExp($jsonData, '"name":\s*"([^"]+\.upg)"', 3)

    If @error Or UBound($aMatches) = 0 Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "ERROR: No se encontraron archivos .upg" : "ERROR: No .upg files found"))
        MsgBox(16, $g_textos[44], ($g_idioma = "ES" ? "No se encontraron archivos .upg en el repositorio." : "No .upg files found in the repository."))
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    $upgFile = $aMatches[UBound($aMatches) - 1]

    Local $pattern = '"name":\s*"' & StringReplace($upgFile, ".", "\.") & '"[^}]+?"download_url":\s*"([^"]+)"'
    Local $aURLMatch = StringRegExp($jsonData, $pattern, 3)

    If @error Or UBound($aURLMatch) = 0 Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "ERROR: No se pudo obtener la URL de descarga" : "ERROR: Could not get download URL"))
        MsgBox(16, $g_textos[44], ($g_idioma = "ES" ? "No se pudo obtener la URL de descarga del firmware." : "Could not get firmware download URL."))
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    $upgURL = $aURLMatch[0]

    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Archivo encontrado:" : "File found:") & " " & $upgFile)
    _LogFirmware($idFirmwareStatus, "URL: " & $upgURL)

    GUICtrlSetData($idFirmwareLabel, ($g_idioma = "ES" ? "Seleccione ubicación de descarga..." : "Select download location..."))
    Local $saveLocation = FileSaveDialog(($g_idioma = "ES" ? "Guardar firmware como" : "Save firmware as"), @DesktopDir, ($g_idioma = "ES" ? "Archivos UPG (*.upg)" : "UPG Files (*.upg)"), 16, $upgFile, $hFirmwareWin)

    If @error Or $saveLocation = "" Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Descarga cancelada por el usuario" : "Download aborted by user"))
        MsgBox(48, $g_textos[57], $g_textos[58])
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    If Not StringRight($saveLocation, 4) = ".upg" Then
        $saveLocation &= ".upg"
    EndIf

    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Descargando a:" : "Downloading to:") & " " & $saveLocation)
    GUICtrlSetData($idFirmwareLabel, ($g_idioma = "ES" ? "Descargando" : "Downloading") & " " & $upgFile & "...")
    GUICtrlSetData($idFirmwareProgress, 50)

    Local $downloadedData = InetRead($upgURL, $INET_FORCERELOAD)

    If @error Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "ERROR: Fallo en la descarga" : "ERROR: Download failed"))
        MsgBox(16, $g_textos[44], ($g_idioma = "ES" ? "Error al descargar el archivo." : "Error downloading file.") & @CRLF & @CRLF & $g_textos[87] & " " & @error)
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    GUICtrlSetData($idFirmwareProgress, 75)
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Descarga completada, guardando archivo..." : "Download completed, saving file..."))

    Local $hFile = FileOpen($saveLocation, 2 + 16)
    If $hFile = -1 Then
        _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "ERROR: No se pudo crear el archivo" : "ERROR: Could not create file"))
        MsgBox(16, $g_textos[44], ($g_idioma = "ES" ? "No se pudo guardar el archivo en la ubicación seleccionada." : "Could not save file to selected location."))
        GUIDelete($hFirmwareWin)
        HabilitarBotones()
        Return
    EndIf

    FileWrite($hFile, $downloadedData)
    FileClose($hFile)

    GUICtrlSetData($idFirmwareProgress, 100)
    GUICtrlSetData($idFirmwareLabel, ($g_idioma = "ES" ? "¡Descarga completada!" : "Download completed!"))
    _LogFirmware($idFirmwareStatus, "")
    _LogFirmware($idFirmwareStatus, "========================================")
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "DESCARGA COMPLETADA EXITOSAMENTE" : "DOWNLOAD COMPLETED SUCCESSFULLY"))
    _LogFirmware($idFirmwareStatus, "========================================")
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Archivo:" : "File:") & " " & $upgFile)
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Ubicación:" : "Location:") & " " & $saveLocation)
    _LogFirmware($idFirmwareStatus, ($g_idioma = "ES" ? "Tamaño:" : "Size:") & " " & Round(FileGetSize($saveLocation) / 1024, 2) & " KB")

    Local $msgFinal = ($g_idioma = "ES" ? "Firmware descargado exitosamente:" : "Firmware downloaded successfully:") & @CRLF & @CRLF & _
           ($g_idioma = "ES" ? "Archivo:" : "File:") & " " & $upgFile & @CRLF & _
           ($g_idioma = "ES" ? "Ubicación:" : "Location:") & " " & $saveLocation & @CRLF & @CRLF & _
           ($g_idioma = "ES" ? "Copie este archivo como 'firmware.upg' en el directorio raíz de su tarjeta SD." : "Copy this file as 'firmware.upg' in the root folder of your SD card.")

    MsgBox(64, $g_textos[37], $msgFinal, 0, $hFirmwareWin)

    GUIDelete($hFirmwareWin)
    HabilitarBotones()
EndFunc

Func _LogFirmware($logCtrl, $msg)
    Local $currentText = GUICtrlRead($logCtrl)
    If $currentText <> "" Then
        $currentText &= @CRLF
    EndIf
    GUICtrlSetData($logCtrl, $currentText & $msg)
EndFunc