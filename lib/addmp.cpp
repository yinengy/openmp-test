#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "addmp.h"

const int REPEAT = 40;
const int NUM_CORE = 24;

// #define COUNT_CORE  // if define, will print thread mapping bitmap
// #define BIND_CORE   // if define, will bind thread to core

std::vector<int> add(std::vector<int> &first, std::vector<int> &second) {
    int num_items = first.size();
    int num_threads = 24;
    int batch_size = num_items / num_threads;

    int th_id;
    std::vector<int> result(num_items);

    #ifdef COUNT_CORE
    std::vector<int> core_count(NUM_CORE, 0);
    #endif

    auto t1 = std::chrono::high_resolution_clock::now();
    #pragma omp parallel private(th_id) num_threads(24)
    {   
        // printf("addmp: cpu_id: %d\n", sched_getcpu());
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
    std::cout << "addmp: finish in " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << "ms" << std::endl;

    #ifdef COUNT_CORE
    std::cout << "core map:" << std::endl;
    for (int i : core_count) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    #endif
    return result;
}