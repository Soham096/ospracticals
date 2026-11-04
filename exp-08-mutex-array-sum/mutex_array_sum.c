// Experiment 08: Calculate sum of array using pthread and mutex lock for synchronization
// Compile: gcc mutex_array_sum.c -o mutex_sum -lpthread

#include <stdio.h>
#include <pthread.h>

#define SIZE 8
#define NUM_THREADS 2

int arr[SIZE] = {10, 20, 30, 40, 50, 60, 70, 80};
int total_sum = 0;
pthread_mutex_t lock; // Mutex lock variable

void* sum_array(void* arg) {
    int thread_id = *(int*)arg;
    int start = thread_id * (SIZE / NUM_THREADS);
    int end = start + (SIZE / NUM_THREADS);

    for (int i = start; i < end; i++) {
        // Lock mutex before updating shared total_sum
        pthread_mutex_lock(&lock);
        total_sum += arr[i];
        printf("Thread %d added %d -> Running Sum = %d\n", thread_id + 1, arr[i], total_sum);
        pthread_mutex_unlock(&lock);
    }
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    int ids[NUM_THREADS];

    // Initialize mutex lock
    pthread_mutex_init(&lock, NULL);

    // Create threads
    for (int i = 0; i < NUM_THREADS; i++) {
        ids[i] = i;
        pthread_create(&threads[i], NULL, sum_array, &ids[i]);
    }

    // Wait for threads to complete
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Destroy mutex lock
    pthread_mutex_destroy(&lock);

    printf("\nFinal Sum of Array = %d\n", total_sum);
    return 0;
}
