echo "Atualizando Maquina..."
apt-get update
apt-get upgrade -y
echo "Atualização Finalizada!"

echo "Instalando Dependencias..."
apt-get install apache2 -y
apt-get install unzip -y
echo "Dependencias Instaladas com sucesso!"

echo "Baixando arquivos necessarios para o WebSite"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

cd linux-site-dio-main
cp -R * /var/www/html/

echo "Iniciando Apache2" #Passo necessario no WSL
service apache2 start
