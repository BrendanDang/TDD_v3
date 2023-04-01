# Code for Problem 2 on Intervals

# Define Interval Structure -- we're thinking we'll pass two floats to an interval structure
struct MyInterval
    x::Float64
    y::Float64
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
    return a in (b.x:b.y)
end

function Base.:(in)(a::Int64,b::MyInterval)
    return a in (b.x:b.y)
end