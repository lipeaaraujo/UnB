#include<iostream>
using namespace std;

struct Node {
  int value;
  Node *next;
};

class LinkedList {
  private:
    int size;
    Node *listPointer;
    Node *lastPointer;

  public:
    LinkedList() {
      this->listPointer = NULL;
      this->lastPointer = NULL;
      this->size = 0;
    }

    bool isEmpty() {
      return this->listPointer == NULL ? true : false;
    }

    void includeHead(int value) {
      Node *newNode;
      newNode = new Node[1];
      newNode->value = value; 
      newNode->next = this->listPointer;
      if(this->isEmpty()) this->lastPointer = newNode;
      this->listPointer =  newNode;
      this->size++;
    }

    void includeBeforeKey(int value, int key) {
      Node *newNode, *auxNode;
      newNode = new Node[1];
      newNode->value = value;
      
      if (!this->isEmpty()) {
        auxNode = listPointer;
        while (auxNode->next != NULL) {
          if (auxNode->next == NULL) {
            break;
          } else if (auxNode->next->value == key) {
            newNode->next = auxNode->next;
            auxNode->next = newNode;
            this->size++;
            break;
          } else {
            auxNode = auxNode->next;
          }
        }
      }
    }

    void includeTail(int value) {
      Node *newNode, *auxNode;
      newNode = new Node[1];
      newNode->value = value;
      newNode->next = NULL;

      if (!this->isEmpty()) {
        auxNode = listPointer;

        while (auxNode->next != NULL) {
          auxNode = auxNode->next;
        }

        auxNode->next = newNode;
      } else {
        this->listPointer = newNode;
      }

      this->lastPointer = newNode;
      this->size++;
    }
    
    void deleteHead() {
      if (!isEmpty()) {
        Node *auxNode = listPointer;
        listPointer = auxNode->next;
        delete[] auxNode;
        this->size--;
      }
    }

    void deleteKey(int key) {
      if (!isEmpty()) {
        Node *auxNode = listPointer;
        if (auxNode->value == key) {
          this->listPointer = auxNode->next;
          delete[] auxNode;
          this->size--;
        } else {
          while(auxNode->next != NULL) {
            if (auxNode->next->value == key) {
              Node *auxAddress = auxNode->next->next;
              delete[] auxNode->next;
              auxNode->next = auxAddress;
              if (auxNode->next == NULL) lastPointer = auxNode; 
              this->size--;
              break;
            }
            auxNode = auxNode->next;
          }
        }
      }
    }

    void deleteTail() {
      if (!isEmpty()) {
        Node *auxNode = this->listPointer;
        if (auxNode->next == NULL) {
          this->listPointer = NULL;
          this->lastPointer = NULL;
          delete[] auxNode;
          this->size--;
        } else {
          while (auxNode->next->next != NULL) {
            auxNode = auxNode->next;
          }
          delete[] auxNode->next;
          auxNode->next = NULL;
          this->lastPointer = auxNode;
          this->size--;
        }
      }
    }

    void printList() {
      Node node;
      Node *nextAdress = this->listPointer;

      cout << "Head: " << this->listPointer << " Size: " << this->size << " Tail: " << this->lastPointer << endl;

      for (int i = 0; i < size; i++) {
        node = *nextAdress;
        cout << "Node: " << node.value << ", " << node.next << endl;
        nextAdress = node.next;
      }
    }

};

int main() {
  LinkedList linkedList;

  linkedList.includeTail(2);
  linkedList.includeHead(5);
  linkedList.includeHead(10);
  linkedList.includeBeforeKey(4, 5);
  linkedList.includeBeforeKey(3, 3);
  linkedList.deleteHead();
  linkedList.deleteTail();
  linkedList.deleteKey(5);

  linkedList.printList();

  return 0;
}