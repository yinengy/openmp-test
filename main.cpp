#include <iostream>
#include <vector>
#include <thread>
#include <cstdlib>
#include "summp.h"  // OpenMP lib 1
#include "addmp.h"  // OpenMP lib 2
#include "addmp2.h" 
#include "addmp3.h"
#include "addmp4.h"


int main(int argc, char *argv[]) {
    int HAS_T0 = atoi(argv[1]);
    int HAS_T1 = atoi(argv[2]);
    int size = 120000000;
    std::vector<int> first(size, 1);
    std::vector<int> second(size, -2);

    std::vector<std::thread> t(4);

    if (HAS_T0) {
        t[0] = std::thread(add, std::ref(first), std::ref(second));
        t[2] = std::thread(add2, std::ref(first), std::ref(second));
        t[3] = std::thread(add3, std::ref(first), std::ref(second));
        t[4] = std::thread(add4, std::ref(first), std::ref(second));
    }

    if (HAS_T1)
        t[1] = std::thread(sum, std::ref(first));

    if (HAS_T0) {
        t[0].join();
        t[2].join();
        t[3].join();
        t[4].join();
    }
    if (HAS_T1)
        t[1].join();

    std::cout << "t1 and t2 completed.\n";

    return 0;
}