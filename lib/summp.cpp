#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "summp.h"

const int REPEAT = 100;
const int NUM_CORE = 24;

// #define COUNT_CORE  // if define, will print thread mapping bitmap
// #define BIND_CORE   // if define, will bind thread to core

int sum(std::vector<int> &v) {
    int num_items = v.size();
    int num_threads = 24;
    int batch_size = num_items / num_threads;

    int th_id;
    int partial_sum = 0;
    int sum = 0;

    #ifdef COUNT_CORE
    std::vector<int> core_count(NUM_CORE, 0);  // assume 48 core
    #endif

    auto t1 = std::chrono::high_resolution_clock::now();
    #pragma omp parallel private(th_id) firstprivate(partial_sum) num_threads(24)
    {   
        // printf("summp: cpu_id: %d\n", sched_getcpu());
        th_id = omp_get_thread_num();

        #ifdef BIND_CORE
        // bind thread to core manually
        cpu_set_t my_set; 
        CPU_ZERO(&my_set);
        CPU_SET(th_id, &my_set);
        // CPU_SET(th_id / 2 + num_threads / 2, &my_set); 
        sched_setaffinity(0, sizeof(cpu_set_t), &my_set);
        #endif

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
    std::cout << "summp: finish in " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << "ms" << std::endl;
    std::cout << "summp: result: " << sum << std::endl;
    #ifdef COUNT_CORE
    std::cout << "core map:" << std::endl;
    for (int i : core_count) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    #endif

    return 0;
}