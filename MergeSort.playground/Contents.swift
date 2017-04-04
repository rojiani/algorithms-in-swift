//: Playground - noun: a place where people can play

import UIKit

// swiftlint:disable identifier_name

func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
    if list.count <= 1 {
        return list
    }

    let midIndex = list.count / 2
    return merge(left: mergeSort([T](list[0 ..< midIndex])),
                 right: mergeSort([T](list[midIndex ..< list.endIndex])))
    /* or:
      let sortedLeft = mergeSort([T](list[0 ..< midIndex]))
      let sortedRight = mergeSort([T](list[midIndex ..< list.endIndex]))
      return merge(left: sortedLeft, right: sortedRight)
    */
}

private func merge<T: Comparable>(left leftHalf: [T], right rightHalf: [T]) -> [T] {
    var leftIndex = leftHalf.indices.lowerBound
    let leftEndIndex = leftHalf.indices.upperBound
    var rightIndex = rightHalf.indices.lowerBound
    let rightEndIndex = rightHalf.indices.upperBound

    var merged = [T]()
    merged.reserveCapacity(leftHalf.count + rightHalf.count)

    while leftIndex < leftEndIndex && rightIndex < rightEndIndex {
        if leftHalf[leftIndex] <= rightHalf[rightIndex] {
            merged.append(leftHalf[leftIndex])
            leftIndex = leftIndex.advanced(by: 1)
        } else {
            merged.append(rightHalf[rightIndex])
            rightIndex = rightIndex.advanced(by: 1)
        }
    }
    // merge remaining
    if leftIndex < leftEndIndex {
        merged.append(contentsOf: Array(leftHalf[leftIndex ..< leftEndIndex]))
    } else if rightIndex < rightEndIndex {
        merged.append(contentsOf: Array(rightHalf[rightIndex ..< rightEndIndex]))
    }

    return merged
}

let l: [Int] = [1, 3, 9, 11, 99]
let r: [Int] = [2, 4, 8, 12, 100]
let merged = merge(left: l, right: r)

let list = [99, 100, 107, 77, 22, 8, 9, 1, 50, 1000]
let sorted = mergeSort(list)
