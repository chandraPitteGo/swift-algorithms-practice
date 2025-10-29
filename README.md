# 🧠 Swift Algorithms Practice

A collection of algorithm problems solved in **Swift**.
This repository is intended for practicing data structures and algorithms, and to help others preparing for coding interviews in Swift.

---

## 💡 Example Problem

**File:** `LeetCode/Easy/TwoSum.swift`

```swift
//
//  TwoSum.swift
//  Source: LeetCode #1
//
//  Problem:
//  Given an array of integers, return indices of the two numbers
//  such that they add up to a specific target.
//
//  Complexity: Time O(n), Space O(n)
//  Tags: Array, Hash Table
//

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let j = dict[target - num] {
                return [j, i]
            }
            dict[num] = i
        }
        return []
    }
}
