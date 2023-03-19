module TDD

# Write your package code here.

function graphConnect(map, node, type::AbstractString="direct")
    if (type == "direct")
        # 1-1: Given a graph and a starting node, return the list of connected nodes
        # Direct tracing
        # Assume that node is in map and that map is given in ascending order
        # Case where node is only connected to self
        if node == map[node]
            #print(node)
            return node
        end
        # All other cases
        #print(sort(vcat(node, map[node][1])))
        return sort(vcat(node, map[node][1]))
    elseif (type == "indirect")
        bucketString = Int64[]
        # 1-2: Given a graph and a starting node, return list of all nodes reachable
        # Indirect tracing
        if (node[1] > length(map))         # Terminal node
            bucketString = vcat(bucketString, node)
            return bucketString
        end
        # If the map goes on
        if (map[node][1][1] > length(map))     # Next node is Terminal
            #print(vcat(node, graphConnect(map, map[node][1], "indirect")))
            bucketString = vcat(bucketString, node, graphConnect(map, map[node][1], "indirect"))
            return bucketString
        end
        if (map[map[node][1]] != node)      # There is more to the map
            #println(typeof(map[node][1]))
            #println(length(map[node][1]))
            for ele in map[node][1]
                #println(ele)
                bucketString = vcat(bucketString,node,graphConnect(map,ele, "indirect"))
            end
        return unique(sort(bucketString))
        end
    end

end

# 1-2 Testing
map1 = [[2,3],[3],[4,5],[6],[7]]
node1 = [3]
map1[node1][1]
length(map1[node1][1])
map1[node1][1][1]
map1[node1][1][2]
for element in map1[node1][1]
    println(element)
end
graphConnect(map1, node1, "indirect")

end
