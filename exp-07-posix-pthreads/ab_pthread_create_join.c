// Experiment 07 (a & b): Study POSIX pthread library and demonstrate
// pthread_create() & pthread_join()
// Compile: gcc ab_pthread_create_join.c -o ab_pthread -lpthread

#include <stdio.h>
#include <pthread.h>

// Function executed by the thread
void* thread_function(void* arg) {
    char* msg = (char*)arg;
    printf("[Thread] Message received: %s\n", msg);
    printf("[Thread] Thread ID: %lu\n", (unsigned long)pthread_self());
    return NULL;
}

int main() {
    pthread_t tid;
    char* message = "Hello from POSIX Thread!";

    printf("[Main] Creating thread...\n");
    // pthread_create(thread_id, attributes, function, argument)
    pthread_create(&tid, NULL, thread_function, (void*)message);

    // Wait for thread to finish execution
    pthread_join(tid, NULL);
    printf("[Main] Thread finished execution successfully.\n");

    return 0;
}
