# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make_dir.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/05 17:11:34 by tpetros           #+#    #+#              #
#    Updated: 2024/01/05 18:15:16 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
if [ ! -d "/root/data" ]; then
        mkdir /root/data
        mkdir /root/data/mariadb
        mkdir /root/data/wordpress
fi