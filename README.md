# wholesome.sh
wholesomecomics.com-to-Signal-message-BOT

This is a simple BASH script that fetches the latest comic on [wholesomecomics.com](https://www.wholesomecomics.com/) and attaches it to a Signal message, using [signal-cli](https://github.com/AsamK/signal-cli).
The script is pretty straight forward, just setup signal-cli beforehand and then edit the script with the sender/receiver information. The script keeps track of the latest sent image by saving the name of the image to `~/.config/wholesome_last`.
