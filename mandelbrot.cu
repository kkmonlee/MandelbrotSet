#include <png.h>
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Macro
#define cudacheck(call) \ {\
  cudaError_t res = (call);\
  if (res != cudaSuccess) {\
    const char* err_str = cudaGetErrorString(res);\
    fprintf(stderr, "%s (%d): %s in %s", __FILE__, __LINE__, err_str, #call);\
    exit(-1);
  }
}

// time spent
double gpu_time = 0;

// computes number of threads
int divup(int x, int y) {
  return x / y + (x % y ? 1 : 0);
}
