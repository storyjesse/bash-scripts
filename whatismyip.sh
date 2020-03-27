#!/bin/bash

# PASS COMMAND LINE ARGUMENTS

usage="
whatismyip.sh	Uses CURL to pull info from ipinfo.io

	I wanted a quick way to check my ip address from the commandline.

OPTIONS:
  -b			Brief mode. Just output the data not the fieldnames
  -q 			Quick mode. Only display ip address
  -d <field>	Display data only for <field>. Overrides -q
"

# Get Options
while getopts bd:q option
do
        case "${option}"
        in
                b) brief=1;;
				d) display="${OPTARG}";;
				q) quick=1;;
                *) echo "${usage}"; exit 1;;
        esac
done
shift $((OPTIND -1))	# Remove Options from $@

# Set Defaults
#[[ $l == "" ]] && l=30
#[[ $baseSet == "" ]] && baseSet="[:graph:]"	# A baseSet is needed so that it can be restricted (ie characters removed) rather than needing to be rebuilt from scratch.
#chrSet="$baseSet$chrSet"

#myfifo=./$0$(date +%s)
#mkfifo $myfifo

# Build Pipe 2
if [ ${display} ];
then
	pipe2='$1 ~ search { print }'
elif [ ${quick} ];
then
	pipe2='$1 ~ search { print }'
	display="ip"
	brief=1
else
	pipe2='{ print }'
fi

# Build Pipe 4
if [ ${brief} ];
then
	pipe4='{ print $2 }'
else
	pipe4='{ print }'
fi

curl -s ipinfo.io/$1 | awk -v search="${display}" "${pipe2}" | sed 's/[\",{}]//g' | awk "${pipe4}"

