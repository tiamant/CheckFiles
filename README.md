🛠️ Windows 11 System Repair Tool
Este script es una utilidad automatizada de línea de comandos diseñada para facilitar el mantenimiento preventivo y correctivo de sistemas Windows 11. Centraliza las herramientas nativas más potentes del sistema operativo para diagnosticar, reparar y optimizar el rendimiento sin necesidad de instalar software de terceros.

📋 Tabla de Contenidos
Características

Descripción de Opciones

Requisitos

Cómo utilizarlo

🚀 Características
Automatización inteligente: Detecta si el sistema necesita reparación antes de ejecutarla.

Reportes de estado: Proporciona un resumen claro tras cada operación.

Modo "Todo en Uno": Ejecución secuencial de todas las tareas para un mantenimiento completo.

Seguro y Nativo: Utiliza exclusivamente binarios de confianza de Microsoft (DISM, SFC, cleanmgr).

🔍 Descripción de Opciones
[1] Diagnóstico y Reparación de Imagen (DISM)
Utiliza la herramienta Deployment Image Servicing and Management para verificar el almacén de componentes de Windows.

CheckHealth: Realiza una verificación rápida de la imagen del sistema en busca de banderas de corrupción.

ScanHealth: Escanea profundamente la imagen y compara los archivos con la base de datos oficial de Microsoft.

RestoreHealth: Si se detecta corrupción, descarga y reemplaza automáticamente los archivos dañados desde los servidores de Windows Update.

[2] Verificación de Archivos del Sistema (SFC)
Ejecuta el System File Checker (sfc /scannow).

Su función es escanear todos los archivos protegidos del sistema. Si encuentra archivos sobrescritos o corruptos, los restaura utilizando las copias en caché ubicadas en una carpeta comprimida en %WinDir%\System32\dllcache.

[3] Limpieza de Componentes del Sistema
Ejecuta /StartComponentCleanup a través de DISM.

Esta opción elimina versiones antiguas de paquetes, actualizaciones y componentes de Windows que ya han sido reemplazados por parches más nuevos, liberando espacio valioso en la partición del sistema (C:\WinSxS).

[4] Limpieza de Disco (Disk Cleanup)
Lanza cleanmgr /sagerun:1.

Automatiza la eliminación de archivos temporales, caché de navegadores, logs de errores, archivos de instalación antiguos y elementos en la papelera de reciclaje. Nota: Requiere que la configuración de limpieza esté pre-definida mediante el comando /sageset:1.

[9] Ejecutar TODO
Ejecuta el flujo completo de mantenimiento en secuencia: DISM (Check/Scan/Restore) -> SFC -> Limpieza de Componentes -> Limpieza de Disco. Ideal para una puesta a punto integral del sistema.

⚙️ Requisitos
Sistema Operativo: Windows 10 o Windows 11.

Privilegios: Es indispensable ejecutar el archivo .bat como Administrador para que los comandos de reparación tengan permisos de escritura en los archivos protegidos del sistema.

🛠️ Cómo utilizarlo
Descarga el archivo .bat.

Haz clic derecho sobre el archivo.

Selecciona "Ejecutar como administrador".

Sigue las instrucciones en pantalla desde el menú principal.

⚠️ Nota de seguridad: Se recomienda reiniciar el equipo siempre que el script finalice una reparación importante para asegurar que todos los archivos reemplazados se carguen correctamente al iniciar Windows.

Desarrollado para optimizar el rendimiento y la estabilidad de Windows.
