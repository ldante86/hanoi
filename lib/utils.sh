#!/bin/echo This file is a part of hanoi

_clean_exit()
{
    clear
    stty sane
    exit 0
}

_check_screen()
{
    local height=$(tput lines) width=$(tput cols)
    local y=24 x=67
    
    if [ $height -lt $y ] || [ $width -lt $x ]; then
      printf "\n%s" "Current terminal size: ${width}x${height}"
      printf "\n%s\n\n" "It must be ${x}x${y} or larger."
      exit 1
    fi
}

_help()
{
    _show_help

    if [ "X$HELP" = "X" ]; then
      echo "  ${BOLD}Hit any key to return to menu${UNBOLD}"
      read -sn1
      return
    else
      read -sn1
      _clean_exit
    fi
}

_win()
{
    _load_towers $2
    _show_towers $2

    case $1 in
      $MOVE)
        printf "\n\t${BOLD}${BO}  YOU WIN  ${LD}${UNBOLD}\n\n"
        read -sn1
        _menu
        ;;
      *)
        printf "\n\t${BOLD}${BO}  TRY AGAIN WITH LESS MOVES  ${LD}${UNBOLD}\n\n"
        read -sn1
        _menu
        ;;
    esac
}
