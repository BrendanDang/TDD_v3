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

#2.5
@test TDD.intersect(MyInterval(1,3),MyInterval(3,5)) == MyInterval(3,3)
@test TDD.intersect([1,6],MyInterval(4,8)) == MyInterval(4,6)
@test TDD.intersect(MyInterval(1,16),[7,99]) == MyInterval(7,16)

#2-6
@test TDD.ppIntersect(MyInterval(3,3)) == print('\u301a'*'3'*','*'3'*'\u301b')
@test TDD.ppIntersect(intersect([1,6],MyInterval(4,8))) == print('\u301a'*'4'*','*'6'*'\u301b')
@test TDD.ppIntersect() == print('\u301a'*'∅'*'\u301b')