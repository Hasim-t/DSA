//single linked list

class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? head;
Node? tail;

void addnode(int data) {
  Node newnode = Node(data);
  if (head == null) {
    head = newnode;
  } else {
    tail?.next = newnode;
  }
  tail = newnode;
}

void deleteNode(int data) {
  Node? temp = head;
  Node? prev;
  if (temp != null && temp.data == data) {
    head = temp.next;
  }

  while (temp != null && temp.data != data) {
    prev = temp;
    temp = temp.next;
  }
  if (temp == tail) {
    tail = prev;
    tail?.next = null;
    return;
  }
  prev?.next = temp?.next;
}

void insert(int nextTo, int data) {
  Node? temp = head;
  Node newnode = Node(data);

  while (temp != null && temp.data != nextTo) {
    temp = temp.next;
  }
  if (temp == null) {
    tail?.next = newnode;
    tail = newnode;
    return;
  }
  if (temp == tail) {
    tail?.next = newnode;
    tail = newnode;
    return;
  }
  newnode.next = temp.next;
  temp.next = newnode;
}

void dispaly() {
  Node? temp = head;
  if (temp == null) {
    print('its empty');
  }
  while (temp != null) {
    print(temp.data);
    temp = temp.next;
  }
}

void main() {
  addnode(1);
  addnode(2);
  addnode(3);
  addnode(4);
  addnode(5);
  addnode(6);
  deleteNode(4);
  insert(3, 10);
  dispaly();
}
