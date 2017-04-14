
// TODO: Convert to using CountableRange<Int>


/// Partitions the array and returns the pivot index, `p`, such that:
///     `list[0...p]` are `<=` pivot
///     `list[p+1..< list.endIndex]` are `>` pivot
///
/// Uses the Lomuto partition scheme: simple, but not as efficient as others.
///
/// - Parameters:
///   - list: list to partition (in place)
///   - lo: start index of the subarray to be partitioned
///   - hi: end index of the subarray to be partitioned
/// - Returns: the pivot index
private func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
    let pivot = list[hi]
    var i = lo
    
    for j in lo ..< hi {
        if list[j] <= pivot {
            (list[i], list[j]) = (list[j], list[i])
            i += 1
        }
    }
    
    (list[i], list[hi]) = (list[hi], list[i])
    return i
}