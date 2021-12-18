#!/bin/bash

BOARD_SIZE=10
SNAKE_CHAR='■ '
FOOD_CHAR='X '
BG_CHAR='. '
input=''
snake_x=3
snake_y=3
clear

draw() {
    clear
    for i in $(seq 1 $BOARD_SIZE); do # columns
        for j in $(seq 1 $BOARD_SIZE); do # rows
            if [[ $j -eq $snake_x && $i -eq $snake_y ]]; then
                echo -ne "$SNAKE_CHAR"
            elif [[ $j -eq $food_x && $i -eq $food_y ]]; then
                echo -ne "$FOOD_CHAR"
            else
                echo -ne "$BG_CHAR"
            fi
        done
        echo -ne "\n"
    done
}



while true; do 
    draw
    # read -s -n1 input
    # get input asynchronously
    # if input is not valid, draw the board again
    # if input is valid, move the snake in the direction of the input
    
    read -s -n1 input &
    case $input in
        w)
            snake_y=$((snake_y - 1))
            ;;
        s)
            snake_y=$((snake_y + 1))
            ;;
        a)
            snake_x=$((snake_x - 1))
            ;;
        d)
            snake_x=$((snake_x + 1))
            ;;
        *)
            draw
            continue
            ;;
    esac
    $input=''
done
