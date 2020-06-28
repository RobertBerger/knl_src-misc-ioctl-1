ifeq ($(KERNELRELEASE),)

    KERNELDIR ?= /lib/modules/$(shell uname -r)/build
    PWD := $(shell pwd)

.PHONY: module clean

module:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

user_space: 
	$(CC) user_space.c -o user_space

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions Module.symvers Module.markers modules.order user_space

else
    $(info Building with KERNELRELEASE = ${KERNELRELEASE})

    # called from kernel build system: just declare what our modules are

    obj-m :=    misc_char_drv.o

endif

