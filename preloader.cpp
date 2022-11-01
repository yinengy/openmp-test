#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

static void init(void) __attribute__((constructor));

static void init(void) {
    printf("preloader begins.\n");
    void* dlh_environ = dlopen("lib/cat.so", RTLD_NOW|RTLD_GLOBAL);
    if(!dlh_environ) {
        printf("dlmopen failes!!!!!!\n");
        printf("%s\n", dlerror());
        exit(-1);
    }
    
    Lmid_t lmid;
    int r = dlinfo(dlh_environ, RTLD_DI_LMID, &lmid);
    printf("Loaded lib/cat.so into %ld (r=%d)\n", lmid, r);

    printf("preloader ends.\n");
}