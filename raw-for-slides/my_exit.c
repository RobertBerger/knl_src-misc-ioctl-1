static void __exit my_exit(void)
{
	misc_deregister(&my_misc_device);
	printk(KERN_INFO "\ndevice unregistered\n");
	kfree(ramdisk);
}

module_exit(my_exit);
