#!/bin/echo This file is a part of hanoi

_show_towers()
{
    case $1 in
      3)  clear
cat <<show

  ################################################################
  #                                                              #
		    ${BO}T O W E R S  O F  H A N O I${LD}
  #								 #

  #								 #
		    ${al} ${dl} ${gl}
  #	            ${bl} ${el} ${hl}                   #
		    ${cl} ${fl} ${il}	${BOLD}${MOVE}${UNBOLD}
  #			3        6        9 		         #

  #								 #
		    
  #                                                              #
  ################################################################
						 $1 disks - $WIN3 moves
show
        ;;
      4)  clear
cat <<show

  ################################################################
  #                                                              # 
		    ${BO}T O W E R S  O F  H A N O I${LD}
  #      					                 #
  
  #                                                              #

  #		    ${al} ${el} ${il}                   #
  	            ${bl} ${fl} ${jl}                  
  #		    ${cl} ${gl} ${kl}                   #
                    ${dl} ${hl} ${ll} ${BOLD}${MOVE}${UNBOLD}
  #	                4        8       12                      #
  
  #                                                              #
  ################################################################
 						$1 disks - $WIN4 moves
show
        ;;
      5)  clear
cat <<show

  ################################################################
  #	                                                         # 
		    ${BO}T O W E R S  O F  H A N O I${LD}
  #	      					                 #
	
  #	                                                         #
		  ${al} ${fl} ${kl}
  #		  ${bl} ${gl} ${ll}               #
		  ${cl} ${hl} ${ml}
  #		  ${dl} ${il} ${nl}	         #
	          ${el} ${jl} ${ol}  ${BOLD}${MOVE}${UNBOLD}
  #                    5         10         15                   #
        	            
  #	                                                         #
  ################################################################    
	 				        $1 disks - $WIN5 moves
show
        ;;
      6)  clear
cat <<show

  ################################################################
  #	                                                         # 
		    ${BO}T O W E R S  O F  H A N O I${LD}
  #	      					                 #
	
  #	                                                         #
	      ${al} ${gl} ${ml}
  #	      ${bl} ${hl} ${nl}             #
	      ${cl} ${il} ${ol}
  #	      ${dl} ${jl} ${pl}	         #
	      ${el} ${kl} ${ql}  
  #           ${fl} ${ll} ${rl}             #
                    6           12           18      ${BOLD}${MOVE}${UNBOLD}
  #	                                                         #
  ################################################################    
	 				        $1 disks - $WIN6 moves
show
          ;;
      7)  clear
cat <<show

  ################################################################
  #	                                                         #
		    ${BO}T O W E R S  O F  H A N O I${LD}
  #	      			                                 #

  #	     ${al} ${hl} ${ol}        #
  	     ${bl} ${il} ${pl}
  #	     ${cl} ${jl} ${ql}        #
  	     ${dl} ${kl} ${rl}
  #	     ${el} ${ll} ${sl}        #
             ${fl} ${ml} ${tl}
  #          ${gl} ${nl} ${ul}        #
                    7             14             21       ${BOLD}${MOVE}${UNBOLD}
  #	                                                         #
  ################################################################    
	 				       $1 disks - $WIN7 moves
show
          ;;
      8)  clear
cat <<show

  ################################################################
  #                                                              #
  	            ${BO}T O W E R S  O F  H A N O I${LD}
  #	      			                                 #
         ${al} ${il} ${ql}      
  #      ${bl} ${jl} ${rl}      #
         ${cl} ${kl} ${sl}      
  #	 ${dl} ${ll} ${tl}      #
         ${el} ${ml} ${ul}
  #      ${fl} ${nl} ${vl}      #
         ${gl} ${ol} ${wl}      
  #      ${hl} ${pl} ${xl}      #
                8                16               24  	    ${BOLD}${MOVE}${UNBOLD}
  #	                                                         # 
  ################################################################
					       $1 disks - $WIN8 moves
show
    esac
}

_show_menu()
{
    clear
cat <<menu

  ################################################################
  # 						                 #
                    ${BO}T O W E R S  O F  H A N O I${LD}
  #						                 #
  		        ${BOLD}GAME SELECTION MENU${UNBOLD}
  #						                 #
                      3)  3 disks (7 moves)               
  #                   4)  4 disks (15 moves)                     #
                      5)  5 disks (31 moves)                     
  #                   6)  6 disks (63 moves)                     #
                      7)  7 disks (127 moves)
  #		      8)  8 disks (255 moves)		         #
                s)  solver    h)  help    e)  exit
  #                                                              # 
  ################################################################ 

menu
}

_show_help()
{
    clear
cat <<eof

  ################################################################
  #     ${BOLD}$PROGRAM - The Towers of Hanoi Game${UNBOLD}                         #
  
  #     The object of Towers of Hanoi is to reassemble the       #
        left tower over to the right. The player enters two
  #     numbers. The first number is the disk you wish to move;  #
        the second number is the destination of that disk. The
  #     numbers vary between the games. A 3 disk game is         #
        referenced as:                      Prompt commands:
  #         ____1____ ____4____ ___7_____    e   quit            #
            ____2____ ____5____ ___8_____    m   go to menu
  #         ____3____ ____6____ ___9_____    u   undo last move  #
                                              
  #     A 4 disk game is numbered 1..12, etc.                    #
  ################################################################

  Version: $PROG_VERSION
  $DETAILS
  $LEGAL  

eof
}
