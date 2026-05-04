#!/bin/bash

set -e

# Comprobar root
if [ "$EUID" -ne 0 ]; then
  echo "Ejecuta como root: sudo ./install_nginx.sh"
  exit 1
fi

echo "🔄 Actualizando paquetes..."
apt update

echo "📦 Instalando Nginx y OpenSSL..."
apt install nginx openssl -y

echo "🚀 Iniciando Nginx..."
systemctl start nginx
systemctl enable nginx

echo "🔒 Generando certificado SSL..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=ES/ST=Madrid/L=Madrid/O=ASIX/CN=miweb.local"

echo "⚙️ Configurando Nginx seguro con HTTPS..."

cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name miweb.local;
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name miweb.local;

    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    server_tokens off;

    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;

    location / {
        root /var/www/html;
        index index.html;
    }

    location ~ /\.(ht|git) {
        deny all;
    }
}
EOF

echo "🧪 Verificando configuración..."
nginx -t

echo "🔁 Recargando Nginx..."
systemctl reload nginx

echo "🌐 IP del servidor:"
hostname -I

echo "✅ Servidor web seguro con HTTPS configurado correctamente"