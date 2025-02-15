#!/bin/bash

# Script para mostrar información del sistema
# Creado por MiguelGG, mgonzalez@opensai.org
# Versión 1.0
# Fecha de creación: $(date +"%Y-%m-%d")

# Colores para mensajes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

# Función para solicitar confirmación
confirmar_continuar() {
    echo -e "${YELLOW}Presiona Enter para continuar o Ctrl+C para salir...${NC}"
    read
}

# Limpiar pantalla
clear

# Cabecera
echo -e "${GREEN}####################################################${NC}"
echo -e "${GREEN}## Script de Información del Sistema             ##${NC}"
echo -e "${GREEN}## Creado por: MiguelGG                          ##${NC}"
echo -e "${GREEN}## Contacto: mgonzalez@opensai.org               ##${NC}"
echo -e "${GREEN}## Versión: 1.0                                  ##${NC}"
echo -e "${GREEN}## Fecha de creación: $(date +"%Y-%m-%d")            ##${NC}"
echo -e "${GREEN}####################################################${NC}"
echo ""

# Menú informativo
echo -e "${GREEN}Este script mostrará la siguiente información:${NC}"
echo -e "${GREEN}1. Información del sistema${NC}"
echo -e "${GREEN}2. Uso de la CPU${NC}"
echo -e "${GREEN}3. Uso de la memoria${NC}"
echo -e "${GREEN}4. Uso del disco${NC}"
echo -e "${GREEN}5. Espacio en el directorio Home${NC}"
echo -e "${GREEN}6. Procesos en ejecución${NC}"
echo -e "${GREEN}7. Conexiones de red${NC}"
echo -e "${GREEN}8. Dispositivos de bloque${NC}"
echo -e "${GREEN}9. Chequeo de errores en logs${NC}"
echo -e "${GREEN}10. Estado de servicios (Apache, Nginx, MySQL, PostgreSQL)${NC}"
echo -e "${GREEN}11. Estado del firewall${NC}"
echo -e "${GREEN}12. Estado de SELinux${NC}"
echo -e "${GREEN}13. Zona horaria${NC}"
echo -e "${GREEN}14. Puertos abiertos${NC}"
echo -e "${GREEN}15. IP local y pública${NC}"
echo -e "${GREEN}16. Usuarios y grupos${NC}"
echo -e "${GREEN}17. Tarjetas de red${NC}"
echo -e "${GREEN}18. Kernels instalados${NC}"
echo -e "${GREEN}19. USBs conectados${NC}"
echo -e "${GREEN}20. Dispositivos PCI${NC}"
echo -e "${GREEN}21. Tráfico de red${NC}"
echo -e "${GREEN}22. Ubicación geográfica${NC}"
echo -e "${GREEN}23. Información detallada del hardware${NC}"
echo -e "${GREEN}24. Información del sistema (completa)${NC}"
echo -e "${GREEN}####################################################${NC}"
echo ""

# Pausa inicial
confirmar_continuar

# 1. Información del sistema
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Información del Sistema         ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Nombre del Host: $(hostname)${NC}"
echo -e "${GREEN}Kernel: $(uname -r)${NC}"
echo -e "${GREEN}Arquitectura: $(uname -m)${NC}"
echo -e "${GREEN}Sistema Operativo: $(uname -o)${NC}"
echo ""
confirmar_continuar

# 2. Uso de la CPU
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Uso de la CPU                   ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Carga promedio (1, 5, 15 min): $(uptime | awk '{print $NF-2, $NF-1, $NF}')${NC}"
echo ""
confirmar_continuar

# 3. Uso de la memoria
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Uso de la Memoria               ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
free -h
echo ""
confirmar_continuar

# 4. Uso del disco
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Uso del Disco                   ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
df -h
echo ""
confirmar_continuar

# 5. Espacio en el directorio Home
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Espacio en el directorio Home   ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
du -hs ~
echo ""
confirmar_continuar

# 6. Procesos en ejecución
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Procesos en Ejecución           ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Top 10 procesos que consumen más CPU:${NC}"
ps aux --sort=-%cpu | head -n 11 | awk '{printf "%-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $11}' | column -t
echo ""
confirmar_continuar

# 7. Conexiones de red
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Conexiones de Red               ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
netstat -tulnp
echo ""
confirmar_continuar

# 8. Dispositivos de bloque
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Dispositivos de Bloque          ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
lsblk
echo ""
confirmar_continuar

# 9. Chequeo de errores en logs
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Chequeo de Errores (Logs)       ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Últimas 50 líneas de logs del sistema:${NC}"
echo -e "${YELLOW}Presiona la tecla 'q' para salir de la visualización de logs.${NC}"
journalctl -n 50 -p 3 -xb | less
echo ""
confirmar_continuar

# 10. Estado de servicios
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Estado de Servicios             ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
services=("httpd" "nginx" "mysqld" "postgresql")
for service in "${services[@]}"; do
    status=$(systemctl is-active $service 2>/dev/null)
    if [ "$status" = "active" ]; then
        echo -e "${GREEN}Servicio $service: ${status}${NC}"
    else
        echo -e "${RED}Servicio $service: ${status}${NC}"
    fi
done
echo ""
confirmar_continuar

# 11. Estado del firewall
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Estado del Firewall             ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
firewall_status=$(sudo firewall-cmd --state 2>/dev/null)
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Firewall: ${firewall_status}${NC}"
    echo ""
    echo -e "${GREEN}Zonas activas:${NC}"
    sudo firewall-cmd --get-active-zones
    echo ""
    echo -e "${GREEN}Puertos abiertos (permitidos):${NC}"
    sudo firewall-cmd --list-ports
    echo ""
    echo -e "${GREEN}Servicios permitidos:${NC}"
    sudo firewall-cmd --list-services
    echo ""
    echo -e "${GREEN}Reglas personalizadas:${NC}"
    sudo firewall-cmd --list-all
else
    echo -e "${RED}Firewall no está instalado o no está activo.${NC}"
fi
echo ""
confirmar_continuar

# 12. Estado de SELinux
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Estado de SELinux               ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
sestatus
echo ""
confirmar_continuar

# 13. Zona horaria
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Zona Horaria                    ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
timedatectl
echo ""
confirmar_continuar

# 14. Puertos abiertos
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Puertos Abiertos                ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
ss -tuln
echo ""
confirmar_continuar

# 15. IP local y pública
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## IP Local y Pública              ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}IP Local: $(hostname -I)${NC}"
echo -e "${GREEN}IP Pública: $(curl -s ifconfig.me)${NC}"
echo ""
confirmar_continuar

# 16. Usuarios y grupos
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Usuarios y Grupos              ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Usuarios:${NC}"
cut -d: -f1 /etc/passwd
echo ""
echo -e "${GREEN}Grupos:${NC}"
cut -d: -f1 /etc/group
echo ""
confirmar_continuar

# 17. Tarjetas de red
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Tarjetas de Red                ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
ip link show
echo ""
confirmar_continuar

# 18. Kernels instalados
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Kernels Instalados             ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
rpm -q kernel
echo ""
confirmar_continuar

# 19. USBs conectados
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## USBs Conectados                ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
lsusb
echo ""
confirmar_continuar

# 20. Dispositivos PCI
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Dispositivos PCI                ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
lspci
echo ""
confirmar_continuar

# 21. Tráfico de red
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Tráfico de Red                 ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
if command -v vnstat &>/dev/null; then
    echo -e "${GREEN}Tráfico de red (últimos 3 días):${NC}"
    vnstat -d
else
    echo -e "${RED}vnstat no está instalado. Para instalarlo, ejecuta:${NC}"
    echo -e "${YELLOW}sudo dnf install vnstat${NC}"
fi
echo ""
confirmar_continuar

# 22. Ubicación geográfica
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Ubicación Geográfica            ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Obteniendo ubicación geográfica...${NC}"
location=$(curl -s https://ipinfo.io)
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Ubicación:${NC}"
    echo "$location" | jq .
else
    echo -e "${RED}No se pudo obtener la ubicación geográfica.${NC}"
fi
echo ""
confirmar_continuar

# 23. Información detallada del hardware
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Información Detallada del Hardware${NC}"
echo -e "${YELLOW}#####################################${NC}"
if command -v lshw &>/dev/null; then
    echo -e "${GREEN}Información del hardware:${NC}"
    sudo lshw -short
else
    echo -e "${RED}lshw no está instalado. Para instalarlo, ejecuta:${NC}"
    echo -e "${YELLOW}sudo dnf install lshw${NC}"
fi
echo ""
confirmar_continuar

# 24. Información del sistema (completa)
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Información del Sistema (Completa)##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Información del sistema:${NC}"
uname -a
echo ""
echo -e "${GREEN}Información de la distribución:${NC}"
lsb_release -a 2>/dev/null || cat /etc/os-release
echo ""
echo -e "${GREEN}Información de la CPU:${NC}"
lscpu
echo ""
echo -e "${GREEN}Información de la memoria:${NC}"
free -h
echo ""
echo -e "${GREEN}Información del disco:${NC}"
df -h
echo ""
confirmar_continuar

# Mensaje final
echo -e "${GREEN}####################################################${NC}"
echo -e "${GREEN}Información del sistema completada.${NC}"
echo -e "${GREEN}####################################################${NC}"

exit 0
