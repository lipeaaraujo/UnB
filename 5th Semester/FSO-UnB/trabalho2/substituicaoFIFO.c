#include <stdlib.h>
#include <stdio.h>

#define MAX_PAGE_NUM 1000000

typedef struct Queue {
  int *frames;
  int pages[MAX_PAGE_NUM];
  int front;
  int rear;
  int size;
  int n;
} Queue;

Queue *createQueue(int q) {
  Queue *new = (Queue *)malloc(sizeof(Queue));
  new->frames = (int *)malloc(q * sizeof(int));

  new->front = -1;
  new->rear = -1;
  new->size = 0;
  new->n = q;
  return new;
}

void freeQueue(Queue *q) {
  free(q->frames);
  free(q);
}

int isFull(Queue *q) {
  return (q->size == q->n);
}

int isEmpty(Queue *q) {
  return (q->size == 0);
}

void enqueue(Queue *q, int page) {
  if (isFull(q)) return;
  if (q->front == -1) q->front++;
  q->rear = (q->rear + 1) % q->n;
  q->frames[q->rear] = page;
  q->size++;
}

int dequeue(Queue *q) {
  if (isEmpty(q)) return -1;
  int page = q->frames[q->front];
  q->front = (q->front + 1) % q->n;
  q->size--;
  if (isEmpty(q)) q->front = q->rear = -1;
  return page;
}

void printQueue(Queue *q) {
  for (int i=0; i<q->n; i++)
    printf("(%d) ", q->frames[i]);
  printf("front: %d, rear: %d, size: %d\n", q->front, q->rear, q->size);
}

void addPage(Queue *memory, int page) {
  if (isFull(memory)) memory->pages[dequeue(memory)] = 0;
  enqueue(memory, page);
  memory->pages[page] = 1;
}

int main() {
  int q, n, faults = 0;
  Queue *memory;

  scanf("%d %d", &q, &n);
  memory = createQueue(q);

  for (int i=0; i<n; i++) {
    int page;
    scanf("%d", &page);
    if (memory->pages[page] == 0) {
      addPage(memory, page);
      faults++;
    }
  }

  printf("%d\n", faults);
}