#!/bin/echo This file is a part of hanoi

_game_loop()
{
    while true
    do
      _load_towers $1
      _show_towers $1
      _process_move $1
      _validate_towers $1
    done
}

_menu()
{
    while _show_menu
    do
      MOVE=0
      UNDO=0
      printf "\tSelect: " ; read
      case $REPLY in
       [3-8])  _load_data $REPLY
               _load_index $REPLY
               _game_loop $REPLY ;;
       [Ss] )  _solver_main ;;
       [Hh] )  _help ;;
       [Ee] )  _clean_exit ;;
       *    )  continue ;;
      esac
    done
}

_load_index()
{
    case $1 in
      3)  d1=[0-9] d2=         d3=         ;;
      4)  d1=[1-9] d2=[1][0-2] d3=         ;;
      5)  d1=[1-9] d2=[1][0-5] d3=         ;;
      6)  d1=[1-9] d2=[1][0-8] d3=         ;;
      7)  d1=[1-9] d2=[1][0-9] d3=[2][0-1] ;;
      8)  d1=[1-9] d2=[1][0-9] d3=[2][0-4] ;;
    esac
}

_process_move()
{
    printf "\tMove: " ; read from to

    case $from in
      [Ee]|[Qq])  _clean_exit ;;
      [Mm]     )  _menu ;;
      [Uu]     )  if [ $UNDO -eq 0 ]; then
                    _game_loop $1
                  else
                     _undo_move
                  fi ;;
      $d1|$d2|$d3)  true ;;
      *          )  _game_loop $1 ;;
    esac

    case $to in
      $d1|$d2|$d3)  true ;;
      *          )  _game_loop $1 ;;
    esac

    coord1=${names[from-1]}
    coord2=${names[to-1]}

    if [ $(eval echo \$${coord1}) = $(eval echo \$${coord2}) ]; then
      UNDO=0
      _game_loop $1
    fi

    undo_coord=${coord2}

    if [ $(eval echo \$${coord2}) = 0 ]; then
      eval ${coord2}=$(eval echo \$${coord1})
      eval ${coord1}=0
      UNDO=1
    else
      ((--MOVE))
    fi
}

_undo_move()
{
    eval ${coord1}=$(eval echo \$${undo_coord})
    eval ${coord2}=0
    ((--MOVE))
    UNDO=0
}

_load_data()
{
    case $1 in
      3)
        names=( {a..i} )
        a=1 b=2 c=3 d=0 e=0 f=0 g=0 h=0 i=0
           top="___++___"
          mid1="__++++__"
        bottom="++++++++"
         blank="________"
        ;;
      4)
        names=( {a..l} )
        a=1 b=2 c=3 d=4 e=0 f=0 g=0 h=0 i=0 j=0 k=0 l=0
           top="___++___"
          mid1="__++++__"
          mid2="_++++++_"
        bottom="++++++++" 
         blank="________"
        ;;
      5)
        names=( {a..o} )
        a=1 b=2 c=3 d=4 e=5 f=0 g=0 h=0
        i=0 j=0 k=0 l=0 m=0 n=0 o=0
           top="____++____"
          mid1="___++++___"
          mid2="__++++++__"
          mid3="_++++++++_"
        bottom="++++++++++"
         blank="__________"
        ;;
      6)
        names=( {a..r} )
        a=1 b=2 c=3 d=4 e=5 f=6 g=0 h=0 i=0
        j=0 k=0 l=0 m=0 n=0 o=0 p=0 q=0 r=0
           top="_____++_____"
          mid1="____++++____"
          mid2="___++++++___"
          mid3="__++++++++__"
          mid4="_++++++++++_"
        bottom="++++++++++++"
         blank="____________"
        ;;
      7)
        names=( {a..u} )
        a=1 b=2 c=3 d=4 e=5 f=6 g=7 h=0 i=0 j=0 k=0
        l=0 m=0 n=0 o=0 p=0 q=0 r=0 s=0 t=0 u=0
           top="______++______"
          mid1="_____++++_____"
          mid2="____++++++____"
          mid3="___++++++++___"
          mid4="__++++++++++__"
          mid5="_++++++++++++_"
        bottom="++++++++++++++"
         blank="______________"
        ;;
      8)
        names=( {a..x} )
        a=1 b=2 c=3 d=4 e=5 f=6 g=7 h=8 i=0 j=0 k=0 l=0
        m=0 n=0 o=0 p=0 q=0 r=0 s=0 t=0 u=0 v=0 w=0 x=0
           top="_______++_______"
          mid1="______++++______"
          mid2="_____++++++_____"
          mid3="____++++++++____"
          mid4="___++++++++++___"
          mid5="__++++++++++++__"
          mid6="_++++++++++++++_"
        bottom="++++++++++++++++"
         blank="________________"
         ;;
    esac
}

_validate_towers()
{
    case $1 in
      3)
          [ $a -gt $b -o $b -gt $c ] && _undo_move
          [ $d -gt $e -o $e -gt $f ] && _undo_move
          [ $g -gt $h -o $h -gt $i ] && _undo_move
         ((++MOVE))

          [ $g$h$i = 123 ] && _win $WIN3 $1
          ;;
      4)
          [ $a -gt $b -o $b -gt $c -o $c -gt $d ] && _undo_move
          [ $e -gt $f -o $f -gt $g -o $g -gt $h ] && _undo_move
          [ $i -gt $j -o $j -gt $k -o $k -gt $l ] && _undo_move
          ((++MOVE))

          [ $i$j$k$l = 1234 ] && _win $WIN4 $1
          ;;
      5)
          [ $a -gt $b -o $b -gt $c -o $c -gt $d -o $d -gt $e ] && _undo_move
          [ $f -gt $g -o $g -gt $h -o $h -gt $i -o $i -gt $j ] && _undo_move
          [ $k -gt $l -o $l -gt $m -o $m -gt $n -o $n -gt $o ] && _undo_move
          ((++MOVE))

          [ $k$l$m$n$o = 12345 ] && _win $WIN5 $1
          ;;
      6)
          [ $a -gt $b -o $b -gt $c -o $c -gt $d -o $d -gt $e -o $e \
          -gt $f ] && _undo_move

          [ $g -gt $h -o $h -gt $i -o $i -gt $j -o $j -gt $k -o $k \
          -gt $l ] && _undo_move

          [ $m -gt $n -o $n -gt $o -o $o -gt $p -o $p -gt $q -o $q \
          -gt $r ] && _undo_move
          ((++MOVE))

          [ $m$n$o$p$q$r = 123456 ] && _win $WIN6 $1
          ;;
      7)
          [ $a -gt $b -o $b -gt $c -o $c -gt $d -o $d -gt $e -o $e \
          -gt $f -o $f -gt $g ] && _undo_move

          [ $h -gt $i -o $i -gt $j -o $j -gt $k -o $k -gt $l -o $l \
          -gt $m -o $m -gt $n ] && _undo_move

          [ $o -gt $p -o $p -gt $q -o $q -gt $r -o $r -gt $s -o $s \
          -gt $t -o $t -gt $u ] && _undo_move
          ((++MOVE))

          [ $o$p$q$r$s$t$u = 1234567 ] && _win $WIN7 $1
          ;;
      8)
          [ $a -gt $b -o $b -gt $c -o $c -gt $d -o $d -gt $e \
          -o $e -gt $f -o $f -gt $g -o $g -gt $h ] && _undo_move

          [ $i -gt $j -o $j -gt $k -o $k -gt $l -o $l -gt $m \
          -o $m -gt $n -o $n -gt $o -o $o -gt $p ] && _undo_move

          [ $q -gt $r -o $r -gt $s -o $s -gt $t -o $t -gt $u \
          -o $u -gt $v -o $v -gt $w -o $w -gt $x ] && _undo_move
          ((++MOVE))

          [ $q$r$s$t$u$v$w$x = 12345678 ] && _win $WIN8 $1
          ;;
    esac
}

_load_towers()
{
    case $1 in
      3)  for disk in {a..i}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done ;;
      4)  for disk in {a..l}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${mid2} ;;
              4)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done ;;
      5)  for disk in {a..o}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${mid2} ;;
              4)  eval ${disk}l=${mid3} ;;
              5)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done ;;
      6)  for disk in {a..r}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${mid2} ;;
              4)  eval ${disk}l=${mid3} ;;
              5)  eval ${disk}l=${mid4} ;;
              6)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done ;;
      7)  for disk in {a..u}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${mid2} ;;
              4)  eval ${disk}l=${mid3} ;;
              5)  eval ${disk}l=${mid4} ;;
              6)  eval ${disk}l=${mid5} ;;
              7)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done ;;
      8)  for disk in {a..x}; do
            case $(eval echo \$$disk) in
              0)  eval ${disk}l=${blank} ;;
              1)  eval ${disk}l=${top} ;;
              2)  eval ${disk}l=${mid1} ;;
              3)  eval ${disk}l=${mid2} ;;
              4)  eval ${disk}l=${mid3} ;;
              5)  eval ${disk}l=${mid4} ;;
              6)  eval ${disk}l=${mid5} ;;
              7)  eval ${disk}l=${mid6} ;;
              8)  eval ${disk}l=${bottom} ;;
            esac
            shift
          done	
    esac
}
