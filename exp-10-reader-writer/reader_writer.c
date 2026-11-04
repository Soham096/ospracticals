// Experiment 10: Reader-Writer Problem using Pthreads, Mutex, and Semaphores
// Compile: gcc reader_writer.c -o reader_writer -lpthread

#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

sem_t wrt;              // Semaphore for writer exclusive access
pthread_mutex_t mutex;  // Mutex to protect read_count
int shared_data = 100;  // Shared resource
int read_count = 0;     // Number of active readers

void* writer(void* arg) {
    int id = *(int*)arg;

    sem_wait(&wrt); // Lock resource for writing
    shared_data += 50;
    printf("Writer %d modified shared_data to %d\n", id, shared_data);
    sem_post(&wrt); // Release resource

    return NULL;
}

void* reader(void* arg) {
    int id = *(int*)arg;

    // Entry section for reader
    pthread_mutex_lock(&mutex);
    read_count++;
    if (read_count == 1) {
        sem_wait(&wrt); // First reader locks out writers
    }
    pthread_mutex_unlock(&mutex);

    // Reading section
    printf("Reader %d read shared_data = %d\n", id, shared_data);

    // Exit section for reader
    pthread_mutex_lock(&mutex);
    read_count--;
    if (read_count == 0) {
        sem_post(&wrt); // Last reader releases writers
    }
    pthread_mutex_unlock(&mutex);

    return NULL;
}

int main() {
    pthread_t r[3], w[2];
    int ids[3] = {1, 2, 3};

    pthread_mutex_init(&mutex, NULL);
    sem_init(&wrt, 0, 1);

    // Create readers and writers
    pthread_create(&r[0], NULL, reader, &ids[0]);
    pthread_create(&w[0], NULL, writer, &ids[0]);
    pthread_create(&r[1], NULL, reader, &ids[1]);
    pthread_create(&w[1], NULL, writer, &ids[1]);
    pthread_create(&r[2], NULL, reader, &ids[2]);

    for (int i = 0; i < 3; i++) pthread_join(r[i], NULL);
    for (int i = 0; i < 2; i++) pthread_join(w[i], NULL);

    pthread_mutex_destroy(&mutex);
    sem_destroy(&wrt);

    return 0;
}
