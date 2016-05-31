#!/bin/bash

function menu_principal(){
	opc=-1
	while [ $opc -ne 0 ]
    do
		#-- trecho de código inspirado em: https://www.vivaolinux.com.br/script/Shell-Script-simples-usando-case/
		clear
		echo "Escolha uma opção:"
		echo "[1] Instalar Proxy Web"
		echo "[2] Desinstalar Proxy Web"
		echo "[3] Administrar Proxy Web"
		echo "[0] Sair do Script"
		read opc
		case $opc in
			1) instalar ;;
			2) desinstalar ;;
			3) administrar ;;
			0) exit ;;
			*) echo "Opcao desconhecida." ; sleep 3 ;;
		esac
		#-- fim
		read -rsp $'Pressione qualquer tecla para continuar.' -n1
	done
}

function instalar(){
	apt-get update
	apt-get install squid3 squidguard
}

function desinstalar(){
	echo "Executa script de desinstalação"
}

function administrar(){
	#-- trecho de código inspirado em: https://www.vivaolinux.com.br/script/Shell-Script-simples-usando-case/
	clear
	echo "Escolha uma opção:"
	echo "[1] Parar Servidor"
	echo "[2] Iniciar Servidor"
	echo "[3] Adicionar Usuário"
	echo "[4] Remover Usuário"
	echo "[5] Adicionar Exceção de Site"
	echo "[6] Remover Exceção de Site"
	echo "[9] Voltar ao Menu Principal"
	echo "[0] Sair do Script"
	read opc
	case $opc in
		1) parar ;;
		2) iniciar ;;
		3) add_user ;;
		9) menu_principal ;;
		0) exit ;;
		*) echo "Opcao desconhecida." ; sleep 3 ;;
	esac
	#-- fim
	read -rsp $'Pressione qualquer tecla para continuar.' -n1
	administrar
}

function parar(){
	service squid3 stop
}

function iniciar(){
	service squid3 start
}

menu_principal
