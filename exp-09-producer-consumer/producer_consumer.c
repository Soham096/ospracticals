// Experiment 09: Producer-Consumer Problem using Pthreads, Mutex, and Semaphores
// Compile: gcc producer_consumer.c -o prod_cons -lpthread

#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

#define BUFFER_SIZE 5
#define TOTAL_ITEMS 5

int buffer[BUFFER_SIZE];
int in = 0, out = 0;

sem_t empty;           // Counts empty buffer slots
sem_t full;            // Counts filled buffer slots
pthread_mutex_t mutex; // Protects critical section

void* producer(void* arg) {
    for (int i = 1; i <= TOTAL_ITEMS; i++) {
        int item = i * 10;

        sem_wait(&empty);             // Wait for an empty slot
        pthread_mutex_lock(&mutex);   // Enter critical section

        buffer[in] = item;
        printf("Producer produced item %d at index %d\n", item, in);
        in = (in + 1) % BUFFER_SIZE;

        pthread_mutex_unlock(&mutex); // Exit critical section
        sem_post(&full);              // Signal that a slot is full
    }
    return NULL;
}

void* consumer(void* arg) {
    for (int i = 1; i <= TOTAL_ITEMS; i++) {
        sem_wait(&full);              // Wait for a filled slot
        pthread_mutex_lock(&mutex);   // Enter critical section

        int item = buffer[out];
        printf("Consumer consumed item %d from index %d\n", item, out);
        out = (out + 1) % BUFFER_SIZE;

        pthread_mutex_unlock(&mutex); // Exit critical section
        sem_post(&empty);             // Signal that a slot is empty
    }
    return NULL;
}

int main() {
    pthread_t prod_tid, cons_tid;

    // Initialize mutex and semaphores
    pthread_mutex_init(&mutex, NULL);
    sem_init(&empty, 0, BUFFER_SIZE); // Initially all slots are empty
    sem_init(&full, 0, 0);            // Initially 0 slots are full

    pthread_create(&prod_tid, NULL, producer, NULL);
    pthread_create(&cons_tid, NULL, consumer, NULL);

    pthread_join(prod_tid, NULL);
    pthread_join(cons_tid, NULL);

    pthread_mutex_destroy(&mutex);
    sem_destroy(&empty);
    sem_destroy(&full);

    return 0;
}
