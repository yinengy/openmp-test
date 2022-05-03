#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "summp.h"

int sum(std::vector<int> &v) {
    auto t1 = std::chrono::high_resolution_clock::now();
    int num_items = v.size();
    int num_threads = omp_get_max_threads();
    int batch_size = num_items / num_threads;

    int th_id;
    int partial_sum = 0;
    int sum = 0;
    #pragma omp parallel private(th_id) firstprivate(partial_sum)
    {   
        th_id = omp_get_thread_num();

        for (int i = 0; i < batch_size; i++) {
           
            partial_sum += v[th_id * batch_size + i];
        }
        
        #pragma omp critical
        sum += partial_sum;
    }

    auto t2 = std::chrono::high_resolution_clock::now();
    std::cout << "summp: " << std::chrono::duration_cast<std::chrono::nanoseconds>(t2 - t1).count() << std::endl;
    return 0;
}