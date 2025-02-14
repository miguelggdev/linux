# MainInfoLinux

_MainInfoLinux es un script en Bash creado para proporcionar un diagnóstico completo del sistema en distribuciones Linux, especialmente optimizado para Fedora. Este script recopila información detallada sobre el hardware, el sistema operativo, la red,servicios,logs, de manera interactiva y fácil de usar._

Scripts bash maininfolinux.sh
## Comenzando 🚀
_El script maininfolinux.sh permite a los usuarios obtener un informe detallado del estado de su sistema Linux, incluyendo:_
_Información del sistema (hostname, kernel, arquitectura, etc.)._
_Uso de recursos (CPU, memoria, disco)._
_Estado de servicios (Apache, Nginx, MySQL, PostgreSQL)._
_Puertos abiertos y conexiones de red._
_Información de hardware (USBs, dispositivos PCI, tarjetas de red)._
_Logs del sistema (últimos errores)._
_Tráfico de red (últimos 3 días)._
_El script es interactivo: después de mostrar cada sección, pide confirmación para continuar, lo que permite al usuario revisar la información paso a paso._

### Pre-requisitos 📋

_Distribución Linux (optimizado para Fedora)._
_Permisos de superusuario (root) para algunas funcionalidades._
_Herramientas comunes instaladas (curl, vnstat, lshw, lsusb, lspci, etc.)_

### Instalación 🔧

Clona el repositorio o descarga el script:

```
git clone https://github.com/tu-usuario/maininfolinux.git

```
```
cd maininfolinux

```
Dale permisos de ejecución al script:

```
chmod +x maininfolinux.sh

```

## Ejecución
Ejecuta el script con permisos de superusuario:

```

sudo ./maininfolinux.sh

```

## Interacción
El script mostrará información en secciones.

Después de cada sección, presiona Enter para continuar.

Para salir de la visualización de logs, presiona la tecla q.

## Secciones del Script⚙️
* Información del sistema: 
* Hostname, kernel, arquitectura, etc.
Uso de la CPU: Carga promedio.
Uso de la memoria: Memoria RAM y swap.
Uso del disco: Espacio en discos y particiones.
Espacio en el directorio Home: Uso de espacio en /home.
Procesos en ejecución: Top 10 procesos que consumen CPU.
Conexiones de red: Puertos abiertos y conexiones activas.
Dispositivos de bloque: Discos y particiones.
Chequeo de errores en logs: Últimos 50 errores del sistema.
Estado de servicios: Estado de Apache, Nginx, MySQL, PostgreSQL.
Estado del firewall: Estado del firewall (Firewalld).
Estado de SELinux: Estado y modo de SELinux.
Zona horaria: Configuración de la zona horaria.
Puertos abiertos: Lista de puertos abiertos.
IP local y pública: Direcciones IP del sistema.
Usuarios y grupos: Lista de usuarios y grupos.
Tarjetas de red: Información de las interfaces de red.
Tráfico de red: Tráfico de red en los últimos 3 días.
Kernels instalados: Lista de kernels instalados.
USBs conectados: Dispositivos USB conectados.
Dispositivos PCI: Lista de dispositivos PCI.
Información del hardware: Resumen del hardware del sistema.

## Construido con 🛠️

_Fedora Linux 40_

## Contribuyendo 🖇️
## Recomendaciones📦
_Ejecución con superusuario:_
_Algunas secciones (como la verificación de logs o el estado del firewall) requieren permisos de superusuario._
_Ejecuta el script con sudo._
_Revisión de logs: Usa la tecla q para salir de la visualización de logs._
_Instalación de dependencias: Asegúrate de tener instaladas las herramientas necesarias (vnstat, lshw, lsusb, etc.)_
_Personalización: Puedes modificar el script para adaptarlo a tus necesidades específicas._

## Wiki 📖

