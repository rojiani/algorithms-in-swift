//: Playground - noun: a place where people can play

import Cocoa

public func insertionSort<T: Comparable>(_ list: inout [T]) {
    guard list.count > 0 else { return }

    for i in 1 ..< list.endIndex {
        for j in stride(from: i - 1, through: 0, by: -1) {
            if list[j] <= list[j + 1] {
                break
            } else {
                swap(&list[j], &list[j + 1])
            }
        }
    }
}

var nums = [8, 2, 4, 7, 9, 1]
insertionSort(&nums)
