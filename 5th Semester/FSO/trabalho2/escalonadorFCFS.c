#include <stdlib.h>
#include <stdio.h>

typedef struct Process {
  int id;
  int *inst;
  int prog;
  int m;
} Process;

typedef struct Queue {
  Process **processes;
  int front;
  int rear;
  int size;
  int n;
} Queue;

Queue *createQueue(int n) {
  Queue *new = (Queue *)malloc(sizeof(Queue));
  new->processes = (Process **)malloc(n * sizeof(Process *));
  new->front = -1;
  new->rear = -1;
  new->size = 0;
  new->n = n;
  return new;
}

void freeQueue(Queue *q) {
  free(q->processes);
  free(q);
}

int isFull(Queue *q) {
  return (q->size == q->n);
}

int isEmpty(Queue *q) {
  return (q->size == 0);
}

void enqueue(Queue *q, Process *process) {
  if (isFull(q)) return;
  if (q->front == -1) q->front++;
  q->rear = (q->rear + 1) % q->n;
  q->processes[q->rear] = process;
  q->size++;
}

Process *dequeue(Queue *q) {
  if (isEmpty(q)) return NULL;
  Process *processo = q->processes[q->front];
  q->front = (q->front + 1) % q->n;
  q->size--;
  if (isEmpty(q)) q->front = q->rear = -1;
  return processo;
}

void printQueue(Queue *q) {
  for (int i=0; i<q->n; i++)
    printf("(%d) ", q->processes[i]->id);
  printf("front: %d, rear: %d, size: %d\n", q->front, q->rear, q->size);
}

int main() {
  int n, m, timeExec = 0;
  Queue *scheduler;

  scanf("%d", &n);
  scheduler = createQueue(n);

  for (int i=0; i<n; i++) {
    scanf("%d", &m);
    scheduler->processes[i] = (Process *)calloc(1, sizeof(Process));
    scheduler->processes[i]->id = i+1;
    scheduler->processes[i]->inst = (int *)malloc(m * sizeof(int));
    scheduler->processes[i]->m = m;
  }

  for (int i=0; i<n; i++)
    for (int j=0; j<scheduler->processes[i]->m; j++)
      scanf("%d", &scheduler->processes[i]->inst[j]);

  scheduler->front = 0;
  scheduler->rear = n-1;
  scheduler->size = n;

  while (!isEmpty(scheduler)) {
    Process *current = dequeue(scheduler);
    while (current->prog < current->m) {
      if (current->inst[current->prog] == 1) {
        current->inst[current->prog] = 0;
        enqueue(scheduler, current);
        break;
      }
      timeExec += 10;
      current->prog++;
    }
    if (current->prog >= current->m) {
      printf("%d (%d)\n", current->id, timeExec);
      free(current->inst);
      free(current);
    }
  }

  return 0;
}