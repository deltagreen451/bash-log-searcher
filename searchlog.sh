#!/bin/bash

wwm () {
    #whole word match function
    match="$(grep ^$patt$ access_log.txt -c)" #counts the number of matches

    if [ $match -eq 0 ]; then #checks and exits if no matches are found
        echo "No matches found."
        echo " " 
    else
        echo "$match matches found:" #displays the number of matches
        grep ^$patt$ access_log.txt -n #displays the matching lines
        echo " "
    fi
}

awm () {
    #any word match function
    match="$(grep $patt* access_log.txt -c)" #counts the number of matches

    if [ $match -eq 0 ]; then #checks and exits if no matches are found
        echo "No matches found." 
        echo " "
    else
        echo "$match matches found:" #displays the number of matches
        grep $patt* access_log.txt -n #displays the matching lines
        echo " "
    fi
}

iwwm () {
    #whole word match function
    match="$(grep ^$patt$ access_log.txt -v -c)" #counts the number of matches

    if [ $match -eq 0 ]; then #checks and exits if no matches are found
        echo "No matches found."
        echo " " 
    else
        echo "$match matches found:" #displays the number of matches
        grep ^$patt$ access_log.txt -v -n #displays the matching lines
        echo " "
    fi
}

iawm () {
    #inverse any word match function
    match="$(grep $patt* access_log.txt -c)" #counts the number of matches

    if [ $match -eq 0 ]; then #checks and exits if no matches are found
        echo "No matches found." 
        echo " "
    else
        echo "$match matches found:" #displays the number of matches
        grep $patt* access_log.txt -v -n #displays the matching lines
        echo " "
    fi
}

read -p 'Please enter the pattern to be searched for: ' patt #asks word search pattern to be stored in variable $patt
echo " "

while : 
do #loop for $choice
    
    echo "Please enter search method for $patt:" 
    echo "1) Whole word match"
    echo "2) Any word match"
    echo "3) Inverse whole word match"
    echo "4) Inverse any word match"
    echo "q) to quit program."
    echo " "
    read -p "Method (1-4, q): " choice

    case "$choice" in
    1) echo "Searching for whole word match."
    wwm #calls for whole word match function
    ;;
    2) echo "Searching for any word match."
    awm #calls for any word match function
    ;;
    3) echo "Searching for inverse whole word match."
    iwwm #calls for inverse whole word match function
    ;;
    4) echo "Searching for inverse any word match"
    iawm #calls for inverse any word match function
    ;;
    q) echo "Goodbye." #quits program
    break ;;
    Q) echo "Goodbye." #quits program
    break ;;
    *) echo "Invalid choice, please try again." ;; #catch for invalid choice
    esac

done

exit 0