static int mycdrv_release(struct inode *inode, struct file *file)
{
	printk(KERN_INFO " CLOSING device: %s:\n\n", MYDEV_NAME);
	return 0;
}
