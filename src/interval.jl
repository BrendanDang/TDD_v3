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

#minimum(MyInterval(2,9)) == 2 
#maximum(MyInterval(2,9)) == 9

#in(3,MyInterval(2,9)) == true
#in(9.1,MyInterval(2,9)) == false

#isempty(MyInterval()) == true