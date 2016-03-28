## Generate Openssl Encrypted variables based on User Input
####What is it?
This is a script designed to make it easier to encrypt sensitive information, like username and password pairs, when needed for Scripts. 

####Why make this?
Security is important and sometimes a user and password pair is needed in a script. Be it for API or for mounting a drive or anything in between. This script makes it easier to generate encrypted values to use so we can remove human readable username and password pairs from our scripts. If you follow the the use information for the functions found here: [Encrypted-Script-Parameters](https://github.com/jamfit/Encrypted-Script-Parameters), we can further obfuscate the values by storing the encrypted strings in casper Policy.
  

####How does it work?
The script utilizes functions shared by [JAMF IT git hub account](https://github.com/jamfit) to encrypt input gathered by System Event Dialog boxes. As of right now up to two  variables can be input for encryption by this script. The first pop up will ask for User information and the second pop up will be optional and ask for password information. The password popup will not display what is typed in the input field as is.

####How to use it:
Well you can run it via command line, but if you want to make it extra easy in a team environment.
Add the script to your JSS. Make a policy that runs the script and make it available in Self Service. Scope it based on LDAP User groups or Department based Computer Groups that would need  access to it and have them login to Self Service torun the script. Easy peasy and if you add a nice icon to the Self Service policy it can be easy to find too. This will also enforce the idea to use Self Service for tech groups too.

####Legal stuff:

Since this utilitzes functions that were created and shared by JAMF IT this legal info has to be included in the script it seems. Anyone that wants to the Awesome power of thier functions and anything else they post should be sure to inlcude this in the scirpt and give credti where it's due.

Links:
[JAMF IT git hub account](https://github.com/jamfit)  
[Encrypted-Script-Parameters Git Repo](https://github.com/jamfit/Encrypted-Script-Parameters)


```
Copyright (c) 2015, JAMF Software, LLC. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this
      list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this
      list of conditions and the following disclaimer in the documentation and/or
      other materials provided with the distribution.
    * Neither the name of the JAMF Software, LLC nor the names of its contributors
      may be used to endorse or promote products derived from this software without
      specific prior written permission.
      
THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE,
LLC BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
