#include <iostream>
using namespace std;

struct stackNode {
  char character;
  stackNode *next;
};

class Stack {
  private:
    int size;
    stackNode *stackPointer;

  public:
    Stack() {
      this->size = 0;
      this->stackPointer = NULL;
    }

    void push(char character) {
      stackNode *newNode = new stackNode[1];
      newNode->character = character;
      newNode->next = this->stackPointer;
      stackPointer = newNode;
    }

    stackNode *pop() {
      if (isEmpty()) {
        return NULL;
      }

      stackNode *nodeToPop = stackPointer;
      stackPointer = nodeToPop->next;
      return nodeToPop;
    }

    char getTopValue() {
      return stackPointer->character;
    }

    void emptyStack() {
      if (!isEmpty()) {
        stackNode *auxNode = stackPointer;
        
        while (auxNode != NULL) {
          stackNode *nodeToRemove = auxNode;
          auxNode = auxNode->next;
          delete[] nodeToRemove;
          stackPointer = auxNode;
        }

        size = 0;
      }
    }

    bool isEmpty() {
      return stackPointer == NULL;
    }
};

bool checkMatch(char start, char end) {
  switch(end) {
    case ')':
      if (start == '(') {
        return true;
      } else {
        return false;
      }
    break;
    case ']':
      if (start == '[') {
        return true;
      } else {
        return false;
      }
    break;
    case '}':
      if (start == '{') {
        return true;
      } else {
        return false;
      }
    break;
    default:
      return false;
    break;
  }
}

bool verifyFormat(char *expression) {
  Stack expressionStack;
  int index = 0;

  while (expression[index] != '\0') {
    char auxChar = expression[index];
    if (auxChar == '(' || auxChar == '[' || auxChar == '{') {
      expressionStack.push(auxChar);
    } else if (auxChar == ')' || auxChar == ']' || auxChar == '}') {
      if (checkMatch(expressionStack.getTopValue(), auxChar)) {
        expressionStack.pop();
      } else {
        break;;
      }
    }
    index++;
  }

  if (expressionStack.isEmpty()) {
    return true;
  } else {
    return false;
  }
}

int main() {
  char exp[50];

  cout << "Enter an expression: ";
  cin.getline(exp, 50);
  cout << "\nExpressao: " << exp << "\nRetorno: " << verifyFormat(exp) << endl;

  return 0;
}