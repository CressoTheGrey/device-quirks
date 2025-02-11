#/bin/bash

PRODUCT_NAME="$(cat /sys/devices/virtual/dmi/id/product_name)"
BOARD_NAME="$(cat /sys/devices/virtual/dmi/id/board_name)"
CPU_NAME="$(cat /proc/cpuinfo | awk 'NR==5 {print $4$5$6$7}')"

if [[ "ROG Ally RC71L_RC71L" == "$PRODUCT_NAME" ]] && [[ "RC71L" == "$BOARD_NAME" ]] && [[ "AMDRyzenZ1Extreme" == "$CPU_NAME" ]]; then
    echo "ROG Ally detected"
    $DQ_PATH/scripts/asus/ally/ally.sh
    
else
    echo "${PRODUCT_NAME} does not have a quirk configuration script. Exiting."
fi
