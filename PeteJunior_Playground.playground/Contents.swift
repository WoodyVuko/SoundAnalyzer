//: Playground - noun: a place where people can play

import UIKit

var temp: Float = 86
var array2D = Array<Array<Float>>()
var rows = 2
var columns = 100
for column in 0..<columns {
    array2D.append(Array(count:rows, repeatedValue:Float()))
}


for(var i = 0; i < 100; ++i)
{
    array2D[i][0] = Float(1 + i)
    array2D[i][1] = (temp)
    temp -= 0.86
}

print(array2D)