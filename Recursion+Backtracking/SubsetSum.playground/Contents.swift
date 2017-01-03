//: Playground - noun: a place where people can play

import UIKit

func hasSubsetSum(array: [Int], target: Int) -> Bool {
    if array.count == 0 {
        return false
    }
    
    if target - array[0] == 0 {
        return true
    }
    
    return hasSubsetSum(array: Array(array.dropFirst()), target: target - array[0]) ||
        hasSubsetSum(array: Array(array.dropFirst()), target: target)
}

let numbers = [1, 7, 4, 3, 10]
hasSubsetSum(array: numbers, target: 1)
hasSubsetSum(array: numbers, target: 17)
hasSubsetSum(array: numbers, target: 4)
hasSubsetSum(array: numbers, target: 80)

func findSubsetSum(array: [Int], target: Int) -> [Int]? {
    var subset = [Int]()
    return findSubsetSum(array: array, target: target, subset: &subset)
}

func findSubsetSum(array: [Int], target: Int, subset: inout [Int]) -> [Int]? {
    if array.count == 0 {
        return nil
    }
    
    if target - array[0] == 0 {
        return subset + [array[0]]
    }
    
    var includedInSubset = subset + [array[0]]
    let include = findSubsetSum(array: Array(array.dropFirst()), target: target - array[0], subset: &includedInSubset)
    let exclude = findSubsetSum(array: Array(array.dropFirst()), target: target, subset: &subset)
    
    if include != nil {
        return include
    } else if exclude != nil {
        return exclude
    } else {
        return nil
    }
}

findSubsetSum(array: numbers, target: 1)
findSubsetSum(array: numbers, target: 17)
findSubsetSum(array: numbers, target: 4)
findSubsetSum(array: numbers, target: 7)
findSubsetSum(array: numbers, target: 80)
