#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Ejecuta como root: sudo ./install_nginx.sh"
  exit 1
fi

echo "🔄 Actualizando paquetes..."
sudo apt update

echo "📦 Instalando Nginx..."
sudo apt install nginx -y

echo "🚀 Iniciando servicio Nginx..."
sudo systemctl start nginx

echo "🔁 Activando Nginx al inicio..."
sudo systemctl enable nginx

echo "✅ Estado del servicio:"
sudo systemctl status nginx --no-pager

echo "🌐 IP del servidor:"
hostname -I

echo "✅ Instalación completada"