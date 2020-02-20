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

void printNodeTillEnd(Node node) {
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

getNodeSize(Node node) {
  var count = 0;
  while (node != null) {
    count++;
    node = node.next;
  }
  return count;
}

main() {
//  var nodeA = Node(3);
  var nodeB = Node(7);
  var nodeC = Node(8);
  var nodeD = Node(10);

  var nodeE = Node(99);
  var nodeF = Node(1);

//  nodeA.next = nodeB;
  nodeB.next = nodeC;
  nodeC.next = nodeD;

  nodeE.next = nodeF;
  nodeF.next = nodeC;

  print(intersectingNode(nodeB, nodeE));
  print(intersectingNode2(nodeB, nodeE));
}

int intersectingNode(Node a, Node b) {
  //check size of both nodes and tempA will be longer node
  var tempA;
  (getNodeSize(a) > getNodeSize(b)) ? tempA = a : tempA = b;
  while (tempA != null) {
    var tempB;
    (getNodeSize(a) > getNodeSize(b)) ? tempB = b : tempB = a;
    while (tempB != null) {
      if (tempA.val == tempB.val) {
        return tempA.val;
      }
      tempB = tempB.next;
    }
    tempA = tempA.next;
  }
  return null;
}

int intersectingNode2(Node a, Node b) {
  //get size of both nodes and trim the bigger node so that both nodes are of equal size
  //to easily identify the bigger node, store it in map
  int nodeAsize = getNodeSize(a);
  int nodeBsize = getNodeSize(b);
  Node bigNode;
  Node smallNode;
  if (nodeAsize > nodeBsize) {
    bigNode = a;
    smallNode = b;
  } else {
    bigNode = b;
    smallNode = a;
  }
  //now we will traverse through both the nodes till we find common element,
  //but for we will start with shorter node only when we reach  a particular node
  //in longer node, if the difference in size is 3, then we will start traversing through shorter node only
  //we reach 3rd node of longer node
  // ignore: omit_local_variable_types
  int difference = (nodeAsize - nodeBsize).abs();
  // ignore: omit_local_variable_types
  bigNode=skipNnodes(difference, bigNode);
  while (bigNode != null) {
    if (bigNode.val == smallNode.val) {
      return bigNode.val;
    }
    bigNode = bigNode.next;
    smallNode = smallNode.next;
  }
  return null;
}

Node skipNnodes(int n, Node node){
  // ignore: omit_local_variable_types
  for(int i=0;i<n;i++){
    node=node.next;
  }
  return node;
}
