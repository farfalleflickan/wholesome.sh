#! /bin/bash
image=$(curl -s https://www.wholesomecomics.com/ | grep -A15 '<div class="content"' | grep -Po "(?<=src=\")(\/inc\/\d.+?(?=\"))");
imageExtension="${image##*.}";
urlImage="https://www.wholesomecomics.com"${image};
lastSentFile=~/.config/wholesome_sent;
imageName=$(basename ${image});

signalUser=""
signalReceiver=""

function sendMessage() {
    echo ${imageName} > ${lastSentFile};
    wget --quiet --output-document temp.${imageExtension} ${urlImage};
    signal-cli -u ${signalUser} send -a temp.${imageExtension} -m "Wholesome_BOT" ${signalReceiver} ;
    rm temp.${imageExtension};
}

if [[ ! -f ${lastSentFile} ]]; then
    echo ${imageName} > ${lastSentFile};
    sendMessage
else
    if grep -q ${imageName} ${lastSentFile}; then
        exit; #no new image
    else
        sendMessage
    fi
fi
