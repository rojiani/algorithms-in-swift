//: Playground - noun: a place where people can play

import UIKit

// swiftlint:disable variable_name

/// Binary Search
///
/// - Parameters:
///   - a: a sorted array of Comparable elements
///   - key: search key
/// - Returns: The index (as an Int) location of the element (if present in the array)
/// - Precondition: The array is sorted (if it is not, Complexity is O(n))
/// - Complexity: O(log n)
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    return binarySearch(a, key: key, range: a.startIndex ..< a.endIndex)
}

private func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    //print("range: [\(range.lowerBound), \(range.upperBound))")
    guard !range.isEmpty else {
        return nil
    }

    let mid = (range.lowerBound + range.upperBound) / 2

    if key < a[mid] {
        return binarySearch(a, key: key, range: range.lowerBound ..< mid)
    } else if key > a[mid] {
        return binarySearch(a, key: key, range: mid + 1 ..< range.upperBound)
    } else {
        return mid
    }
}

var nums = [Int]()
for i in 0...100 {
    nums.append(i)
}

binarySearch(nums, key: 50)
binarySearch(nums, key: 49)

var nums2 = [Int]()
for i in 0...9 {
    nums2.append(i)
}
binarySearch(nums2, key: 49)
binarySearch(nums2, key: 9)
binarySearch(nums2, key: 7)

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, key: 43, range: 0 ..< numbers.count)  // => 13

// swiftlint:enable variable_name
