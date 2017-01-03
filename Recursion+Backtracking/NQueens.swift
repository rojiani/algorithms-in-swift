import Foundation

// https://www.hackerearth.com/practice/basic-programming/recursion/recursion-and-backtracking/practice-problems/algorithm/n-queensrecursion-tutorial/
// https://en.wikipedia.org/wiki/Eight_queens_puzzle

// swiftlint:disable variable_name line_length

typealias Chessboard = [[Square]]

struct Square: CustomStringConvertible {
    let i: Int
    let j: Int

    var hasQueen: Bool

    init(i: Int, j: Int) {
        self.i = i
        self.j = j
        self.hasQueen = false
    }

    var description: String {
        return "(\(i), \(j))"
    }
}

func createBoard(ofSize n: Int) -> Chessboard {
    var board = [[Square]]()
    for i in 0 ..< n {
        let row = [Square]()
        board.append(row)
        for j in 0 ..< n {
            board[i].append(Square(i: i, j: j))
        }
    }
    return board
}

func squareIsAttacked(board: Chessboard, x: Int, y: Int) -> Bool {
    return rowIsAttacked(board: board, row: x)
        || columnIsAttacked(board: board, column: y)
        || primaryDiagonalAttacked(board: board, i: x, j: y)
        || secondaryDiagonalAttacked(board: board, i: x, j: y)
}

private func rowIsAttacked(board: Chessboard, row: Int) -> Bool {
    let n = board.count
    for j in 0 ..< n {
        if board[row][j].hasQueen {
            return true
        }
    }
    return false
}

private func columnIsAttacked(board: Chessboard, column: Int) -> Bool {
    let n = board.count
    for i in 0 ..< n {
        if board[i][column].hasQueen {
            return true
        }
    }
    return false
}

private func primaryDiagonalAttacked(board: Chessboard, i: Int, j: Int) -> Bool {
    let n = board.count
    let k = min(i, j)
    var x = i - k
    var y = j - k
    while x < n && y < n {
        if board[x][y].hasQueen {
            return true
        }
        x += 1
        y += 1
    }
    return false
}

private func secondaryDiagonalAttacked(board: Chessboard, i: Int, j: Int) -> Bool {
    let n = board.count
    var x = i
    var y = j
    // to bottom-left
    while x >= 0 && y < n {
        if board[x][y].hasQueen {
            return true
        }
        x -= 1
        y += 1
    }
    // to top-right
    x = i
    y = j
    while x < n && y >= 0 {
        if board[x][y].hasQueen {
            return true
        }
        x += 1
        y -= 1
    }
    return false
}

func printSolution(board: Chessboard) {
    let n = board.count
    var hasSolution = false
    var output = ""
    for i in 0 ..< n {
        for j in 0 ..< n {
            if board[i][j].hasQueen {
                output += "1 "
                hasSolution = true
            } else {
                output += "0 "
            }
        }
        output += "\n"
    }
    if !hasSolution {
        print("Not possible")
    } else {
        print(output)
    }
}

func solveNQueens(n: Int) {
    var board = createBoard(ofSize: n)
    solveNQueens(board: &board, queens: n)
    printSolution(board: board)
}

@discardableResult func solveNQueens(board: inout Chessboard, queens: Int) -> Bool {
    if queens == 0 {
        return true
    }
    let n = board.count
    for i in 0 ..< n {
        for j in 0 ..< n {
            if squareIsAttacked(board: board, x: i, y: j) {
                continue
            }
            board[i][j].hasQueen = true
            if solveNQueens(board: &board, queens: queens - 1) {
                return true
            } else { // backtrack
                board[i][j].hasQueen = false
            }
        }
    }
    return false
}

let n = Int(readLine(strippingNewline: true)!)!
solveNQueens(n: n)

// swiftlint:enable variable_name line_length
