The purpose of this script is to search through multiple PDFs for words and sentences.
For example, if you have multiple PDF books in a directory, you can save this script to the same directory containing those books. Then type:
./look_for 4
./look_for 1 "Cyber Kill Chain"

./look_for 4 downloads a pre-requecit script needed by this script in order to search through the PDFs.
./look_for 1 "Cyber Kill Chain" will begin searching through those PDFs for anything that says Cyber Kill Chain.

Anything that is found will be stored in the output directory so you can go over them manually to see what the script was able to find.
You can also type, ./look_for 2 Cyber and then the script will search the output directory for any words that say Cyber. Those words will
be shown to you in red.

You will need the following packages to run this script. Use the following commands to download them:

sudo apt-get install pdfgrep pdftk

If you have any questions, please join and talk to me in the discord: https://discord.gg/XBDHWZHVT4

- Jeremiah O'Neal
