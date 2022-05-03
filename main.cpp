#include <iostream>
#include <vector>
#include <thread>
#include <cstdlib>
#include "summp.h"  // OpenMP lib 1
#include "addmp.h"  // OpenMP lib 2


int main(int argc, char *argv[]) {
    int HAS_T0 = atoi(argv[1]);
    int HAS_T1 = atoi(argv[2]);
    int size = 160000000;
    std::vector<int> first(size, 1);
    std::vector<int> second(size, -2);

    std::vector<std::thread> t(2);

    if (HAS_T0)
        t[0] = std::thread(add, std::ref(first), std::ref(second));
    if (HAS_T1)
        t[1] = std::thread(sum, std::ref(first));

    if (HAS_T0)
        t[0].join();
    if (HAS_T1)
        t[1].join();

    std::cout << "t1 and t2 completed.\n";

    return 0;
}