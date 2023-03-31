# Code for Problem 2 on Intervals

# Define Interval Structure -- we're thinking we'll pass two floats to an interval structure
struct Interval <: Integer
    x
    y
end

# Extend minimum
function Base.:(minimum)(a::Interval)
    return a.x
end

# Extend maximum
function Base.:(maximum)(a::Interval)
    return a.y
end
