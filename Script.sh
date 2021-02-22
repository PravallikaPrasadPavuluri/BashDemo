# Bash Script Code

#!/bin/sh

path="/temp/nofail.bak"

if [ -f "$path" ];

then

        echo " File exists "

else

        count=$(grep -o "/dev/mapper" test)

        if [ $count>0 ]

        then

                c1="$(grep -n "nofail" test | cut -d: -f1 )"

                c2="$(grep -n "/dev/mapper" test | cut -d: -f1 )"

                echo $c2

                echo $c1

                if [ $c1 -eq $c2 ]

                then

                        echo " Nofaildevmapper "

                        #curl -I https://www.dev.azure.com

                        c3=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "https://www.google.com")

                        #c3=%{http_code}

                        echo $c3

                        if [ $c3 -eq  200 ]

                        then

                                echo "Connection "

                                if [ systemctl is-active --quiet hab-sup-default.service ]

                                then

                                        echo " Habitat "

                                elif [ systemctl is-active --quiet hab-sup.service ]

                                then

                                        echo " Habitat "

                                elif [ systemctl is-active --quiet habitat.service ]

                                then

                                        echo " Habitat "

                                else

                                        echo " Noo Habitat service "

                                fi

                        else

                                echo " NoConnection "

                        fi

                else

                        echo " Nofail doesnot exist "

                        sed -i -e '/mapper/s/$/,nofail/' test

                fi

        else

                echo "Noo files "

        fi

fi
