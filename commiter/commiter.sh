#/bin/bash

# commiter.sh 
# It just a little scripting to empower my laziness

if [ -z "$1" ]
then
    echo "This is Commiter 🌊"
    echo "
    How to use : sh commiter.sh image_name new_image_name\n 
    sh commmiter.sh kalilinux/kali-rolling:latest kali_docker

    \nBe Lazy not dummy!!!
    "
    exit 0
fi

find=`docker ps -a | grep -w "$1" | awk '{print $1}'`

if [ -z  "$find" ]
then
    echo "Oopsie, i cannot find your container 😔"
elif [ -z "$2" ] 
then 
    echo "Please enter the 2nd parameter"
else 
    if [ `docker commit "$find" "$2"` ] 
    then 
        echo 'Succes to commit! 🎉\n'
        echo `docker image ls | grep -w "$2" | awk '{print "Container commited as -> " $1 ; printf "\n" ; printf " | Image ID -> " $3 ; printf " | Size : " $7}'`
    else 
        echo `docker commit "$find" "$2"`
    fi
fi

