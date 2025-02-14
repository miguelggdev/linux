#!/bin/bash

# Script para diagnóstico básico del sistema
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
echo -e "${GREEN}## Script de Diagnóstico del Sistema             ##${NC}"
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
ps aux --sort=-%cpu | head -n 10
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

# 9. Chequeo de errores en el sistema (logs)
echo -e "${YELLOW}#####################################${NC}"
echo -e "${YELLOW}## Chequeo de Errores (Logs)       ##${NC}"
echo -e "${YELLOW}#####################################${NC}"
echo -e "${GREEN}Últimas 50 líneas de logs del sistema:${NC}"
journalctl -n 50 -p 3 -xb
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

# Mensaje final
echo -e "${GREEN}####################################################${NC}"
echo -e "${GREEN}Diagnóstico completado.${NC}"
echo -e "${GREEN}####################################################${NC}"

exit 0
