static int mycdrv_open(struct inode *inode, struct file *file)
{
	static int counter; /* initialized to 0 implicitly since it's static */
	printk(KERN_INFO " attempting to open device: %s:\n", MYDEV_NAME);
	printk(KERN_INFO " MAJOR number = %d, MINOR number = %d\n",
	       imajor(inode), iminor(inode));
	counter++;

	printk(KERN_INFO " successfully open  device: %s:\n\n", MYDEV_NAME);
	printk(KERN_INFO "I have been opened  %d times since being loaded\n",
	       counter);
	printk(KERN_INFO "ref=%d\n", module_refcount(THIS_MODULE));

	return 0;
}
