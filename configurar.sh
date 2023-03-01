#!/bin/bash

mkdir /projetoCurso
cd /projetoCurso/

echo "Criando as pastas..."

mkdir public adm ven sec

echo "Pastas criadas com sucesso"

sleep 2
clear

echo "Criando grupos...."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados com sucesso!"

sleep 2
clear

echo "Criando Usuarios"

Users=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

for user in ${Users[@]}; do 
    echo "Criando o usuario:" $user
    useradd $user -c "Default User" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
    passwd $user -e
done

echo "Usuarios criados com sucesso"
sleep 2
clear

echo "Configurando permissões dos usuarios"

USERS_ADM=("carlos" "maria" "joao")
USERS_VEN=("debora" "sebastiana" "roberto")
USERS_SEC=("josefina" "amanda" "rogerio")

for admUser in ${USERS_ADM[@]}; do
    usermod -G GRP_ADM $admUser
done

for admUser in ${USERS_VEN[@]}; do
    usermod -G GRP_VEN $admUser
done

for admUser in ${USERS_SEC[@]}; do
    usermod -G GRP_SEC $admUser
done

echo "Permissões adicionadas com sucesso"
sleep 2
clear

echo "Configurando as permissões de grupos para as pastas"

chown root:GRP_ADM adm/
chown root:GRP_VEN ven/
chown root:GRP_SEC sec/

echo "Permissões adicionadas com sucesso"
sleep 2
clear

echo "Configurando os niveis de permissão para cada pasta"

chmod 777 public/
chmod 770 adm/
chmod 770 ven/
chmod 770 sec/

echo "Permissões configuradas com sucesso"
sleep 2
clear

echo "CONFIGURAÇÃO REALIZADA COM SUCESSO!"