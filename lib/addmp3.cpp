#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "addmp3.h"

const int REPEAT = 10;
const int NUM_CORE = 24;

// #define COUNT_CORE  // if define, will print thread mapping bitmap
// #define BIND_CORE   // if define, will bind thread to core

std::vector<int> add3(std::vector<int> &first, std::vector<int> &second) {
    auto t1 = std::chrono::high_resolution_clock::now();
    int num_items = first.size();
    int num_threads = omp_get_max_threads();
    int batch_size = num_items / num_threads;

    int th_id;
    std::vector<int> result(num_items);

    #ifdef COUNT_CORE
    std::vector<int> core_count(NUM_CORE, 0);
    #endif

    #pragma omp parallel private(th_id)
    {   
        th_id = omp_get_thread_num();

        #ifdef BIND_CORE
        // bind thread to core manually
        cpu_set_t my_set;
        CPU_ZERO(&my_set);
        // CPU_SET(th_id, &my_set);
        CPU_SET(th_id + 12, &my_set);
        sched_setaffinity(0, sizeof(cpu_set_t), &my_set);
        #endif

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
    std::cout << "addmp3: " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << std::endl;

    #ifdef COUNT_CORE
    std::cout << "core map:" << std::endl;
    for (int i : core_count) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    #endif
    return result;
}