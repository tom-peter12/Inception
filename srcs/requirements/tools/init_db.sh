# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_db.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:22 by tpetros           #+#    #+#              #
#    Updated: 2024/01/18 15:25:23 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
if [ ! -d "/home/${USER}/data" ]
then
        mkdir -p /home/${USER}/data/db
        mkdir -p /home/${USER}/data/wp
fi