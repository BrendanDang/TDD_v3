# Test for Problem 2 on Intervals

#2-1
@test TDD.minimum(Interval(2,9)) == 2 
@test TDD.maximum(Interval(2,9)) == 9

#2.2
@test TDD.in(3,Interval(2,9)) == true
@test TDD.in(9.1,Interval(2,9)) == false
