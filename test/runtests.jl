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
end
