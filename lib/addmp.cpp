#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "addmp.h"

const int REPEAT = 10;

#define COUNT_CORE

std::vector<int> add(std::vector<int> &first, std::vector<int> &second) {
    auto t1 = std::chrono::high_resolution_clock::now();
    int num_items = first.size();
    int num_threads = omp_get_max_threads();
    int batch_size = num_items / num_threads;

    int th_id;
    std::vector<int> result(num_items);

    #ifdef COUNT_CORE
    std::vector<int> core_count(48, 0);  // assume 48 core
    #endif

    #pragma omp parallel private(th_id)
    {   
        th_id = omp_get_thread_num();

        #ifdef COUNT_CORE
        core_count[sched_getcpu()] += 1;
        #endif

        for (int i = 0; i < batch_size; i++) {
            result[th_id * batch_size + i] = first[th_id * batch_size + i] + second[th_id * batch_size + i];
        }

        for (int j = 1; j < REPEAT; j++) {
            for (int i = 0; i < batch_size; i++) {
                result[th_id * batch_size + i] = first[th_id * batch_size + i] + second[th_id * batch_size + i];
            }
        }
    }
    
    auto t2 = std::chrono::high_resolution_clock::now();
    std::cout << "addmp: " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << std::endl;

    #ifdef COUNT_CORE
    std::cout << "core map:" << std::endl;
    for (int i : core_count) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    #endif
    return result;
}