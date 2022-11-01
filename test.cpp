#include <stdio.h>
#include "dog.h"

void test() {
   printf("main() begins.\n");
   say();
   printf("main() ends.\n");
}

int main() {
   test();
   return 0;
}