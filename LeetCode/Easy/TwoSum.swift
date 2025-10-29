//
//  TwoSum.swift
//  Source: LeetCode #1
//  Problem Statement: Given an array of integers, find the indices of the two numbers such that they add up to a target.
//  Tags: Array, Dictionary
//

//
// Given an array of integers, return the indices of the two numbers that sum up to the target value.
// Example: Input: [3,2,7,11,15], Target: 9 → Output: [1,2]


// MARK: - Approach 1: Brute Force
/// Check every pair of numbers to find the target sum.
/// - Time Complexity: O(n^2)
/// - Space Complexity: O(1)
///
func twoSumBruteForce(_ numbers: [Int], _ target: Int) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    
    for i in 0..<numbers.count {
        for j in (i+1)..<numbers.count {
            if numbers[i] + numbers[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

// MARK: - Approach 2: Two-pass Dictionary
/// First Pass: Create a map from numbers to index
/// Second Pass: for each element, check if (target - value)
/// - Time Complexity: O(n) (two passes, but still linear)
/// - Space Complexity: O(n)
///
func twoSumTwoPass(_ numbers: [Int], _ target: Int) -> [Int] {
    guard !numbers.isEmpty else {
        return []
    }
    
    var map: [Int: Int] = [:]
    
    // First pass: build map
    for (index, number) in numbers.enumerated() {
        map[number] = index
    }
    
    // Second pass: find complement
    for (index, number) in numbers.enumerated() {
        if let complementIndex = map[target - number],
           complementIndex != index { // Exclude the self
            return [index, complementIndex]
        }
    }
    return []
}

// MARK: - Approach 3: One-pass Dictionary (Optimal)
/// Build the map while iterating to find complement in one pass.
/// - Time Complexity: O(n)
/// - Space Complexity: O(n)
///
func twoSumOnePass(_ numbers: [Int], _ target: Int) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    
    var map: [Int: Int] = [:] // value -> index
    
    for (index, number) in numbers.enumerated() {
        if let complementIndex = map[number] {
            return [complementIndex, index]
        }
        map[target - number] = index
    }
    
    return []
}

// Example
let nums = [3, 2, 7, 11, 15]
let target = 9

print("Brute Force: \(twoSumBruteForce(nums, target))") // Output: [1, 2]
print ("Two-pass Dictionary: \(twoSumTwoPass(nums, target))") // Output: [1, 2]
print("One-pass Dictionary: \(twoSumOnePass(nums, target))") // Output: [1, 2]

let testCases: [(numbers: [Int], target: Int, description: String)] = [
    ([3, 2, 7, 11, 15], 9, "Normal case"),
    ([1, 3, 2, 4, 3], 6, "Multiple pairs"),
    ([], 5, "Empty array"),
    ([5], 5, "Single element"),
    ([2, 7], 9, "Two elements sum to target"),
    ([-3, 4, 2, 0, 7], 4, "Negative numbers"),
    ([0, 0, 3, 3], 0, "Zeros in array"),
    ([3, 3, 4, 5], 6, "Duplicate numbers"),
    ([1, 2, 3, 4], 10, "No solution")
]

for (numbers, target, description) in testCases {
    print("\nTest: \(description)")
    print("Input: \(numbers), Target: \(target)")
    print("Brute Force: \(twoSumBruteForce(numbers, target))")
    print("Two-pass Dictionary: \(twoSumTwoPass(numbers, target))")
    print("One-pass Dictionary: \(twoSumOnePass(numbers, target))")
}
