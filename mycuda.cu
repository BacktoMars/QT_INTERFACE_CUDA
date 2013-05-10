#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
//#include <cutil_inline.h>

extern "C"
void runCudaPart(float a[], float b[], float c[], int n);


__global__ void myKernel(float *a, float *b, float *c, int n)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    
    //return;

    if (idx < n)
    {
        c[idx] = a[idx] + b[idx];
        //c[idx] = 10.0;
    }
    //printf("Test\n");
    return;
}

// Main cuda function

void runCudaPart(float *a, float *b, float *c, int n) {

    // all your cuda code here *smile*
    
    float *a_d, *b_d, *c_d;
    size_t size = n * sizeof(float);
    
    printf("n = %d\n", n);
    printf("%f %f %f\n", a[10], b[10], c[10]);

    cudaMalloc((void **) &a_d, size);
    cudaMalloc((void **) &b_d, size);
    cudaMalloc((void **) &c_d, size);

    //cudaMemcpy(a_d, a, size,cudaMemcpyHostToDevice);
    //cudaMemcpy(b_d, b, size,cudaMemcpyHostToDevice);
    //cudaMemset(c_d, 0, n);

    printf("Executing CUDA kernel\n");
    //myKernel <<<1,100>>> (a_d, b_d, c_d, n);



    cudaMemcpy(c, c_d, size, cudaMemcpyDeviceToHost);

    printf("Kernel ended.\n");

}
