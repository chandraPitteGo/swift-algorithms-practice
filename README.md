# 🧠 Swift Algorithms Practice — Solve Data Structures & Algorithm Problems in Swift


A curated collection of algorithm and data structure problem solutions, implemented in Swift.
This repository is designed for:
- Swift developers preparing for coding interviews
- Anyone looking to sharpen algorithmic thinking with practical Swift examples
Each folder contains clearly named solutions ─ e.g. `LeetCode/Easy/TwoSum.swift`.
Feel free to explore, learn, and contribute!

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
