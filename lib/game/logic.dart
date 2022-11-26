// ignore_for_file: avoid_print
import 'package:collection/collection.dart';

import 'package:soko_number/game/structure.dart';

// class States {
//   late States previous;
//   late Structure value;
// }

class Logic {
  // States state = States();
  int visiteds = 0;
  userPlay() {}

  bfs(Structure s) {
    // s = s.deepCopy();

    final stopwatch = Stopwatch()..start();
    List<Structure> queue = [s]; //live queue
    var visited = <String, bool>{}; //;

    String ss;
    List<Structure> nextStates;
    while (queue.isNotEmpty) {
      ss = queue[0].board.toString();
      visited[ss] = true;
      if (queue[0].isFinal()) {
        print("You WON");
        break;
      }

      nextStates = queue[0].getNextStates();
      for (var i = 0; i < nextStates.length; i++) {
        ss = nextStates[i].board.toString();
        if (!visited.containsKey(ss)) {
          queue.add(nextStates[i]);
        }
      }

      queue.removeAt(0);
    }
    States.visited = visited.length;
    States.deepth = queue[0].depth;
    print('visited nodes are : $visited');
    print("**********************-{Results}-****************************");
    print('Depth : ${States.deepth}');
    print('visited nodes numbers is : ${States.visited}');
    print('BFS executed in ${stopwatch.elapsed}');
    print("**********************-{END}-****************************");
  }

  dfs(Structure s) {
    int depth = 1;
    s = s.deepCopy();
    final stopwatch = Stopwatch()..start();
    List<Structure> stack = [s];
    var visited = <String, bool>{};
    String ss;
    List<Structure> nextStates;
    while (stack.isNotEmpty) {
      ss = stack.last.board.toString();

      visited[ss] = true;
      print(ss);

      if (stack.last.isFinal()) {
        print("You WON");
        break;
      }

      nextStates = stack.last.getNextStates();
      stack.removeLast();
      for (var i = 0; i < nextStates.length; i++) {
        ss = nextStates[i].board.toString();
        if (!visited.containsKey(ss)) {
          stack.add(nextStates[i]);
        }
      }
    }
    States.visited = visited.length;
    States.deepth = stack.last.depth;
    print('visited nodes are : ${visited}');
    print("**********************-{Results}-****************************");
    print('Depth : ${stack.last.depth}');

    print('visited nodes numbers is : ${visited.length}');
    print('DFS executed in ${stopwatch.elapsed}');
    print("**********************-{END}-****************************");
  }

  var visited = <String, bool>{};
  String ss = '';
  bool finals = false;
  ndfs(Structure s) {
    List<Structure> nextStates;

    ss = s.board.toString();
    visited[ss] = true;
    States.deepth++;
    if (s.isFinal()) {
      finals = true;
      print("You WON");
      return;
    }
    for (int i = 0; i < s.getNextStates().length; i++) {
      if (!visited.containsKey(ss)) {
        nextStates = s.getNextStates();
        ndfs(nextStates[i]);
        if (finals == true) {
          return;
        }
      }
    }

    States.visited = visited.length;
    // States.deepth = stack.last.depth;
    print('visited nodes are : ${visited.length}');
    print("**********************-{Results}-****************************");
    print('Depth : ${States.deepth}');

    print('visited nodes numbers is : $visiteds');
    // print('DFS executed in ${stopwatch.elapsed}');
    print("**********************-{END}-****************************");
  }

  uCS(Structure s) {
    Structure pqueue;
    PriorityQueue<Structure> queue =
        PriorityQueue<Structure>((b, a) => b.depth.compareTo(a.depth));

    queue.add(s);
    final stopwatch = Stopwatch()..start();
    var visited = <String, bool>{}; //;
    String ss;
    List<Structure> nextStates;
    while (queue.isNotEmpty) {
      ss = queue.first.board.toString();
      visited[ss] = true;
      if (queue.first.isFinal()) {
        print("You WON");
        break;
      }
      pqueue = queue.removeFirst();
      nextStates = pqueue.getNextStates();
      for (var i = 0; i < nextStates.length; i++) {
        ss = nextStates[i].board.toString();
        if (!visited.containsKey(ss)) {
          queue.add(nextStates[i]);
        }
      }
    }
    States.visited = visited.length;
    States.deepth = queue.first.depth;
    print('visited nodes are : $visited');
    print("**********************-{Results}-****************************");
    print('Depth : ${queue.first.depth}');
    print('visited nodes numbers is : ${visited.length}');
    print('BFS executed in ${stopwatch.elapsed}');
    print("cost is : ${queue.first.cost}");
    print("**********************-{END}-****************************");
  }

  aStar(Structure s) {
    // queue that prioritizes longer strings
    final queue = PriorityQueue<String>((b, a) => b.length.compareTo(a.length));
    queue
      ..add('foo')
      ..add('bazars')
      ..add('zort');

    while (queue.isNotEmpty) {
      print('* ${queue.removeFirst()}');
    }
  }
}
