//: [Previous](@previous)

import Foundation

struct Solution {
    
    private struct MatrixPos {
        let row:Int
        let column:Int
    }
    
    static func solution(_ matrix: [[Int]]) -> [[Int]] {
        
        var edgeBits = [MatrixPos]()
        
        //top row
        for i in stride(from: 1, to: matrix.first!.count - 1, by: 1) {
            if matrix.first![i] == 1 {
                edgeBits.append(MatrixPos(row: 0, column: i))
                
                var currentRow = 0
                while currentRow < matrix.count - 1 , matrix[currentRow + 1][i] == 1 {
                    edgeBits.append(MatrixPos(row: currentRow + 1, column: i))
                    currentRow += 1
                }
            }
        }
        
        //right column
        for i in stride(from: 1, to: matrix.count - 1, by: 1) {
            if matrix[i][matrix.first!.count - 1] == 1 {
                edgeBits.append(MatrixPos(row: i, column: matrix.count - 1))

                var currentColumn = matrix.count - 1
                while currentColumn > 0, matrix[i][currentColumn - 1] == 1 {
                    edgeBits.append(MatrixPos(row: i, column: currentColumn - 1))
                    currentColumn -= 1
                }
            }
        }
        
        //bottom row
        for i in stride(from: matrix.first!.count - 2, through: 1, by: -1) {
            if matrix.last![i] == 1 {
                edgeBits.append(MatrixPos(row: matrix.count - 1, column: i))

                var currentRow = matrix.count - 1
                while currentRow > 0 , matrix[i][currentRow - 1] == 1 {
                    edgeBits.append(MatrixPos(row: i, column: currentRow - 1))
                    currentRow -= 1
                }
            }
        }
    
        //left column
        for i in stride(from: matrix.count - 2, through: 1, by: -1) {
            if matrix[i][0] == 1 {
                edgeBits.append(MatrixPos(row: i, column: 0))

                var currentColumn = 0
                while currentColumn < matrix.count - 1, matrix[i][currentColumn + 1] == 1 {
                    edgeBits.append(MatrixPos(row: i, column: currentColumn + 1))
                    currentColumn += 1
                }
            }
        }
        
        for row in 1..<matrix.first!.count - 1 {
            for col in 1..<matrix.count - 1 {
                let currentBlock = MatrixPos(row: row, column: col)
                let topBlock = MatrixPos(row: row + 1, column: col)
                let rightBlock = MatrixPos(row: row, column: col + 1)
                let leftBlock = MatrixPos(row: row, column: col - 1)
                let bottomBlock = MatrixPos(row: row - 1, column: col)
                
                if matrix[row][col] == 1, !edgeBits.contains(where: { $0.row == currentBlock.row && $0.column == currentBlock.column }) {
                    if edgeBits.contains(where: { $0.row == topBlock.row && $0.column == topBlock.column })
                        || edgeBits.contains(where: { $0.row == rightBlock.row && $0.column == rightBlock.column })
                        || edgeBits.contains(where: { $0.row == leftBlock.row && $0.column == leftBlock.column })
                        || edgeBits.contains(where: { $0.row == bottomBlock.row && $0.column == bottomBlock.column }) {
                        edgeBits.append(currentBlock)
                    }
                }
            }
        }
        var emptyMatrix = Array(repeating: Array(repeating: 0, count: matrix.first!.count), count: matrix.count)
        for edgeBit in edgeBits {
            emptyMatrix[edgeBit.row][edgeBit.column] = 1
        }
        emptyMatrix[0][0] = matrix[0][0]
        emptyMatrix[0][matrix.count - 1] = matrix[0][matrix.count - 1]
        emptyMatrix[matrix.first!.count - 1][0] = matrix[matrix.first!.count - 1][0]
        emptyMatrix[matrix.first!.count - 1][matrix.count - 1] = matrix[matrix.first!.count - 1][matrix.count - 1]
        
        return emptyMatrix
    }
    
    static func printMatrix(_ matrix: [[Int]]) {
        for row in 0..<matrix.first!.count {
            var rowString = ""
            for col in 0..<matrix.count {
                rowString.append("| \(matrix[row][col]) |")
            }
            print(rowString)
        }
        print("\n")
    }
    
}

let matrix = [
                [1,0,0,0,0,0],
                [0,1,0,1,1,1],
                [0,0,1,0,1,0],
                [1,1,0,0,1,0],
                [1,0,1,1,0,0],
                [1,0,0,0,0,1]
             ]


import XCTest

class SolutionTests: XCTestCase {

    func test() {
        Solution.printMatrix(matrix)
        XCTAssert(Solution.solution(matrix) == [
            [1,0,0,0,0,0],
            [0,0,0,1,1,1],
            [0,0,0,0,1,0],
            [1,1,0,0,1,0],
            [1,0,0,0,0,0],
            [1,0,0,0,0,1]
        ])
        
        Solution.printMatrix(Solution.solution(matrix))
    }
}

SolutionTests.defaultTestSuite.run()
