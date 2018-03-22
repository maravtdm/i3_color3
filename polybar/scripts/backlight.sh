#! /bin/bash


#! /bin/bash

#echo "$(light | cut -d. -f1)"

light=$(light | cut -d. -f1)
#label="  "
label="  "
echo -n $light
