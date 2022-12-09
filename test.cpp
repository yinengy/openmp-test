#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <iostream>
#include <vector>
#include <thread>
#include <chrono>
#include <dlfcn.h>
#include <omp.h>
#include "vec.h"

typedef int (*sum_t)(std::vector<int> &);
typedef std::vector<int> (*add_t)(std::vector<int> &, std::vector<int> &);
typedef void (*register_thread_t)(pthread_t, int);
typedef void (*enable_t)(pthread_t);

pthread_barrier_t barrier;

void launch0(std::vector<int> first, int tag) {
   // std::this_thread::sleep_for(std::chrono::seconds(5));
   pthread_t tid = pthread_self();
   printf("%d: thread %08lx starts\n", tag, tid);

   printf("%d: try dlmopn preloader\n", tag);
   // a new namespace is empty, need to load preloader first
   void *handle = dlmopen(LM_ID_NEWLM, "./preload_affinity.so", RTLD_LAZY);
   if (handle == NULL) {
      fprintf(stderr, "Error in `dlmopen`: %s\n", dlerror());
      return;
   }

   Lmid_t namespace_id;
   if (dlinfo(handle, RTLD_DI_LMID, &namespace_id) < 0) {
      fprintf(stderr, "Error in `dlinfo`: %s\n", dlerror());
      return;
   }

   register_thread_t new_register_thread = (register_thread_t) dlsym(handle, "_Z15register_threadmi");
   if (new_register_thread == NULL) {
      fprintf(stderr, "Error in `dlsym`: %s\n", dlerror());
      printf("quit\n");
      return;
   }
   
   enable_t new_enable = (enable_t) dlsym(handle, "_Z6enablem");
   if (new_register_thread == NULL) {
      fprintf(stderr, "Error in `dlsym`: %s\n", dlerror());
      printf("quit\n");
      return;
   }
   
   printf("%d: try dlmopn target lib\n", tag);
   new_register_thread(tid, 0); // enable preload
   new_enable(tid);

   handle = dlmopen(namespace_id, "lib/libsummp.so", RTLD_LAZY);
   if (handle == NULL) {
      fprintf(stderr, "Error in `dlmopen`: %s\n", dlerror());
      return;
   }

   printf("%d: try dlsym\n", tag);
   sum_t sum = (sum_t) dlsym(handle, "_Z3sumRSt6vectorIiSaIiEE");
   if (sum == NULL) {
      fprintf(stderr, "Error in `dlsym`: %s\n", dlerror());
      printf("quit\n");
      return;
   }

   printf("%d: load sum() from ./lib/libsummp.so\n", tag);

   pthread_barrier_wait(&barrier);
   printf("%d: sum() starts\n", tag);
   sum(first);
   
   printf("%d: quit\n", tag);
}

void launch1(std::vector<int> first, std::vector<int> second, int tag) {
   pthread_t tid = pthread_self();
   printf("%d: thread %08lx starts\n", tag, tid);

   add_t add = NULL;

   printf("%d: try dlmopn\n", tag);
   register_thread(tid, 1);  // enable preload
   enable(tid);
   
   void *handle = dlmopen(LM_ID_BASE, "lib/libaddmp.so", RTLD_LAZY);
   if (handle == NULL) {
      fprintf(stderr, "Error in `dlmopen`: %s\n", dlerror());
      return;
   }
   

   printf("%d: try dlsym\n", tag);
   add = (add_t) dlsym(handle, "_Z3addRSt6vectorIiSaIiEES2_");

   if (add == NULL) {
      fprintf(stderr, "Error in `dlsym`: %s\n", dlerror());
      printf("quit\n");
      return;
   }

   printf("%d: load add() from ./lib/libaddmp.so\n", tag);

   pthread_barrier_wait(&barrier);
   printf("%d: add() starts\n", tag);
   add(first, second);

   printf("%d: quit\n", tag);
}

int main() {
   int size = 12000000;
   std::vector<int> v0(size, 1);
   std::vector<int> v1(size, 1);
   std::vector<int> v2(size, 1);

   pthread_barrier_init(&barrier, NULL, 2);

   std::vector<std::thread> t(2);

   t[0] = std::thread(launch0, v0, 0);
   t[1] = std::thread(launch1, v1, v2, 1);
   
   t[0].join();
   t[1].join();

   return 0;
}