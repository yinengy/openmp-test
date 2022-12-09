#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <pthread.h>
#include <stdio.h>
#include <dlfcn.h>
#include <unordered_set>
#include <unordered_map>

std::unordered_map<pthread_t, std::unordered_set<int>> registered_threads;

typedef int (*pthread_getaffinity_np_t)(pthread_t, size_t, cpu_set_t *);

static pthread_getaffinity_np_t orig_pthread_getaffinity_np = NULL;

int pthread_getaffinity_np(pthread_t thread, size_t cpusetsize, cpu_set_t *cpuset) {
    if(orig_pthread_getaffinity_np == NULL) {
        orig_pthread_getaffinity_np = (pthread_getaffinity_np_t) dlsym(RTLD_NEXT, "pthread_getaffinity_np");
        if (orig_pthread_getaffinity_np == NULL) {
            fprintf(stderr, "Error in `dlsym`: %s\n", dlerror());
        }
    }

    printf("pthread_getaffinity_np: I am hooked! at thread %08lx\n", thread);
    int ret = orig_pthread_getaffinity_np(thread, cpusetsize, cpuset);

    if (registered_threads.count(thread) > 0) {
        printf("Hijeck thread %08lx\n", thread);
        for (int j = 0; j < 48; j++) {
            std::unordered_set<int> cpu_to_enable = registered_threads[thread];
            // remove unwanted cpu
            if (CPU_ISSET(j, cpuset) > 0 && cpu_to_enable.count(j) == 0) {
                CPU_CLR(j, cpuset);
            }
        }
    } else {
        printf("Bypass thread %08lx\n", thread);
    }

    return ret;
}

void enable(pthread_t thread) {
    if (registered_threads.count(thread) > 0) {
        std::unordered_set<int> cpu_to_enable = registered_threads[thread];
        cpu_set_t cpuset;
        CPU_ZERO(&cpuset);
        for (auto n: cpu_to_enable) {
            CPU_SET(n, &cpuset);
        }


        pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset);
    }
}

void register_thread(pthread_t thread, int id) {
    if (id == 0) {
        std::unordered_set<int> cpu_to_enable;
        for (int i = 0; i < 24; i++) {
            cpu_to_enable.insert(i);
        }
        registered_threads[thread] = cpu_to_enable;
    } else {
        std::unordered_set<int> cpu_to_enable;
        for (int i = 24; i < 48; i++) {
            cpu_to_enable.insert(i);
        }
        registered_threads[thread] = cpu_to_enable;
    }
    
    printf("Register thread %08lx\n", thread);
}
