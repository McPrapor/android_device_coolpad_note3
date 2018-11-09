#include <android/log.h>
#include <string.h>
#include <stdarg.h>

#define ANDROID_ATOMIC_INLINE

#include <cutils/atomic.h>


#ifndef __unused
#define __unused  __attribute__((__unused__))
#endif

#ifndef FAKE_LOG_DEVICE
#include <sys/system_properties.h>
#endif

#if defined(_WIN32)
#define LIBLOG_ABI_PUBLIC
#else
#define LIBLOG_ABI_PUBLIC __attribute__((visibility("default")))
#endif
#define LOG_BUF_SIZE 1024

struct xlog_record {
    const char *tag_str;
    const char *fmt_str;
    int prio;
};

signed int __htclog_read_masks(char *buf __unused, signed int len __unused)
{
    return 0;
}

int __htclog_init_mask(const char *a1 __unused, unsigned int a2 __unused, int a3 __unused)
{
    return 0;
}

int __htclog_print_private(int a1 __unused, const char *a2 __unused, const char *fmt __unused, ...)
{
    return 0;
}

LIBLOG_ABI_PUBLIC void __attribute__((weak)) __xlog_buf_printf(int bufid __unused, const struct xlog_record *xlog_record __unused, ...) {
#ifndef FAKE_LOG_DEVICE
    char prop[32]="0";
    /* check property for diable all xlog */
    __system_property_get("ro.disable.xlog",prop);
    if (!strcmp(prop, "0"))
#endif
    {
	va_list args;
	va_start(args, xlog_record);
	__android_log_vprint(xlog_record->prio, xlog_record->tag_str, xlog_record->fmt_str, args);
    }
}
