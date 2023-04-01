# Test for Problem 2 on Intervals

#2-1
@test TDD.minimum(MyInterval(2,9)) == 2 
@test TDD.maximum(MyInterval(2,9)) == 9

#2.2
@test TDD.in(3,MyInterval(2,9)) == true
@test TDD.in(9.1,MyInterval(2,9)) == false

#2.3
@test TDD.isempty(MyInterval()) == true

#2.4
@test TDD.issubset(MyInterval(3.0,6.0),MyInterval(2.0,9.0)) == true
@test TDD.issubset([1,5.3],MyInterval(2,9)) == false
@test TDD.issubset(MyInterval(3.5,4.5),[0.5,7.8]) == true