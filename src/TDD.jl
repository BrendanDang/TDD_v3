module TDD

# Write your package code here.

#1-1: Given a graph and a starting node, return the list of connected nodes
function graphConnect(map, node)
    # Assume that node is in map and that map is given in ascending order
    # Case where node is only connected to self
    if node == map[node]
        return node
    end
    # All other cases
    return sort(vcat(node, map[node][1]))
end

end
