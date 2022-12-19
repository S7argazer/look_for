#!/bin/bash

# NAME:         look_for
# VERSION:      0.1
# AUTHOR:       (c) 2022 Jeremiah O'Neal
# DESCRIPTION:  Soon to come.
# FEATURES:     
# DEPENDENCIES: extract_pdf_results.sh
#               ➥install on Ubuntu/Debian with sudo apt-get install extract_pdf_results
#
# LICENSE:      GNU GPLv3 (http://www.gnu.de/documents/gpl-3.0.en.html)
#
# NOTICE:       THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. 
#               EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES 
#               PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR 
#               IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
#               AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND 
#               PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE,
#               YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
#
#               IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY 
#               COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS 
#               PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, 
#               INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE 
#               THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED 
#               INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE 
#               PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER 
#               PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
#
# USAGE:        look_for <mode> <string>
MODES="$1"

if [[ "$MODES" -eq 5 ]];then
   echo "Note: This is a developer command used by ONeal to update this script on Github."
   git status
   git add look_for.sh
   git commit -m "[Updates]"
   git push
fi

if test -f "developer.txt"; then
    cd ..
    mkdir WorkingDirectory
    cd WorkingDirectory
fi

LOOK_FOR="$2"
RANNUM=$(( ((RANDOM<<15)|RANDOM) % 63001 + 2000 ))
echo "Looking for $STRING..."
mkdir output
if [[ "$MODES" -eq 1 ]];then
    echo "#!/bin/bash" > output/run.sh
    echo "cd .." >> output/run.sh
    chmod +x output/run.sh
    for i in *
    do
       echo "./extract_pdf_results.sh ${i} \"${LOOK_FOR}\"" >> output/run.sh 
    done
    cd output
    ./run.sh
elif [[ "$MODES" -eq 2 ]];then
    cd output
    pdfgrep -R "${LOOK_FOR}" *
    cd ..
elif [[ "$MODES" -eq 3 ]];then
   mv output "/tmp/${RANNUM})/"
elif [[ "$MODES" -eq 4 ]];then
   curl -o extract_pdf_results_raw.sh --crlf https://pastebin.com/raw/F1jfvhzw
   sed 's/\r$//' extract_pdf_results_raw.sh > extract_pdf_results.sh
   rm extract_pdf_results_raw.sh
   md5=($(md5sum extract_pdf_results.sh))
   if [[ "$md5" == "f5a4b8f3d2589da1e4b165ddb4518b72" ]];then
       chmod +x extract_pdf_results.sh
       echo "Done."
   else
       rm extract_pdf_results.sh
       echo "Failed to download extract_pdf_results.sh"
   fi
else
   echo ".\look_for 1 \"Cyber Kill Chain\" - Searches for Cyber within the pdfs in the current directory and saves any finds in the Output directory."
   echo ".\look_for 2 \"Cyber Kill Chain\" - Searches for Kill within the Output directory"
   echo ".\look_for 3 - Moves the output to the /tmp directory"
   echo ".\look_for 4 - Downloads extract_pdf_results.sh from pastebin."
   echo ".\look_for 5 - DO NOT USE. For ONEAL to update sourcecode to Github."

fi

