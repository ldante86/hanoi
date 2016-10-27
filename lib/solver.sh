#!/bin/echo This file is a part of hanoi

_solver_main()
{
    clear
    c=0
    printf "\n TOWERS OF HANOI SOLVER\n"
    printf  "\n Number of disks: " ; read

    case $REPLY in
      [1-9]|[1-9][0-9])  true ;;
      [Mm])  _menu ;;
      [eE])  _clean_exit ;;
      *   )  _solver_main ;;
    esac

    printf "\n"
    _solve $REPLY A C B

    printf "\n %d%s\n\n" "$c" " Moves"
    read -sn1
    _menu
}

_solve()
{
    if [ $1 -eq 1 ]; then
      ((++c))
      printf "  Move disk $1 from peg $2 to peg $3\n"
      return
    fi

    _solve $(($1-1)) $2 $4 $3
    ((++c))
    printf "  Move disk $1 from peg $2 to peg $3\n"
    _solve $(($1-1)) $4 $3 $2
}
