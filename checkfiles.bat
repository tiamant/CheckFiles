@echo off
setlocal EnableDelayedExpansion
color 0A

:MENU
cls
echo.
echo ====================================================================
echo           REPARACION DEL SISTEMA - WINDOWS 11
echo ====================================================================
echo.
echo Selecciona una opcion:
echo.
echo [1] Diagnostico y Reparacion de Imagen (DISM)
echo     --> Verifica y repara automaticamente la integridad del sistema
echo        1. CheckHealth: diagnostica el estado
echo        2. ScanHealth: busca problemas (si los hay, ejecuta RestoreHealth)
echo        3. RestoreHealth: repara los archivos corruptos encontrados
echo.
echo [2] Verificacion de Archivos del Sistema (SFC)
echo     --> Escanea todos los archivos del sistema en busca de corrupcion
echo        y los repara automaticamente.
echo.
echo [3] Limpieza de Componentes del Sistema
echo     --> Elimina versiones antiguas de componentes Windows para liberar
echo        espacio en disco y mejorar el rendimiento
echo.
echo [4] Limpieza de Disco (Disk Cleanup)
echo     --> Elimina archivos temporales, cache y descargas innecesarias
echo        para liberar espacio en disco
echo.
echo [9] Ejecutar TODO
echo     --> Ejecuta TODAS las reparaciones en secuencia
echo.
echo [0] Salir
echo.
echo ====================================================================
echo.

set /p opcion=Selecciona una opcion: 

if "%opcion%"=="0" goto :Salir
if "%opcion%"=="1" goto :DIAVCompleto
if "%opcion%"=="2" goto :SFC
if "%opcion%"=="3" goto :Cleanup
if "%opcion%"=="4" goto :CleanMgr
if "%opcion%"=="9" goto :TodoCompleto

echo.
echo Opcion no valida. Intenta de nuevo.
echo.
pause
goto :MENU

:DIAVCompleto
set "PROBLEMA_ENCONTRADO=0"
set "PROBLEMA_REPARADO=0"

echo.
echo ====================================================================
echo Iniciando Diagnostico y Reparacion de Imagen DISM...
echo ====================================================================
echo.

echo [Paso 1/3] Ejecutando CheckHealth...
echo Esto verificara el estado actual de la imagen del sistema...
echo.
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo CheckHealth completado.
echo.

echo [Paso 2/3] Ejecutando ScanHealth...
echo Esto buscara posibles corrupciones en los archivos del sistema...
echo.
DISM /Online /Cleanup-Image /ScanHealth
if %errorlevel% neq 0 (
    set "PROBLEMA_ENCONTRADO=1"
    echo.
    echo [Paso 3/3] Ejecutando RestoreHealth...
    echo Intentando reparar los archivos corruptos encontrados...
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    if %errorlevel% equ 0 (
        set "PROBLEMA_REPARADO=1"
    )
) else (
    echo.
)
echo.

echo ====================================================================
echo RESUMEN
echo ====================================================================
if %PROBLEMA_ENCONTRADO% equ 0 (
    echo [OK] No se encontraron problemas en la imagen del sistema.
) else (
    if %PROBLEMA_REPARADO% equ 1 (
        echo [OK] Se encontraron problemas y fueron reparados exitosamente.
    ) else (
        echo [ADVERTENCIA] Se encontraron problemas pero no pudieron ser reparados.
        echo Se recomienda reiniciar el equipo e intentar de nuevo.
    )
)
echo ====================================================================
echo.
pause
goto :MENU

:SFC
set "PROBLEMA_ENCONTRADO=0"

echo.
echo ====================================================================
echo Ejecutando Verificacion de Integridad de Archivos (SFC /scannow)
echo ====================================================================
echo.
echo Por favor, no interrumpas la ejecucion.
echo.

sfc /scannow
if %errorlevel% neq 0 (
    set "PROBLEMA_ENCONTRADO=1"
)

echo.
echo ====================================================================
echo RESUMEN
echo ====================================================================
if %PROBLEMA_ENCONTRADO% equ 0 (
    echo [OK] No se encontraron archivos corruptos en el sistema.
) else (
    echo [ADVERTENCIA] Se encontraron archivos corruptos que fueron reparados.
    echo Se recomienda reiniciar el equipo para aplicar los cambios.
)
echo ====================================================================
echo.
pause
goto :MENU

:Cleanup
echo.
echo ====================================================================
echo Ejecutando Limpieza de Componentes del Sistema
echo ====================================================================
echo.
echo Esto eliminara versiones antiguas de actualizaciones y componentes
echo que ya no se utilizan, liberando espacio en disco.
echo.
DISM /Online /Cleanup-Image /StartComponentCleanup
if %errorlevel% equ 0 (
    set "OPERACION_EXITOSA=1"
) else (
    set "OPERACION_EXITOSA=0"
)
echo.

echo ====================================================================
echo RESUMEN
echo ====================================================================
if %OPERACION_EXITOSA% equ 1 (
    echo [OK] Limpieza de componentes completada exitosamente.
) else (
    echo [ERROR] Ocurrio un error durante la limpieza.
)
echo ====================================================================
echo.
pause
goto :MENU

:CleanMgr
echo.
echo ====================================================================
echo Ejecutando Limpieza de Disco (Disk Cleanup)
echo ====================================================================
echo.
echo Esto eliminara archivos temporales, cache de navegador, descargas
echo y otros archivos innecesarios para liberar espacio.
echo.
cleanmgr /sagerun:1
if %errorlevel% equ 0 (
    set "OPERACION_EXITOSA=1"
) else (
    set "OPERACION_EXITOSA=0"
)
echo.

echo ====================================================================
echo RESUMEN
echo ====================================================================
if %OPERACION_EXITOSA% equ 1 (
    echo [OK] Limpieza de disco completada exitosamente.
) else (
    echo [ERROR] Ocurrio un error durante la limpieza.
)
echo ====================================================================
echo.
pause
goto :MENU

:TodoCompleto
set "DISM_PROBLEMA=0"
set "DISM_REPARADO=0"
set "SFC_PROBLEMA=0"
set "CLEANUP_OK=0"
set "CLEANMGR_OK=0"

echo.
set /p confirmar=Ejecutar TODAS las reparaciones? (S/N): 
if /i not "%confirmar%"=="S" (
    goto :MENU
)

echo.
echo ====================================================================
echo INICIANDO REPARACION COMPLETA DEL SISTEMA
echo ====================================================================
echo.
echo Este proceso ejecutara:
echo  1. Diagnostico y Reparacion de Imagen (DISM)
echo  2. Verificacion de Archivos del Sistema (SFC)
echo  3. Limpieza de Componentes
echo  4. Limpieza de Disco
echo.
pause

echo.
echo [Fase 1/4] Diagnostico y Reparacion de Imagen...
echo.
DISM /Online /Cleanup-Image /CheckHealth
echo.
DISM /Online /Cleanup-Image /ScanHealth
if %errorlevel% neq 0 (
    set "DISM_PROBLEMA=1"
    echo Reparando...
    DISM /Online /Cleanup-Image /RestoreHealth
    if %errorlevel% equ 0 (
        set "DISM_REPARADO=1"
    )
)
echo.

echo [Fase 2/4] Verificacion de Archivos del Sistema...
echo.
sfc /scannow
if %errorlevel% neq 0 (
    set "SFC_PROBLEMA=1"
)
echo.

echo [Fase 3/4] Limpieza de Componentes...
echo.
DISM /Online /Cleanup-Image /StartComponentCleanup
if %errorlevel% equ 0 (
    set "CLEANUP_OK=1"
)
echo.

echo [Fase 4/4] Limpieza de Disco...
echo.
cleanmgr /sagerun:1
if %errorlevel% equ 0 (
    set "CLEANMGR_OK=1"
)
echo.

echo ====================================================================
echo RESUMEN DE REPARACION COMPLETA
echo ====================================================================
echo.
echo [Fase 1] Diagnostico y Reparacion de Imagen (DISM):
if %DISM_PROBLEMA% equ 0 (
    echo   [OK] No se encontraron problemas
) else (
    if %DISM_REPARADO% equ 1 (
        echo   [OK] Problemas encontrados y reparados
    ) else (
        echo   [ADVERTENCIA] Problemas encontrados pero no reparados
    )
)
echo.

echo [Fase 2] Verificacion de Archivos del Sistema (SFC):
if %SFC_PROBLEMA% equ 0 (
    echo   [OK] No se encontraron archivos corruptos
) else (
    echo   [OK] Archivos corruptos encontrados y reparados
)
echo.

echo [Fase 3] Limpieza de Componentes:
if %CLEANUP_OK% equ 1 (
    echo   [OK] Limpieza completada exitosamente
) else (
    echo   [ERROR] Ocurrio un error durante la limpieza
)
echo.

echo [Fase 4] Limpieza de Disco:
if %CLEANMGR_OK% equ 1 (
    echo   [OK] Limpieza completada exitosamente
) else (
    echo   [ERROR] Ocurrio un error durante la limpieza
)
echo.

echo ====================================================================
echo SE RECOMIENDA REINICIAR EL EQUIPO AHORA para aplicar todos los cambios.
echo ====================================================================
echo.
pause
goto :MENU

:Salir
echo.
echo Hasta luego!
echo.
pause
exit /b 0