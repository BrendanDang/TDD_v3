# 1-1: Given a graph and a starting node, return the list of connected nodes
@test TDD.graphConnect([1], [1]) == [1]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [1]) == [1,2,3]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [2]) == [1,2]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [3]) == [1,3]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [4]) == [4,5]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [5]) == [4,5]

# 1-2 Given a graph and a starting node, return list of all nodes reachable
@test TDD.graphConnect([1], [1], "indirect") == [1]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [1], "indirect") == [1,2,3]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [2], "indirect") == [1,2,3] # failed, need to capture node 3
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [3], "indirect") == [1,2,3] # failed, need to sort, unique
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [4], "indirect") == [4,5]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [5], "indirect") == [4,5]   # failed, need to sort
# Directed graph
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [1], "indirect") == [1,2,3,4,5,6,7]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [2], "indirect") == [2,3,4,5,6,7]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [3], "indirect") == [3,4,5,6,7]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [4], "indirect") == [4,6]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [5], "indirect") == [5,7]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [6], "indirect") == [6]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], [7], "indirect") == [7]

# 1-3 Given a graph, identify all connected nodes
@test TDD.graphConnect([1], "all") == [[1]]
@test TDD.graphConnect([[2,3],[1],[1],[5],[4]], "all") == [[1,2,3],[4,5]]
@test TDD.graphConnect([[2,3],[3],[4,5],[6],[7]], "all") == [[1,2,3,4,5,6,7], [2,3,4,5,6,7], [3,4,5,6,7], [4,6],[5,7]]

# 1-4 Generalize code
@test TDD.graphConnect(Bool[1], "all") == [[1]]
@test TDD.graphConnect(Bool[1 1 1 0 0; 1 1 0 0 0; 1 0 1 0 0; 0 0 0 1 1; 0 0 0 1 1], "all") == [[1,2,3],[4,5]]
@test TDD.graphConnect(Bool[1 1 1 0 0 0 0; 0 1 1 0 0 0 0; 0 0 1 1 1 0 0; 0 0 0 1 0 1 0; 0 0 0 0 1 0 1; 0 0 0 0 0 1 0; 0 0 0 0 0 0 1], "all") == [[1,2,3,4,5,6,7], [2,3,4,5,6,7], [3,4,5,6,7], [4,6],[5,7], [6], [7]]