#include <linux/module.h>   /* for modules              */
#include <linux/fs.h>       /* file_operations          */
#include <linux/uaccess.h>  /* copy_(to,from)_user      */
#include <linux/init.h>     /* module_init, module_exit */
#include <linux/slab.h>     /* kmalloc                  */
#include <linux/miscdevice.h>
