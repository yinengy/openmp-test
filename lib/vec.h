#ifndef VEC_H
#define VEC_H
#include <thread>

void enable(pthread_t thread);

void register_thread(pthread_t thread, int id);

#endif