static int __init my_init(void)
{
	ramdisk = kmalloc(ramdisk_size, GFP_KERNEL);
	if (misc_register(&my_misc_device)) {
		printk(KERN_WARNING "Couldn't register device misc, "
		       "%d.\n", my_misc_device.minor);
		return -EBUSY;
	}

	printk(KERN_INFO "\nSucceeded in registering character device %s\n",
	       MYDEV_NAME);
	return 0;
}

module_init(my_init);
