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

void printNodeTillEnd(Node node){
  while(node!=null){
    print(node.val);
    node=node.next;
  }
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


//  printNodeTillEnd(nodeE);
//  printNodeTillEnd(nodeA);
  print(intersectingNode(nodeA, nodeE));
}

int intersectingNode(Node a, Node b) {
  var tempA = a;
  while (tempA != null) {
    var tempB = b;
    while (tempB!= null) {
      if (tempA.val == tempB.val) {
        return tempA.val;
      }
      tempB = tempB.next;
    }
    tempA = tempA.next;

  }
  return null;
}
