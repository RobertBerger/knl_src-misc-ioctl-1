#define MYDEV_NAME "mycdrv"

static const struct file_operations mycdrv_fops = {
        .owner = THIS_MODULE,
        .read = mycdrv_read,
        .write = mycdrv_write,
        .open = mycdrv_open,
        .release = mycdrv_release,
        .llseek = mycdrv_lseek
};

static struct miscdevice my_misc_device = {
	.minor = MISC_DYNAMIC_MINOR, /* a minor number is assigned */
	.name = MYDEV_NAME,
	.fops = &mycdrv_fops,
};
