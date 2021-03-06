static ssize_t
mycdrv_write(struct file *file, const char __user * buf, size_t lbuf,
	     loff_t *ppos)
{
	int nbytes, maxbytes, bytes_to_do;
	maxbytes = ramdisk_size - *ppos;
	bytes_to_do = maxbytes > lbuf ? lbuf : maxbytes;
	if (bytes_to_do == 0)
		printk(KERN_INFO "Reached end of the device on a write");
	nbytes =
	    bytes_to_do - copy_from_user(ramdisk + *ppos, buf, bytes_to_do);
	*ppos += nbytes;
	printk(KERN_INFO "\n Leaving the   WRITE function, nbytes=%d, pos=%d\n",
	       nbytes, (int)*ppos);
	return nbytes;
}
