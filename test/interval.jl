# Test for Problem 2 on Intervals

#2-1
@test TDD.minimum(MyInterval(2,9)) == 2 
@test TDD.maximum(MyInterval(2,9)) == 9

#2.2
@test TDD.in(3,MyInterval(2,9)) == true
@test TDD.in(9.1,MyInterval(2,9)) == false

#2.3
@test TDD.isempty(MyInterval()) == true
