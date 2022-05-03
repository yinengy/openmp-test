#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "summp.h"

const int REPEAT = 100;

#define COUNT_CORE

int sum(std::vector<int> &v) {
    auto t1 = std::chrono::high_resolution_clock::now();
    int num_items = v.size();
    int num_threads = omp_get_max_threads();
    int batch_size = num_items / num_threads;

    int th_id;
    int partial_sum = 0;
    int sum = 0;

    #ifdef COUNT_CORE
    std::vector<int> core_count(48, 0);  // assume 48 core
    #endif

    #pragma omp parallel private(th_id) firstprivate(partial_sum)
    {   
        th_id = omp_get_thread_num();
        
        #ifdef COUNT_CORE
        core_count[sched_getcpu()] += 1;
        #endif

        for (int j = 0; j < REPEAT; j++) {
            for (int i = 0; i < batch_size; i++) {
                partial_sum += v[th_id * batch_size + i];
            }
        }
        
        #pragma omp critical
        sum += partial_sum;
    }

    auto t2 = std::chrono::high_resolution_clock::now();
    std::cout << "summp: " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << std::endl;

    #ifdef COUNT_CORE
    std::cout << "core map:" << std::endl;
    for (int i : core_count) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    #endif

    return 0;
}