using TDD
using Test
#TDD.graphConnect([1],[1])

@testset "TDD.jl" begin
    # Write your tests here.
    # 1-1: Given a graph and a starting node, return the list of connected nodes
    @test TDD.graphConnect([1], [1]) == [1]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [1]) == [1,2,3]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [2]) == [1,2]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [3]) == [1,3]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [4]) == [4,5]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [5]) == [4,5]

    # 1-2 Given a graph and a starting node, return list of all nodes reachable
    @test TDD.graphConnect([1], [1]) == [1]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [1]) == [1,2,3]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [2]) == [1,2,3]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [3]) == [1,2,3]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [4]) == [4,5]
    @test TDD.graphConnect([[2,3],[1],[1],[5],[4]], [5]) == [4,5]
    # Directed graph
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [1]]) == [1,2,3,4,5,6,7]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [2]]) == [2,3,4,5,6,7]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [3]]) == [3,4,5,6,7]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [4]]) == [4,6]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [5]]) == [5,7]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [6]]) == [6]
    @test TDD.graphConnect([[2,3],[3],[4,5],[6],[7], [7]]) == [7]
end
