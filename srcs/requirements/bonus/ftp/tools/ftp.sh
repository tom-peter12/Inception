# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/25 00:02:08 by tpetros           #+#    #+#              #
#    Updated: 2024/01/25 00:15:41 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser ${FTP_USR} --disabled-password
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd &> /dev/null
    chown -R ${FTP_USR}:${FTP_USR} /var/www/html

	#chmod +x /etc/vsftpd/vsftpd.conf
    echo ${FTP_USR} | tee -a /etc/vsftpd.userlist &> /dev/null

fi

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
