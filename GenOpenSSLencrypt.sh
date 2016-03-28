#!/bin/bash
#
##############################################
# Title: Generate OpenSSL Encrypted Variables
# Date: 2016-03-28
# Author: Brian Bocklett
# Desceiption: Uses function posted by JAMF IT
# to generate encrypted values based on User 
# Input.
#
# Legal Disclaimer for Function posted by JAMF IT:
# ------------------------------------------------
# Copyright (c) 2015, JAMF Software, LLC. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:
#   * Redistributions of source code must retain the above copyright notice, this
#     list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright notice, this
#     list of conditions and the following disclaimer in the documentation and/or
#     other materials provided with the distribution.
#   * Neither the name of the JAMF Software, LLC nor the names of its contributors
#     may be used to endorse or promote products derived from this software without
#     specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE,
# LLC BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
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

# Input of User Value to encrypt
encryptuser="$(osascript -e 'Tell application "System Events" to display dialog "Enter User Value to encrypt: " default answer ""' -e 'text returned of result' 2>/dev/null)"

if [[ $encryptuser != "" ]]; then
# Input for  Password Value to encrypt hides text while typing
encryptpass="$(osascript -e 'Tell application "System Events" to display dialog "Optional:Enter Password Value to encrypt: " with hidden answer default answer ""' -e 'text returned of result' 2>/dev/null)"
fi

#rncryption section
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
## if only User information is encrypted then  only displays that
## mainly for aesthetics... 	
osascript <<EOF
Tell application "System Events" to display dialog "User:
-------------------
$openssluser"
EOF
fi

