# Code for Problem 1 on graphing
export graphConnect
function graphConnect(map, node)
    # 1-1: Given a graph and a starting node, return the list of connected nodes
    # Direct tracing
    # Assume that node is in map and that map is given in ascending order
    for ele in node
        if (ele > length(map))         # Terminal node
            return ele
        end
        # Case where node is only connected to self
        if ele == map[node]
            #print(node)
            return ele
        end
        # All other cases
        #print(sort(vcat(node, map[node][1])))
        return unique(sort(vcat(ele, map[ele])))
    end
end

function graphConnect(map, node, type::AbstractString)
    # 1-2: Given a graph and a starting node, return list of all nodes reachable
    # Indirect tracing
    bucketString = Int64[]
    if (type == "indirect")
        for ele in node
            #println(ele)
            if ele > length(map)        # Terminal node
                bucketString = vcat(bucketString, ele)
                return unique(sort(bucketString))
            elseif map[ele][1] > length(map)     # Next node is Terminal
                bucketString = vcat(bucketString, ele, graphConnect(map, map[ele], "indirect"))
            elseif ele == map[ele]          # Simple map
                bucketString = vcat(bucketString, ele)
                return unique(sort(bucketString))
            elseif map[map[ele][1]] == ele  # recursion with single element
                bucketString = unique(sort(vcat(ele, map[ele]), map[map[ele]]))
                return unique(sort(bucketString))
            elseif map[map[ele][1]][1] == ele   # recursion with multiple elements(?)
                bucketString = vcat(ele, map[ele][1:end], map[map[ele]][1])
                #println(bucketString)
                return unique(sort(bucketString))
            elseif map[map[ele]] != ele     # Avoid recursion
                #println(map[map[ele][1]])
                bucketString = vcat(bucketString, ele, graphConnect(map, map[ele],"indirect"))
                return unique(sort(bucketString))
            end
        end
        return unique(sort(bucketString))
    end
    return unique(sort(bucketString))
end

#graphConnect([1], [1])
#graphConnect([[2,3],[1],[1],[5],[4]], [5], "indirect")
#graphConnect([[2,3],[3],[4,5],[6],[7]], [3], "indirect")
