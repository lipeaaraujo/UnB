// #include <stdio.h>
#include <pthread.h>
// #include <unistd.h>
// #include <stdlib.h>

// #define NUM_THREADS 10

int count = 0;
pthread_mutex_t mut = PTHREAD_MUTEX_INITIALIZER;

struct thread_arg {
  int vezes
};

// int work(int id);

// void work(int id) {
//   printf("id: %d trabalhando...\n", id);
// }

void *thread_func(void *arg) {
  struct thread_arg *ctx = arg;
  int id;

  for (int i=0; i<ctx->vezes; i++) {
    pthread_mutex_lock(&mut);
    id = count;
    //printf("chamando work com id: %d\n", id);
    count++;
    pthread_mutex_unlock(&mut);
    work(id);
    
  }

  pthread_exit(NULL);
}

// int main() {
//   struct thread_arg arg = {10};
//   pthread_t threads[NUM_THREADS];

//   for (int i=0; i<NUM_THREADS; i++) {
//     int ret = pthread_create(&threads[i], NULL, &thread_func, &arg);
//     if (ret) {
//       printf("erro %d na thread %d\n", ret, i);
//       perror("pthread_create");
//       exit(-1);
//     }
//   }

//   sleep(2);

//   return 0;
// }
