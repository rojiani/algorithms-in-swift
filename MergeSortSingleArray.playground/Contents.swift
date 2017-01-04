//: Playground - noun: a place where people can play

import UIKit

// TODO mergesort

// In-place merge using auxillary array
func merge(array: inout [Int], auxillary: inout [Int],
           leftRange: CountableRange<Int>, rightRange: CountableRange<Int>) {
    
    var leftIndex = leftRange.lowerBound
    var rightIndex = rightRange.lowerBound
    var auxIndex = leftIndex
    
    while leftIndex < leftRange.upperBound && rightIndex < rightRange.upperBound {
        if array[leftIndex] <= array[rightIndex] {
            auxillary[auxIndex] = array[leftIndex]
            leftIndex += 1
            auxIndex += 1
        } else {
            auxillary[auxIndex] = array[rightIndex]
            rightIndex += 1
            auxIndex += 1
        }
    }
    
    // If left.count != right.count, finish merging the remaining elements
    while leftIndex < leftRange.upperBound {
        auxillary[auxIndex] = array[leftIndex]
        leftIndex += 1
        auxIndex += 1
    }
    
    while rightIndex < rightRange.upperBound {
        auxillary[auxIndex] = array[rightIndex]
        rightIndex += 1
        auxIndex += 1
    }
    
    // Copy from auxillary to array
    //for i in leftRange.lowerBound ..< auxIndex {
    for i in leftRange.lowerBound ..< rightRange.upperBound {
        array[i] = auxillary[i]
    }
}

var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var aux = [Int]()
for _ in 0 ..< (numbers.count) {
    aux.append(Int.min)
}

merge(array: &numbers, auxillary: &aux, leftRange: 0 ..< 5, rightRange: 5 ..< 10)
print(numbers)
