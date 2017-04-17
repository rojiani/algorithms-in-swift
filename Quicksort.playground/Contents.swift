//: QuickSort algorithm, using Lomuto partitioning scheme

// swiftlint:disable variable_name for_where

/// Sort array using basic quicksort implementation
///
/// - Parameter elements: the array to be sorted
func quickSort<T: Comparable>(_ elements: inout [T]) {
    quickSort(&elements, lo: 0, hi: elements.endIndex - 1)
}

/// Standard in-place quicksort algorithm, using Lomuto's partition scheme.
///
/// - Parameters:
///   - a: the array to sort
///   - lo: start index of the subarray to be partitioned
///   - hi: end index of the subarray to be partitioned
private func quickSort<T: Comparable>(_ a: inout [T], lo: Int, hi: Int) {
    guard lo < hi else {
        /* Base case: sublists with 0 or 1 elements */
        return
    }

    let pivot = partition(&a, lo: lo, hi: hi)

    quickSort(&a, lo: lo, hi: pivot - 1)
    quickSort(&a, lo: pivot + 1, hi: hi)
}

/// Partitions the array and returns the pivot index, `p`, such that:
///     `a[0...p]` are `<=` pivot
///     `a[p+1..< a.endIndex]` are `>` pivot
///
/// Uses the Lomuto partition scheme: simple, but not as efficient as others.
///
/// - Parameters:
///   - a: the array to partition
///   - lo: start index of the subarray to be partitioned
///   - hi: end index of the subarray to be partitioned
/// - Returns: the pivot index
private func partition<T: Comparable>(_ a: inout [T], lo: Int, hi: Int) -> Int {
    let pivot = a[hi]
    var i = lo

    for j in lo ..< hi {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }

    (a[i], a[hi]) = (a[hi], a[i])
    return i
}

var numbers = [5, 3, 2, 7, 9, 4, 2, 4, 8, 9, 14, 6, 4, 13, 8]
quickSort(&numbers)

var strings = ["Hello", "World", "Foo", "Bar"]
quickSort(&strings)
