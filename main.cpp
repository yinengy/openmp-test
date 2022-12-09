#include <iostream>
#include <vector>
#include <thread>
#include <cstdlib>
#include "summp.h"  // OpenMP lib 1
#include "addmp.h"  // OpenMP lib 2
#include "addmp2.h" 
#include "addmp3.h"
#include "addmp4.h"

pthread_barrier_t barrier;

void launch0(std::vector<int> first) {
    pthread_barrier_wait(&barrier);
    sum(first);
}

void launch1(std::vector<int> first, std::vector<int> second) {
    pthread_barrier_wait(&barrier);
    add(first, second);
}

int main(int argc, char *argv[]) {
    int HAS_T0 = atoi(argv[1]);
    int HAS_T1 = atoi(argv[2]);

    int size = 12000000;
    std::vector<int> v0(size, 1);
    std::vector<int> v1(size, 1);
    std::vector<int> v2(size, 1);

    std::vector<std::thread> t(2);

    pthread_barrier_init(&barrier, NULL, 2);

    if (HAS_T0) {
        t[0] = std::thread(launch0, v0);
    }

    if (HAS_T1)
        t[1] = std::thread(launch1, v1, v2);

    if (HAS_T0) {
        t[0].join();
    }
    if (HAS_T1)
        t[1].join();

    std::cout << "t1 and t2 completed.\n";

    return 0;
}