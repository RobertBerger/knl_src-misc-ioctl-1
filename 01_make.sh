source ../../env.sh

KERNELDIR=${CUSTOM_KERNELDIR}

make clean
make
make user_space
