#!/bin/bash
#
##############################################
# Test Local Script to generated OpenSSL encrypted
#  User and Password for Shell Scripts
##############################################

# Function

function GenerateEncryptedString() {
    # Usage ~$ GenerateEncryptedString "String"
    local STRING="${1}"
    local SALT=$(openssl rand -hex 8)
    local K=$(openssl rand -hex 12)
    local ENCRYPTED=$(echo "${STRING}" | openssl enc -aes256 -a -A -S "${SALT}" -k "${K}")
    echo "Encrypted String: ${ENCRYPTED}"
    echo "Salt: ${SALT} | Passphrase: ${K}"
}

# Input of String to encryot
encryptuser="$(osascript -e 'Tell application "System Events" to display dialog "Enter User Value to encrypt: " default answer ""' -e 'text returned of result' 2>/dev/null)"

if [[ $encryptuser != "" ]]; then
encryptpass="$(osascript -e 'Tell application "System Events" to display dialog "Optional:Enter Password Value to encrypt: " with hidden answer default answer ""' -e 'text returned of result' 2>/dev/null)"
fi
# Input for API User Password
openssluser=$( GenerateEncryptedString "$encryptuser" )
if [[ $encryptpass != "" ]]; then
	opensslpass=$( GenerateEncryptedString "$encryptpass" )
fi


# Display the generated openssl info
if [[ $opensslpass != "" ]]; then
osascript <<EOF
Tell application "System Events" to display dialog "User: 
-------------------
$openssluser

Password:
-------------------
$opensslpass"
EOF
else
osascript <<EOF
Tell application "System Events" to display dialog "User:
-------------------
$openssluser"
EOF
fi

