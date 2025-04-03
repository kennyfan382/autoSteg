#This script will take an image file parameter and a text file paramater (if one is not given, one will be created)
#Once the image and the text file have been set, this script will automate the commands for steganography
#The user will be notified at the end whether the process worked or not

AS(){
    chmod +x AutomateSteganography.sh
    clear
    echo "Welcome to Aidan Hammonds automated steganography tool!"
    echo "All possible .jpg files in directory":
    sleep 2
    ls *.jpg
    sleep 2
    while true; do
    echo "Enter your image (remember to add file type on the end E.g MyDog.jpg): "
    read inputImage
    image="$inputImage"
    if [[ -f "$image" ]]; then
        echo "Received"
        sleep 1
        echo "Your image: $image"
        sleep 2
        break
    else
        echo "File does not exist (if this persists, maybe try changing directories)"
        sleep 3
    fi
    done
    clear
    echo "All possible .txt files in directory":
    ls *.txt
    sleep 2
    while true; do
    echo "Enter your text file (has to end in .txt): "
    read inputTXT
    txt="$inputTXT"
    if [[ -f "$txt" ]]; then
        echo "Received"
        sleep 1
        echo "Your text file: $txt"
        sleep 2
        break
    else
        echo "File does not exist (maybe try changing directories)"
        sleep 2
    fi
    done
    clear
    message=$(cat "$txt")
    echo "Message: $message"
    sleep 2
    cat "$txt" >> "$image"
    echo "Process complete!"
    sleep 2
    echo "Wanna see? Y/n"
    read answer
    if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
        echo -e "\n\n\n" #Ensures good seperation between command and the text within the image
        strings "$image" | tail -n 10
        echo -e "\n\n\nIf you want to see it again, type: strings "$image" | tail -n 10"
        sleep 3
        echo -e "\n\nNOTE: you are viewing the last 10 lines of your text file, the whole message has been transferred to the image."
        sleep 3
        echo -e "\nIf it was longer than 10 lines and you want to see the whole text in the image simply append the number in the command to something higher until you reach your desired output"
        sleep 5
        echo -e "\nYou might also want to type 'cat $image' and then scroll to the bottom to find your full message"
        sleep 8
    else
        echo -e "\nIf you want to see in the future, type: strings "$image" | tail -n 10"
        echo -e "\nIf your message is longer than 10 lines, please append the number at the end of the command to be higher or type cat $image then scroll to the bottom"
        sleep 4
        echo "Okay, bye"
    fi
}
