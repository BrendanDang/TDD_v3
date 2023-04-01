# Code for Problem 2 on Intervals

# Define Interval Structure -- we're thinking we'll pass two floats to an interval structure
struct MyInterval{T<:Real}
    x::T
    y::T
end

# Extend minimum
function Base.:(minimum)(a::MyInterval)
    return a.x
end

# Extend maximum
function Base.:(maximum)(a::MyInterval)
    return a.y
end

# Extend in
function Base.:(in)(a::Float64,b::MyInterval)
    return a >= minimum(b) && a <= maximum(b)
end

function Base.:(in)(a::Int64,b::MyInterval)
    return a >= minimum(b) && a <= maximum(b)
end

function Base.:(in)(a::MyInterval,b::MyInterval)
    return minimum(a) >= minimum(b) && maximum(a) <= maximum(b)
end

# Empty Interval
function MyInterval(x::Real = NaN, y::Real = NaN)
    return MyInterval(x,y)
end

function Base.:(isempty)(a::MyInterval)
    if ((minimum(a)+maximum(a))/2 in a)
        return false
    else
        return true
    end
end

# 2-4 Subsets
function Base.:(issubset)(a::MyInterval, b::MyInterval)
    return a in b
end

function Base.:(issubset)(a::Vector{Float64}, b::MyInterval)
    return a[1] in b && a[2] in b
end

function Base.:(issubset)(a::MyInterval, b::Vector{Float64})
    return minimum(a) >= b[1] && maximum(a) <= b[2]
end

#2-5 Intersect
function Base.:(intersect)(a::MyInterval, b::MyInterval)
    return MyInterval(max(minimum(a),minimum(b)),min(maximum(a),maximum(b)))
end

function Base.:(intersect)(a::Vector{}, b::MyInterval)
    return MyInterval(max(a[1],minimum(b)),min(a[2],maximum(b)))
end

function Base.:(intersect)(a::MyInterval, b::Vector{})
    return MyInterval(max(minimum(a),b[1]),min(maximum(a),b[2]))
end