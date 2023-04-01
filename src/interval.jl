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

# Subsets
function Base.:(issubset)(a::MyInterval, b::MyInterval)
    return a in b
end

function Base.:(issubset)(a::Vector{Float64}, b::MyInterval)
    return a[1] in b && a[2] in b
end

function Base.:(issubset)(a::MyInterval, b::Vector{Float64})
    return minimum(a) >= b[1] && maximum(a) <= b[2]
end

#function Base.:(iterate)(b::MyInterval)
#    return iterate(minimum(b):maximum(b))
#end

#function Base.:(iterate)(b::MyInterval, c::Int64)
#    return iterate(minimum(b):c:maximum(b))
#end
#minimum(MyInterval(2,9)) == 2 
#maximum(MyInterval(2,9)) == 9

#in(3,MyInterval(2,9)) == true
#in(9.1,MyInterval(2,9)) == false

#isempty(MyInterval()) == true
#2.4
#issubset(MyInterval(3.0,6.0),MyInterval(2.0,9.0))
#issubset([1,5.3],MyInterval(2,9))