#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>
#include "addmp.h"

std::vector<int> add(std::vector<int> &first, std::vector<int> &second) {
    auto t1 = std::chrono::high_resolution_clock::now();
    int num_items = first.size();
    int num_threads = omp_get_max_threads();
    int batch_size = num_items / num_threads;

    int th_id;
    std::vector<int> result(num_items);
    #pragma omp parallel private(th_id)
    {   
        th_id = omp_get_thread_num();

        for (int i = 0; i < batch_size; i++) {
            result[th_id * batch_size + i] = first[th_id * batch_size + i] + second[th_id * batch_size + i];
        }
    }
    
    auto t2 = std::chrono::high_resolution_clock::now();
    std::cout << "addmp: " << std::chrono::duration_cast<std::chrono::nanoseconds>(t2 - t1).count() << std::endl;
    return result;
}