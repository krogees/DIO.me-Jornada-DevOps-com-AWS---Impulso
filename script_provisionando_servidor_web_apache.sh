#!/bin/bash

echo "Atualizando sistema e instalando apache para subir servidor..."
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y
systemctl start apache2
systemctl status apache2

echo "Baixando e copiando os arquivos da aplicação para o diretório indicado..."

pwd
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/
systemctl restart apache2
systemctl status apache2
systemctl enable apache2

echo "Finalizando Script..."