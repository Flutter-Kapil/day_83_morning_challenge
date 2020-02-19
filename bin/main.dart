//  Given two singly linked lists that intersect at some point, find the intersecting node.
//  The lists are non-cyclical.
//
//  For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return
//  the node with value 8.
//
//  In this example, assume nodes with the same value are the exact same
//  node objects.

class Node {
  int val;
  Node next;

  Node(this.val);
}

main() {
  var nodeA = Node(3);
  var nodeB = Node(7);
  var nodeC = Node(8);
  var nodeD = Node(10);

  var nodeE = Node(99);
  var nodeF = Node(1);

  nodeA.next = nodeB;
  nodeB.next = nodeC;
  nodeC.next = nodeD;

  nodeE.next = nodeF;
  nodeF.next = nodeC;
  print(nodeD.next);

  print(intersectingNode(nodeA, nodeE));
}

int intersectingNode(Node a, Node b) {
  Node tempA = a;
  while (tempA.next != null) {
    print('1st while a loop');
    Node tempB = b;
    while (tempB.next != null) {
      print('tempB node value is ${tempB.val}');
      print('tempA node value is ${tempA.val}');
      print('2nd while b loop');
      if (tempA.val == tempB.val) {
        print('1st if');
        return tempA.val;
      }
      print('else');
      tempB = b.next;
    }
    tempA = a.next;
  }
  return null;
}
