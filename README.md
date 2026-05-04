# 🌐 Servidor Web Nginx Seguro

Proyecto de despliegue de un servidor web seguro utilizando Nginx en entorno Linux, incluyendo automatización, configuración segura y soporte HTTPS.

---

## 🎯 Objetivos

* Instalar y configurar Nginx automáticamente
* Aplicar buenas prácticas de seguridad
* Implementar HTTPS (certificado autofirmado)
* Simular entorno real con resolución DNS local
* Documentar el proceso completo

---

## 🛠️ Tecnologías utilizadas

* Linux (Ubuntu / Debian)
* Nginx
* Bash scripting
* OpenSSL
* DNS local

---

## ⚙️ Instalación

### 1. Clonar repositorio

```bash
git clone https://github.com/casattijulian-ship-it/servidor-web-nginx-seguro.git
cd servidor-web-nginx-seguro
```

---

### 2. Ejecutar script

```bash
chmod +x scripts/install_nginx.sh
sudo ./scripts/install_nginx.sh
```

---

## 🔒 Configuración de seguridad

Se han aplicado las siguientes medidas:

* Ocultación de versión de Nginx (`server_tokens off`)
* Protección contra clickjacking (`X-Frame-Options`)
* Protección contra MIME sniffing (`X-Content-Type-Options`)
* Restricción de acceso a archivos sensibles

---

## 🌐 Configuración HTTPS

Se ha implementado HTTPS mediante certificado autofirmado:

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt
```

Configuración en Nginx:

* Redirección HTTP → HTTPS
* Uso de certificados SSL locales

⚠️ Nota: El navegador mostrará advertencia al tratarse de un certificado autofirmado.

---

## 🧠 DNS local

Se ha utilizado un dominio local:

```
miweb.local
```

Configurado en el archivo `hosts` para simular un entorno real.

---

## 🧪 Pruebas

Acceso al servidor:

```
https://miweb.local
```

Resultado esperado:

* Página web cargada correctamente
* Conexión cifrada (HTTPS)
* Advertencia de certificado (esperada en entorno local)

---

## 📁 Estructura del proyecto

```
servidor-web-nginx-seguro/
│
├── scripts/
│   └── install_nginx.sh
│
├── configs/
│   └── nginx_secure.conf
│
├── README.md
└── .gitattributes
```

---

## 🚀 Mejoras futuras

* Implementación de Let's Encrypt en entorno real
* Automatización completa del despliegue
* Configuración de firewall (ufw)
* Integración con Fail2Ban

---

## 👨‍💻 Autor Julian Enrique Casatti Llull @julianllull

Proyecto realizado como práctica de ASIX / Ciberseguridad.

---
