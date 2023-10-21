import UIKit

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
 
 Write a function:
 public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
 that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of
 integers representing the values of the counters.
 Result array should be returned as an array of integers.
 For example, given:
 A[0] = 3, A[1] = 4, A[2] = 4, A[3] = 6, A[4] = 1, A[5] = 4, A[6] = 4
 the function should return [3, 2, 2, 4, 2], as explained above.
 Write an efficient algorithm for the following assumptions:
 • N and M are integers within the range [1..100,000];
 • each element of array A is an integer within the range [1..N + 1].
 */

//MARK: - Task2 - Solution
public func solution(_ N: Int, _ A: inout [Int]) -> [Int] {
    var counters = Array(repeating: 0, count: N)
    var maxCounter = 0
    var lastMaxCounterOperation = 0
    
    for num in A {
        if num <= N {
            let counterIndex = num - 1
            counters[counterIndex] += 1
            maxCounter = max(maxCounter, counters[counterIndex])
        } else if num == N + 1 {
            if lastMaxCounterOperation < maxCounter {
                for i in 0..<counters.count {
                    counters[i] = maxCounter
                }
                lastMaxCounterOperation = maxCounter
            }
        }
    }

    for i in 0..<counters.count {
        if counters[i] < lastMaxCounterOperation {
            counters[i] = lastMaxCounterOperation
        }
    }
    return counters
}
var n = 5
var a = [3, 4, 4, 6, 1, 4, 4]
let returnedArray = solution(n, &a)

print("The returned array is \(returnedArray)")
