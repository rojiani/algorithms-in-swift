//: Playground - noun: a place where people can play

import UIKit

/// Reverses the elements in an array (using recursion)
///
/// - Parameter array: array of Int
/// - Returns: an array with the elements in reverse order.
func reverse(array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return []
    }

    if array.count == 1 {
        return [array[0]]
    }

    return reverse(array: Array(array.dropFirst())) + [array[0]]
}

reverse(array: [1, 2, 3, 4])
