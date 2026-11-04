// Experiment 11: Dining Philosophers Problem using Semaphores
// Compile: gcc dining_philosophers.c -o dining -lpthread

#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define N 5 // Number of philosophers

sem_t chopstick[N];

void* philosopher(void* arg) {
    int id = *(int*)arg;
    int left = id;
    int right = (id + 1) % N;

    printf("Philosopher %d is thinking...\n", id);

    // To prevent deadlock, the last philosopher picks up the right chopstick first
    if (id == N - 1) {
        sem_wait(&chopstick[right]);
        sem_wait(&chopstick[left]);
    } else {
        sem_wait(&chopstick[left]);
        sem_wait(&chopstick[right]);
    }

    // Eat
    printf("Philosopher %d picked up chopsticks %d & %d and is EATING.\n", id, left, right);
    usleep(100000); // Simulate eating briefly

    // Put down chopsticks
    sem_post(&chopstick[left]);
    sem_post(&chopstick[right]);
    printf("Philosopher %d put down chopsticks and finished eating.\n", id);

    return NULL;
}

int main() {
    pthread_t tid[N];
    int ids[N];

    // Initialize each chopstick semaphore to 1
    for (int i = 0; i < N; i++) {
        sem_init(&chopstick[i], 0, 1);
    }

    // Create 5 philosopher threads
    for (int i = 0; i < N; i++) {
        ids[i] = i;
        pthread_create(&tid[i], NULL, philosopher, &ids[i]);
    }

    // Wait for all philosophers to finish
    for (int i = 0; i < N; i++) {
        pthread_join(tid[i], NULL);
    }

    // Destroy semaphores
    for (int i = 0; i < N; i++) {
        sem_destroy(&chopstick[i]);
    }

    return 0;
}
