
import UIKit

//MARK: - Task1 - Question
/*
 Find the missing element in a given permutation.

 An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)],
 which means that exactly one element is missing.
 Your goal is to find that missing element.
 Write a function:
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A, returns the value of the missing element.

 For example, given array A such that:
 A[0] = 2 A[1] = 3 A[2] = 1 A[3] = 5
 the function should return 4, as it is the missing element.

 Write an efficient algorithm for the following assumptions:
 • N is an integer within the range [0..100,000];
 • the elements of A are all distinct;
 • each element of array A is an integer within the range [1..(N + 1)].
 */

//MARK: - Task1 - Solution

public func solution(_ A: inout [Int]) -> Int {
    let n = A.count
    let expectedSum = (n + 1) * (n + 2) / 2
                      // 5    *     6    /2 = 15
    var actualSum = 0
    for num in A {
        actualSum += num
         //  10 15  22 31
    }
    
    let missingNum =  expectedSum - actualSum
                      // 15 - 11 = 4
                      // 15 - 31 = - 16
    return missingNum
}

//var A = [2,3,1,5] // 4
 var A = [10 , 5 , 7 , 9] // 16
let missingNum = solution(&A)
print("The missing number is \(missingNum)")
