#include <stdlib.h>
#include <stdio.h>

#define MAX_PAGE_NUM 1000000

typedef struct Page {
  int id;
  int lastUsed;
  struct Page *next;
} Page;

typedef struct Ram {
  struct Page *head;
  int pages[MAX_PAGE_NUM];
  int size;
  int capacity;
} Ram;

Ram *createRam(int capacity) {
  Ram *new = (Ram *)malloc(sizeof(Ram));
  new->head = NULL;
  new->size = 0;
  new->capacity = capacity;
  return new;
}

int isFull(Ram *ram) {
  return (ram->size >= ram->capacity);
}

int isEmpty(Ram *ram) {
  return (ram->size <= 0);
}

int removePageLRU(Ram *ram) {
  if (isEmpty(ram)) return -1;
  
  Page *aux = ram->head;
  ram->head = ram->head->next;
  ram->size--;
  ram->pages[aux->id] = 0;
  free(aux);
  return aux->id;
}

void addPage(Ram *ram, int pageId) {
  if (isFull(ram)) removePageLRU(ram);
  Page *new = (Page *)calloc(1, sizeof(Page));
  new->id = pageId;
  
  if (isEmpty(ram)) {
    ram->head = new;
    ram->size++;
    ram->pages[pageId] = 1;
    return;
  }

  Page *aux = ram->head;
  while (aux->next != NULL) aux = aux->next;
  aux->next = new;
  ram->size++;
  ram->pages[pageId] = 1;
  return;
}

void incrementTime(Ram *ram) {
  Page *aux = ram->head;
  while (aux != NULL) {
    aux->lastUsed++;
    aux = aux->next;
  }
}

void printRAM(Ram *ram) {
  Page *aux = ram->head;
  while (aux != NULL) {
    printf("%d(%d) -> ", aux->id, aux->lastUsed);
    aux = aux->next;
  }
  printf("\n");
}

int main() {
  int q, n, faults = 0;
  Ram *memory;

  scanf("%d %d", &q, &n);
  memory = createRam(q);

  for (int i=0; i<n; i++) {
    int page;
    scanf("%d", &page);
    if (memory->pages[page] == 0) {
      addPage(memory, page);
      faults++;
    }
    incrementTime(memory);
  }

  printf("%d\n", faults);

  return 0;
}