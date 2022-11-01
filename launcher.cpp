#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include "summp.h"  // OpenMP lib 1

typedef int (*MainType)(std::vector<int> &v);

int main(int argc, char *argv[]) {
    printf("launcher begins.\n");
    void* lib = dlopen("lib/libsummp.so", RTLD_NOW);
    if(lib == NULL) {
        printf("dlopen failes!!!!!!\n");
        printf("%s\n", dlerror());
        exit(-1);
    }
    printf("dlopen success.\n");

    MainType lib_main = (MainType) dlsym(lib, "_Z3sumRSt6vectorIiSaIiEE");
    if(lib_main == NULL) {
        printf("dlsym failes!!!!!!\n");
        printf("%s\n", dlerror());
        exit(-1);
    }

    int size = 120000000;
    std::vector<int> first(size, 1);
    lib_main(first);
    printf("launcher ends.\n");
}
