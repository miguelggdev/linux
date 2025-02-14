# MainInfoLinux

_MainInfoLinux es un script en Bash diseñado para proporcionar un diagnóstico completo del sistema en distribuciones Linux, especialmente optimizado para Fedora. Este script recopila información detallada sobre el hardware, el sistema operativo, la red, los servicios, los logs y más, de manera interactiva y fácil de usar._


Scripts bash maininfolinux.sh
## Comenzando 🚀
_El script maininfolinux.sh permite a los usuarios obtener un informe detallado del estado de su sistema Linux, incluyendo:_

_Información del sistema (hostname, kernel, arquitectura, etc.)._
Uso de recursos (CPU, memoria, disco).
Estado de servicios (Apache, Nginx, MySQL, PostgreSQL).
Puertos abiertos y conexiones de red.
Información de hardware (USBs, dispositivos PCI, tarjetas de red).
Logs del sistema (últimos errores).
Tráfico de red (últimos 3 días).
El script es interactivo: después de mostrar cada sección, pide confirmación para continuar, lo que permite al usuario revisar la información paso a paso.

### Pre-requisitos 📋

Distribución Linux (optimizado para Fedora).
Permisos de superusuario (root) para algunas funcionalidades.
Herramientas comunes instaladas (curl, vnstat, lshw, lsusb, lspci, etc.).


Mira **Deployment** para conocer como desplegar el proyecto.



### Instalación 🔧
_Pasos para Ejecutar el Script
1.Crea, clona, copia el archivo
2.Dar permisos de ejecución:
  Ejecuta el siguiente comando para hacer el script ejecutable:
  chmod +x mantenimiento.sh
3.Ejecutar el script:
  Ejecuta el script con permisos de superusuario (root):
sudo ./mantenimiento.sh
Seguir las instrucciones:
El script te pedirá confirmación antes de realizar cada acción crítica. Responde s para continuar o n para cancelar.


## Ejecutando las pruebas ⚙️

./miscript.sh

### Analice las pruebas end-to-end 🔩

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

### Y las pruebas de estilo de codificación ⌨️

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

## Despliegue 📦

_Agrega notas adicionales sobre como hacer deploy_

## Construido con 🛠️

Fedora Linux 40


## Contribuyendo 🖇️

Por favor lee el [CONTRIBUTING.md](https://gist.github.com/villanuevand/xxxxxx) para detalles de nuestro código de conducta, y el proceso para enviarnos pull requests.

## Wiki 📖

