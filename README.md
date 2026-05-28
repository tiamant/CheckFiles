# 🚀 Windows 11 System Repair Tool

---

## 💡 ¿Qué es esto?

Este script es una utilidad de mantenimiento diseñada para automatizar las herramientas nativas de diagnóstico y reparación de **Windows 11**. Su objetivo es simplificar procesos complejos de mantenimiento para usuarios que buscan optimizar su sistema sin instalar software de terceros.

---

## 🛠️ Funcionalidades Principales

| Opción | Herramienta | Descripción Técnica |
| --- | --- | --- |
| **[1]** | **DISM** | Verifica y repara la imagen del sistema mediante los módulos `CheckHealth`, `ScanHealth` y `RestoreHealth`. |
| **[2]** | **SFC** | Escaneo profundo del sistema (`sfc /scannow`) para restaurar archivos protegidos dañados o faltantes. |
| **[3]** | **Cleanup** | Ejecuta `StartComponentCleanup` para eliminar paquetes de actualización obsoletos y reducir el uso de disco. |
| **[4]** | **Disk Mgr** | Automatiza la limpieza de archivos temporales, caché y basura del sistema mediante `cleanmgr`. |
| **[9]** | **All-in-One** | Ejecuta la secuencia completa de mantenimiento de forma automática. |

---

## 🚀 Guía de Uso

Para ejecutar el script correctamente, sigue estos pasos:

1. **Descarga:** Obtén el archivo `.bat` desde este repositorio.
2. **Ejecución:** Haz clic derecho sobre el archivo y selecciona **"Ejecutar como administrador"**.
> **Importante:** Se requieren permisos elevados para que los comandos de reparación puedan modificar archivos del sistema.


3. **Selección:** Elige una opción del menú interactivo.

---

## 🛡️ ¿Por qué usar este script?

```text
╔════════════════════════════════════════════════════════════╗
║                   VENTAJAS DE ESTE SCRIPT                  ║
╠════════════════════════════════════════════════════════════╣
║ ✅ Sin instalación de terceros (100% nativo)               ║
║ ✅ Diagnóstico automático de integridad de imagen          ║
║ ✅ Liberación de espacio mediante limpieza profunda        ║
║ ✅ Reporte final de estado tras cada operación             ║
╚════════════════════════════════════════════════════════════╝

```

---

## ⚠️ Consideraciones

* **Reinicio:** Se recomienda encarecidamente reiniciar el equipo tras ejecutar las opciones `[1]` o `[2]` para aplicar correctamente cualquier reparación de archivos críticos.
* **Seguridad:** El script utiliza únicamente comandos oficiales de Microsoft, garantizando la integridad de tu sistema.

---

*Desarrollado para quienes buscan eficiencia y control sobre su sistema Windows.*

---

### ¿Qué te parece este formato?

He añadido una **tabla comparativa** y un **bloque de texto estilizado** para que la información técnica sea más digerible. ¿Te gustaría que agregue alguna sección adicional, como instrucciones para crear un atajo en el escritorio o cómo configurar el `cleanmgr` para que limpie rutas específicas?
