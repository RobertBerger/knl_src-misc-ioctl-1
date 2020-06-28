DRIVER="misc_char_drv.c"
source ../../env.sh
INDENT="indent -nbad -bap -nbc -bbo -hnl -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -d0 -di1 -nfc1 -i8 -ip0 -l80 -lp -npcs -nprs -npsl -sai -saf -saw -ncs -nsc -sob -nfca -cp33 -ss -ts8 -il1"
#${INDENT} ${DRIVER}
${CUSTOM_KERNELDIR}/scripts/checkpatch.pl --file --terse ${DRIVER}

