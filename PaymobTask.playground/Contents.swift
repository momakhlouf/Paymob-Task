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

//var A = [2,3,1,5]
 var A = [10 , 5 , 7 , 9]
let missingNum = solution(&A)
print("The missing number is \(missingNum)")


//MARK: - Task2 - Question
/*
Find the missing element in a given permutation.
You are given N counters, initially set to 0, and you have two possible operations on them:
• increase(X) − counter X is increased by 1,
• max counter − all counters are set to the maximum value of any counter.
A non-empty array A of M integers is given. This array represents consecutive operations:
• if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
• if A[K] = N + 1 then operation K is max counter.
For example, given integer N = 5 and array A such that:
A[0] = 3 A[1] = 4 A[2] = 4 A[3] = 6 A[4] = 1 A[5] = 4 A[6] = 4
the values of the counters after each consecutive operation will be:
(0, 0, 1, 0, 0)
(0, 0, 1, 1, 0)
(0, 0, 1, 2, 0)
(2, 2, 2, 2, 2)
(3, 2, 2, 2, 2)
(3, 2, 2, 3, 2)
(3, 2, 2, 4, 2)
The goal is to calculate the value of every counter after all operations.
*/

//MARK: - Task2 - Solution

public func calculateCounters(_ N: Int, _ A: [Int]) -> [Int] {
    var counters = Array(repeating: 0, count: N)
    var maxCounter = 0
    var lastMaxCounterUpdate = 0
    
    for operation in A {
        if operation >= 1 && operation <= N {
            let index = operation - 1
            counters[index] = max(counters[index], lastMaxCounterUpdate) + 1
            maxCounter = max(maxCounter, counters[index])
        } else if operation == N + 1 {
            lastMaxCounterUpdate = maxCounter
        }
    }
    
    for index in 0..<N {
        counters[index] = max(counters[index], lastMaxCounterUpdate)
    }
    
    return counters
}

// Example usage:
let N = 5
let A = [3, 4, 4, 6, 1, 4, 4]
let finalCounters = calculateCounters(N, A)
print("Final counters:", finalCounters)
