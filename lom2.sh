#!/bin/bash

# ------------------------------ lom: dependencias
ENDFORMAT="\e[0m"

# Colors
LIGHTGREEN=92
LIGHTYELLOW=93
LIGHTBLUE=94

declare -A USUARIOS=(
  [1]="gari_cana"
  [2]="mako_angel"
  [3]="karlo_faruk"
  [4]="tina_anika"
  [5]="lolo_nira"
  [6]="mary_akif"
  [7]="papo_fikret"
  [8]="paco_niko"
  [9]="niko_mikel"
  [10]="ina_cleo"
)

TITULO() {
  echo -e ""
  echo -e "\033[0;${LIGHTGREEN}m$(date +'%H:%M:%S')${ENDFORMAT} \033[0;${LIGHTYELLOW}m---------------------------------- $1${ENDFORMAT}"
}


echo_c() {
  echo -e "\033[0;${1}m${2}${ENDFORMAT}"
}

# ------------------------------ lom: pasos
CHAT() {
  TITULO "Chat"

  if [[ $1 = "full" ]]; then    
    echo "abrir chat"
    adb shell input tap 50 2150
    sleep 1s
    echo "abrir modal de regalos"
    adb shell input tap 110 1930
    sleep 2.5s
  fi

  XX=(
    190
    530
    850
  )

  YY=(
    670
    1070
  )

  for t in {1..4}
  do
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        echo_c $LIGHTBLUE "tap x:$i y:$j, round: $t"
        adb shell input tap $i $j
      done
    done
    sleep 2s
    adb shell input tap 520 300
  done

  if [[ $1 = "full" ]]; then
    echo "cerrar modal de regalos"
    adb shell input tap 520 2180
    sleep 0.5s
    echo "salir del chat"
    adb shell input tap 100 2150
    sleep 1s
  fi
}

RODAR_MAQUINA() {
  for i in {1..3}
  do
    echo "invocar 35 veces"
    adb shell input tap 300 1450
  done
  sleep 2s
  adb shell input tap 520 1900
  sleep 1s
}

TIENDA() {
  TITULO "Tienda"
  echo "ir a la tienda"
  adb shell input tap 940 2180
  sleep 1s
  adb shell input tap 900 50
  sleep 1s
  echo "navegar a la seccion de roleta de habilidades"
  adb shell input tap 170 2010
  sleep 2.5s
  RODAR_MAQUINA
  echo "navegar a la seccion de roleta de companeros"
  adb shell input tap 660 450
  sleep 1s
  RODAR_MAQUINA
  echo "salir de la tienda"
  adb shell input tap 940 2180
  sleep 1s
}

OFICIANTE() {
  TITULO "Oficiante"
  
  echo "ir a la torre"
  adb shell input tap 610 2180
  sleep 1s
  
  echo "abrir seccion de oficiante"
  adb shell input tap 590 750
  sleep 2s
  echo "abrir seccion de ver intimidad"
  adb shell input tap 590 900
  sleep 2s
  echo "abrir modal de conseguir lates"
  adb shell input tap 350 320
  sleep 2s
  echo "aumentar la cantidad de lates"
  adb shell input tap 750 1080
  sleep 1s
  echo "comprar lates"
  adb shell input tap 520 1250
  sleep 2s
  adb shell input tap 520 430
  sleep 2s
  echo "abrir modal de dar lates a la primera persona"
  adb shell input tap 830 750
  sleep 1s
  echo "dar lates"
  adb shell input tap 520 1470
  sleep 1s
  echo "salir de ver intimidad"
  adb shell input tap 520 1840
  sleep 1s
}

RESIDENCIA_SEGUIDORES() {
  TITULO "Residencia de Seguidores"
  echo "abrir residencia de seguidores"
  adb shell input tap 900 1760
  sleep 1s
  echo "abrir el modal de recompensa"
  adb shell input tap 520 2160
  sleep 2.5s
  echo "recibir recompensa online"
  adb shell input tap 520 1860
  sleep 2.5s
  adb shell input tap 520 1860
  sleep 1s
  echo "ir a la seccion de recompensa offline"
  adb shell input tap 710 930
  sleep 2.5s
  echo "recibir recompensa offline"
  adb shell input tap 520 1860
  sleep 2.5s
  adb shell input tap 520 1860
  sleep 2s
  echo "cerrar modal de recompensa"
  adb shell input tap 900 50
  sleep 1s
  echo "salir de la residencia de seguidores"
  adb shell input tap 990 2300
  sleep 1s
}

ESTACIONAMIENTO() {
  TITULO "Estacionamiento"
  echo "abrir estacionamiento"
  adb shell input tap 830 1200
  sleep 1s
  echo "abrir tienda"
  adb shell input tap 730 2180
  sleep 1s
  echo "navegar hacia arriba del menu"
  adb shell input swipe 520 820 520 2200 100
  adb shell input swipe 520 820 520 2200 100
  sleep 1s
  echo "abrir modal de comprar guia de transformacion"
  adb shell input tap 320 1280
  sleep 1s
  echo "seleccionar maximo"
  adb shell input tap 740 1110
  echo "comprar"
  adb shell input tap 520 1260
  sleep 2.5s
  adb shell input tap 900 630
  sleep 1s
  echo "navegar a tarjeta de recompensa offline"
  adb shell input swipe 520 1930 520 1800 2000
  sleep 1s

  YY=(
    1840
    1860
    1890
    1900
    1920
  )

  for t in "${YY[@]}"
  do
    echo "abrir modal de comprar tarjeta de recompensa offline"
    adb shell input tap 320 $YY
    sleep 0.5s
    echo "seleccionar maximo"
    adb shell input tap 740 1110
    # sleep 1s
    echo "comprar"
    adb shell input tap 520 1260
    sleep 0.5s
    adb shell input tap 900 630
    sleep 0.2s
  done
  echo "salir del estacionamiento"
  adb shell input tap 900 2180
  sleep 1s
}

ORAR() {
  for t in {1..700}
  do
    adb shell input tap 500 2130
    sleep 1.5s
  done  
}

COSECHAR() {
  XX=(
    220
    550
    840
  )

  YY=(
    1400
    1820
  )

  for t in {1..30}
  do
    adb shell input tap 140 1970
    sleep 1.5s
    adb shell input tap 720 1050
    sleep 1.5s
    adb shell input tap 500 1300
    sleep 7s

    for i in "${XX[@]}"
    do
      for j in "${YY[@]}"
      do
        adb shell input tap $i $j
        sleep 1.5s
        adb shell input tap 500 1500
        sleep 1.5s
        adb shell input tap 360 990
        sleep 1.5s
        adb shell input tap 260 1170
        sleep 1.5s
        adb shell input tap 500 1350
        sleep 2s
      done
    done
    adb shell input tap 140 1980
    sleep 1.5s
    adb shell input tap 670 1000
    sleep 1.5s
    adb shell input tap 500 1360
    sleep 1.5s
    adb shell input tap 140 1980
    sleep 8s
    adb shell input tap 140 1980
    sleep 2s
  done
}

HACIENDA() {
  TITULO "Hacienda"
  echo "abrir hacienda"
  adb shell input tap 330 1680
  sleep 1s
  echo "abrir tienda"
  adb shell input tap 750 2300
  sleep 1s
  echo "abrir modal de compra de abono"
  adb shell input tap 760 1340
  sleep 1s
  echo "seleccionar 5"
  adb shell input tap 770 1170
  sleep 1s
  echo "comprar"
  adb shell input tap 520 1360
  sleep 2.5s
  adb shell input tap 900 710
  sleep 1s
  echo "salir de la hacienda"
  adb shell input tap 950 2300
  sleep 1s
}

SALON() {
  TITULO "Salon del Clan"
  echo "abrir el modal del salon"
  adb shell input tap 420 440
  sleep 1s
  echo "abrir modal de donaciones"
  adb shell input tap 700 2000
  sleep 1s
  echo "donar al clan"
  for i in {1..15}
  do
    adb shell input tap 520 1370
  done
  sleep 2s
  adb shell input tap 520 1370
  sleep 2s
  echo "navegar a la seccion de ayuda de clan"
  adb shell input tap 400 2000
  sleep 1s
  echo "ayudar a todos"
  adb shell input tap 520 2010
  sleep 2s
  adb shell input tap 520 2010
  sleep 1s
  echo "salir de la seccion de ayuda"
  adb shell input tap 520 2180
  sleep 1.5s
  echo "salir del salon"
  adb shell input tap 520 2170
  sleep 2s
}

PEZ() {
  TITULO "Pez Enojado"
  echo "abrir modal para inscribirse en el pez enojado"
  adb shell input tap 960 1730
  sleep 2.5s
  echo "inscribirse"
  adb shell input tap 520 1770
  sleep 1s
  adb shell input tap 520 1770
  sleep 1s
  echo "salir del menu de inscripcion"
  adb shell input tap 520 1910
  sleep 1s
}

CORREO() {
  TITULO "Correo"
  echo "abrir correo"
  adb shell input tap 80 800
  sleep 1s
  echo "recibir correo"
  adb shell input tap 730 1740
  sleep 2.5s
  adb shell input tap 730 1740
  sleep 1s
  echo "salir del correo"
  adb shell input tap 520 1910
  sleep 1s
}

AMIGOS() {
  TITULO "Amigos"
  echo "entrar a la seccion de amigos"
  adb shell input tap 80 1120
  sleep 2.5s
  echo "dar y recibir"
  adb shell input tap 520 1620
  sleep 2.5s
  adb shell input tap 520 1620
  sleep 1s
  echo "salir de la seccion de amigos"
  adb shell input tap 520 1890
  sleep 1s
}

7_DIAS() {
  TITULO "7 Dias de Recompensas"
  echo "abrir seccion de 7 dias de recompensas"
  adb shell input tap 80 1950
  sleep 1s

  POS=(
    "340|850"
    "740|810"
    "800|1230"
    "500|1210"
    "180|1310"
    "180|1600"
    "610|1560"
  )

  for i in {1..5}
  do
    for t in "${POS[@]}"
    do
      adb shell input tap ${t%%|*} ${t##*|}
      adb shell input tap 150 600
    done
  done

  sleep 1s
  adb shell input tap 150 600
  sleep 1s
  echo "salir de la seccion de 7 dias de recompensas"
  adb shell input tap 520 1890
  sleep 1s
}

LAMPARA_MAGICA() {
  TITULO "Ladron de Lampara Magica"
  echo "abrir menu de ladron de la lampara magica"

  echo "hacer raide"
  for i in {1..3}
  do
    adb shell input tap 870 1530
    sleep 1s
    adb shell input tap 870 1650
    sleep 5s
  done

  # echo "cerrar modal"
  # adb shell input tap 520 1900
  # sleep 1s
}

RUINAS_LLAMAS() {
  TITULO "Ruinas de las LLamas"
  echo "abrir menu de ruinas de las llamas"

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 870 1860
    sleep 1s
    adb shell input tap 870 1650
    sleep 5s
  done

  # echo "cerrar modal"
  # adb shell input tap 520 1900
  # sleep 1s
}

# CIUDAD_ANTIGUA() {
#   TITULO "Ciudad Antigua"
#   echo "abrir menu de ciudad antigua"
#   adb shell input tap 830 940
#   sleep 2.5s
#   echo "volver a la ruina anterior" 
#   adb shell input tap 250 780
#   sleep 1s

#   echo "hacer raide"
#   for i in {1..80}
#   do
#     adb shell input tap 330 1920
#   done

#   echo "cerrar modal"
#   adb shell input tap 520 2079
#   sleep 1s
#   adb shell input tap 711 1260
#   sleep 1s
# }

# TORRE_CRONOLOGICA() {
#   TITULO "Torre Cronologica"
#   echo "abrir menu de torre cronologica"
#   adb shell input tap 830 1250
#   sleep 1s
#   echo "abrir menu de raide"

#   echo "hacer raide"
#   for i in {1..80}
#   do
#     adb shell input tap 450 1570
#   done

#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

# SANTUARIO() {
#   TITULO "Santuario de las LLamas"
#   echo "abrir menu de santuario de llama ardiente"
#   adb shell input tap 830 1560
#   sleep 1s
#   echo "abrir menu de raide"

#   echo "hacer raide"
#   for i in {1..80}
#   do
#     adb shell input tap 410 1600
#   done

#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

# COMPARTIR() {
#   TITULO "Compartir"
#   echo "abrir menu de compartir juego"
#   adb shell input tap 190 430
#   sleep 0.5s
#   echo "compartir con discord"
#   adb shell input tap 340 1480
#   sleep 0.5s
#   echo "cerrar navegador"
#   adb shell am force-stop com.brave.browser
#   adb shell am force-stop com.discord
#   sleep 0.5s
#   echo "recibir gemas de discord"
#   adb shell input tap 300 1350
#   sleep 2.5s
#   adb shell input tap 300 1350
#   echo "cerrar modal"
#   adb shell input tap 520 2140
#   sleep 1s
# }

MISIONES() {
  TITULO "Misiones"
  echo "ir a la seccion de misiones"
  adb shell input tap 80 630
  sleep 1s

  echo "recibir regalos"
  for i in {1..3}
  do
    adb shell input tap 820 950
    adb shell input tap 820 1120
    adb shell input tap 820 1310
    adb shell input tap 820 1470
    adb shell input tap 820 1650
    adb shell input tap 820 1830
    sleep 2.5s
    adb shell input tap 150 540
  done

  echo "recibir diamantes, llaves y ticket"
  adb shell input tap 450 660
  sleep 2.5s
  adb shell input tap 150 540
  sleep 1s
  echo "salir de la seccion de misiones"
  adb shell input tap 900 50
  sleep 2.5s
}

# MISIONES_EVENTO() {
#   TITULO "Misiones del Evento"
#   echo "ir a la seccion de misiones"
#   adb shell input tap $1 $2
#   sleep 1s
#   adb shell input tap 90 2180
#   sleep 1s
  
#   echo "recibir regalos"
  
#   for i in {1..6}
#   do
#     adb shell input tap 730 1300
#     adb shell input tap 730 1480
#     adb shell input tap 730 1650
#     sleep 2s
#     adb shell input tap 730 1300
#     sleep 1s
#   done

#   echo "salir de la seccion de misiones"
#   adb shell input tap 520 1980
#   sleep 1s
#   adb shell input tap 930 2180
#   sleep 1s
# }

MISIONES_EVENTO_2() {
  TITULO "Misiones del Evento"
  echo "ir a la seccion de misiones"
  adb shell input tap $1 $2
  sleep 1s
  adb shell input tap 115 2340
  sleep 1s
  
  echo "recibir regalos"
  
  for i in {1..5}
  do
    adb shell input tap 820 1240
    adb shell input tap 820 1440
    adb shell input tap 820 1615
    adb shell input tap 820 1810
    sleep 2s
    adb shell input tap 820 1810
    sleep 1s
  done

  echo "salir de la seccion de misiones"
  adb shell input tap 520 2020
  sleep 1s
  adb shell input tap 980 2290
  sleep 1s
}

MINERO() {
  TITULO "Minero"

  if [[ $1 = "full" ]]; then
    echo "ir a la mina"
    adb shell input tap 270 830
    sleep 1s
  fi

  XX=(
    100
    260
    450
    630
    800
    1030
  )

  YY=(
    1020
    1220
    1390
    1580
    1440
    1900
    2090
  )

  for t in {1..7}
  do
    echo_c $LIGHTBLUE "round: $t"
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        # adb shell input tap $i $j
        adb shell input tap $i $j
      done
    done
    # adb shell input tap 520 2100
    # adb shell input tap 520 2100
  done

  if [[ $1 = "full" ]]; then
    sleep 1s
    echo "salir de la mina"
    adb shell input tap 990 2300
    sleep 1s
  fi
}

# ------------------------------------------- inicio

MENU_PRINCIPAL() {
  echo "abrir menu principal"
  adb shell input tap 80 190
  sleep 1s
  CORREO
  AMIGOS
  7_DIAS
  echo "salir del menu principal"
  adb shell input tap 900 50
  sleep 1s
}

# LUCHA() {
#   echo "abrir seccion de lucha"
#   adb shell input tap 440 2320
#   sleep 1s
#   echo "navegar hacia arriba del menu de lucha"
#   adb shell input swipe 520 900 520 2200 100
#   sleep 1s
#   # LAMPARA_MAGICA
#   # RUINAS_LLAMAS
#   # echo "navegar a la seccion de ciudad antigua"
#   # adb shell input swipe 520 1930 520 1000 2000
#   # sleep 1s
#   # CIUDAD_ANTIGUA
#   # TORRE_CRONOLOGICA
#   # SANTUARIO
#   # echo "cerrar menu de lucha"
#   # adb shell input tap 430 2180
#   # sleep 1s
# }

TORRE() {
  echo "ir a la torre"
  adb shell input tap 620 2300
  sleep 1s
  MINERO "full"
  RESIDENCIA_SEGUIDORES
  # ESTACIONAMIENTO
  # HACIENDA
  echo "salir de la torre"
  adb shell input tap 615 2300
  sleep 1s
}

CLAN() {
  echo "ir a la isla del clan"
  adb shell input tap 840 2320
  sleep 1s
  echo "navegar hasta abajo"
  adb shell input swipe 520 600 520 2100 7000
  SALON
  PEZ
  echo "salir de la isla de clan"
  adb shell input tap 840 2320
  sleep 2.5s
}

CARTAS() {
  XX=(
    170
    360
    600
    820
  )

  YY=(
    950
    1200
    1460
    1670
    1900
  )

  for j in "${YY[@]}"
  do
    for i in "${XX[@]}"
    do
      adb shell input tap $i $j
    done
  done
}

RECIBIR() {
  TITULO "${USUARIOS[$1]}"
  echo "antes de seguir haga lo siguiente:"
  echo "- 3 luchas"
  echo "- compartir"
  echo "- colecte 200 lamparas"
  read -p "presione una tecla para continuar..."
  adb shell am force-stop com.whatsapp

  RUTA="/sdcard/LOM/${USUARIOS[$1]}_$(date +'%Y%m%d_%H%M%S')"
  adb shell screencap -p "${RUTA}.png"
  adb shell screenrecord --time-limit=5 "${RUTA}.mp4"

  CLAN
  # LUCHA
  TORRE

  MENU_PRINCIPAL
  # COMPARTIR
  # TIENDA
  # MISIONES
  CHAT "full"

  MISIONES_EVENTO_2 1000 560
  # OFICIANTE
}

if [[ $1 = "miner" ]]; then
  MINERO
# elif [[ $1 = "inter" ]]; then
#   INTERMUNDIAL
# elif [[ $1 = "chat" ]]; then
#   CHAT
# elif [[ $1 = "cards" ]]; then
#   CARTAS
else
  RECIBIR $1
fi