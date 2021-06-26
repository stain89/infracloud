#!/bin/bash

#This script gerates 10 random number by default.
#The user can genrate more randome numbers with -n.


usage(){
	echo "Genrate random numbers."
	echo "Usage: ${0} [-n NUMBER]" >&2
	echo '	-n	NUMBER Specify count to genrate random numbers, default count 10'
	echo "	-v	Verbose mode."	
	exit 1
}

log(){
	local MESSAGE="${@}"
	
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi	
}

#Set a default count 
COUNT=10

while getopts vn: OPTION
do 
	case ${OPTION} in
		n)
			COUNT="${OPTARG}"
			log "Current count is: ${COUNT}"
			;;
		v)
			VERBOSE='true'
			log 'Verbose mode on.'
			;;
		?)
			usage
			;;
	esac
done

# Remove the options while leaving the remaining arguments.

shift "$(( OPTIND -1 ))"

if [[ "${#}" -gt 0 ]]
        then
                usage
fi

log "Genrating ${COUNT} random  numbers."

#Creating File
FILE_NAME="inputFile"

if [[ -f "${FILE_NAME}" ]]
then
	echo "" > ${FILE_NAME}
	log "File ${FILE_NAME} already exists, emptying the file"
else 
	touch ${FILE_NAME}
	log "File ${FILE_NAME} creation succeeded"
fi



# Initalize loop counter
i=0
while [[ $i -lt  ${COUNT} ]]
do
	echo "$i, ${RANDOM}" >> ${FILE_NAME}
	(( i++ ))
done
log "File ${FILE_NAME} with ${COUNT} random numbers genrated."

#Changing File permission to 755
chmod 755 ${FILE_NAME}
log "File ${FILE_NAME} permission changed to 755"
