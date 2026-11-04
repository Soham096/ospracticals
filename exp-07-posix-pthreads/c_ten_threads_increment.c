// Experiment 07 (c): Create 10 threads and execute increment() function in each thread
// Compile: gcc c_ten_threads_increment.c -o ten_threads -lpthread

#include <stdio.h>
#include <pthread.h>

int counter = 0; // Shared global counter

// Increment function executed by each thread
void* increment(void* arg) {
    int thread_num = *(int*)arg;
    counter++;
    printf("Thread %2d executed increment() -> Counter = %d\n", thread_num, counter);
    return NULL;
}

int main() {
    pthread_t threads[10];
    int thread_ids[10];

    // Create 10 threads
    for (int i = 0; i < 10; i++) {
        thread_ids[i] = i + 1;
        pthread_create(&threads[i], NULL, increment, &thread_ids[i]);
    }

    // Wait for all 10 threads to finish
    for (int i = 0; i < 10; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("\nFinal Counter Value after 10 threads: %d\n", counter);
    return 0;
}
