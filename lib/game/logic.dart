// ignore_for_file: avoid_print

import 'package:soko_number/game/structure.dart';

// class States {
//   late States previous;
//   late Structure value;
// }

class Logic {
  States states = States();
  userPlay() {}

  bfs(Structure s) {
    s = s.deepCopy();
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
    print('visited nodes are : $visited');
    print("**********************-{Results}-****************************");
    print('Depth : ${queue[0].depth}');
    print('visited nodes numbers is : ${visited.length}');
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
      if (stack.last.isFinal()) {
        print("You WON");
        break;
      }
      // if (stack.last.depth == 100) {
      //   continue;
      // }
      nextStates = stack.last.getNextStates();
      stack.removeLast();
      for (var i = 0; i < nextStates.length; i++) {
        ss = nextStates[i].board.toString();
        if (!visited.containsKey(ss)) {
          stack.add(nextStates[i]);
          if (stack.length > depth) {
            depth = stack.length;
          }
        }
      }
    }

    print('visited nodes are : $visited');
    print("**********************-{Results}-****************************");
    print('Depth : ${stack.last.depth}');
    // print('Depth by length: ${stack.length}');
    print('visited nodes numbers is : ${visited.length}');
    print('DFS executed in ${stopwatch.elapsed}');
    print("**********************-{END}-****************************");
  }

  uCS() {}

  aStar() {}
}
