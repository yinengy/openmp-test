#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <iostream>
#include <dlfcn.h>
#include <thread>
#include <vector>

void launch0() {
    void *handle = dlmopen(LM_ID_NEWLM, "./preload_affinity.so", RTLD_LAZY);
}

int main() {
    // int s;
    // cpu_set_t cpuset;
    // pthread_t thread;

    // thread = pthread_self();

    // /* Set affinity mask to include CPUs 0 to 7. */

    // CPU_ZERO(&cpuset);
    // for (int j = 0; j < 2; j++)
    //     CPU_SET(j, &cpuset);

    // s = pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset);

    // int sum = 0;

    // std::cout << "BEGIN!!!!!!!!!!!!!!!"<< std::endl;

    // #pragma omp parallel
    // {   
    //     printf("I am cpu: %d\n", sched_getcpu());
    //     sum += omp_get_num_procs();
    // }

    // std::cout << "sum: " << sum << std::endl;
    std::vector<std::thread> t(2);

    t[0] = std::thread(launch0);
    t[1] = std::thread(launch0);
   
    t[0].join();
    t[1].join();

    return 0;
}