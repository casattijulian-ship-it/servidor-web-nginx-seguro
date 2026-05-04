#!/bin/bash

set -e

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