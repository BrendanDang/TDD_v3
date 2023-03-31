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
    # 1-4: Generalize to take adjacency matrix maps
        # map is now a Boolean array
        # node is now an index
    # Indirect tracing
    bucketString = Int64[]
    if (typeof(map) == Matrix{Bool})
        for ele in node
            bucketString = unique(sort(vcat(ele,findall(map[ele,1:end])))) # single node connectivity
            nextBucketString = bucketString
            secondBucketString = bucketString
            #nextBucketString = findall(>(0), map[bucketString,1:end]) # the code we want to write, but returns vector of cartesian indexes
            for subele in bucketString
                nextBucketString = unique(sort(vcat(nextBucketString,findall(map[subele,1:end]))))
            end
            for subele2 in nextBucketString
                secondBucketString = unique(sort(vcat(secondBucketString,findall(map[subele2,1:end]))))
            end
            if secondBucketString == bucketString
                println("recursion")
                return unique(sort(vcat(bucketString,nextBucketString)))
            #if (findall(>(0),map[findall(>(0),map[ele,1:end])]) == findall(>(0),map[ele,1:end])) # recursion
            #    bucketString = vcat(bucketString, findall(>(0), map[ele,1:end]), findall(>(0),map[findall(>(0), map[ele,1:end])]))
            #    println("recursion?")
            #    println(bucketString)
            #    bucketString = unique(sort(bucketString))
            else
                neweles = bucketString[bucketString .∉ Ref(ele)]
                bucketString = vcat(bucketString, nextBucketString, graphConnect(map, neweles,"indirect"))
                println("not recursion?")
                println(bucketString)
                bucketString = unique(sort(bucketString))
            end
        end
        return bucketString 
    elseif (type == "indirect")
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
end

function graphConnect(map, type::AbstractString)
    d = Dict{Int64, Vector}()
    oa = [Int64[]]
    # Construct dictionary
    if (typeof(map) == Matrix{Bool} && type == "all")
        for a in 1:length(map[1,1:end])
            d[a] = graphConnect(map,a,"indirect")
        end
    elseif (type == "all")
        for i in 1:length(map)
            d[i] = graphConnect(map, i, "indirect")
        end
    end
    # Initialize output array 
    oa[1] = d[1]
    # Read through dictionary
    if (typeof(map) == Matrix{Bool})
        for b in 1:length(map[1,1:end])
            if d[b] ∉ oa
                push!(oa,d[b])
            end
        end
    else
        for j in 1:length(map)
            if d[j] ∉ oa
                push!(oa,d[j])
            end
        end
    end
    return oa
end

# 1-4 for adjacency matrix format

graphConnect([1], "all")
graphConnect([[2,3],[1],[1],[5],[4]], "all")
graphConnect([[2,3],[3],[4,5],[6],[7]], "all")
graphConnect(Bool[1], "all")
graphConnect(Bool[1 1 1 0 0; 1 1 0 0 0; 1 0 1 0 0; 0 0 0 1 1; 0 0 0 1 1], "all")
graphConnect(Bool[1 1 1 0 0 0 0; 0 1 1 0 0 0 0; 0 0 1 1 1 0 0; 0 0 0 1 0 1 0; 0 0 0 0 1 0 1; 0 0 0 0 0 1 0; 0 0 0 0 0 0 1], "all")