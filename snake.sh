#!/bin/bash
# recreate the snake game in bash

ROWS=20
COLS=50
CHAR_SNAKE="#"
CHAR_FOOD="*"
CHAR_BG="."
UP=(0, -1)
DOWN=(0, 1)
LEFT=(-1, 0)
RIGHT=(1, 0)

# draw() {
#     clear
#     for i in $(seq 1 $BOARD_SIZE); do # columns
#         for j in $(seq 1 $BOARD_SIZE); do # rows
#             if [[ $j -eq $snake_x && $i -eq $snake_y ]]; then
#                 echo -ne "$SNAKE_CHAR"
#             elif [[ $j -eq $food_x && $i -eq $food_y ]]; then
#                 echo -ne "$FOOD_CHAR"
#             else
#                 echo -ne "$BG_CHAR"
#             fi
#         done
#         echo -ne "\n"
#     done
# }



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
