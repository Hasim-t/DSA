class Node {
  int data;
  Node? next;
  Node? prev;

  Node(this.data);
}

Node? head;
Node? tail;

void addData(int data) {
  Node newnode = Node(data);
  if (head == null) {
    head = newnode;
    tail = newnode;
  } else {
    newnode.prev = tail;
    tail!.next = newnode;
    tail = newnode;
  }
}

void displeyData() {
  Node? temp = head;
  if (temp == null) {
    print('its emply');
  }
  while (temp != null) {
    print(temp.data);
    temp = temp.next;
  }
}

void displeyReverse() {
  Node? temp = tail;
  while (temp != null) {
    print(temp.data);
    temp = temp.prev;
  }
}

void delete(int data) {
  Node? temp = head;

  if (temp == null) {
    return;
  }
  if (temp.data == data) {
    if (head!.next != null) {
      head = temp.next;
      head!.prev = null;
    } else {
      head = null;
    }
    return;
  }

  while (temp != null && temp.data != data) {
    temp = temp.next;
  }
  if (temp == null) {
    return;
  }
  if (temp == tail) {
    tail = temp.prev;
    tail?.next = null;
    return;
  }
  Node? before = temp.prev;

  Node? after = temp.next;
  after!.prev = before;
  before!.next = after;
}

void insertingBefore(int before, int data) {
  Node? newNode = Node(data);

  Node? temp = head;
  if (temp == null) {
    return;
  }
  if (temp.data == before) {
    Node? tempor = head;
    head = newNode;
    tempor!.prev = head;
    head!.next = tempor;
    head!.prev = null;
    return;
  }
  while (temp != null && temp.data != before) {
    temp = temp.next;
  }
  if (temp == null) {
    return;
  }
  Node? bef = temp.prev;
  temp.prev = newNode;
  newNode.next = temp;
  newNode.prev = bef;
  bef!.next = newNode;
}

void main() {
  addData(13);
  addData(4);
  addData(5);
  addData(6);
  addData(8);
  insertingBefore(8, 100);
  displeyData();
  displeyReverse();
}
