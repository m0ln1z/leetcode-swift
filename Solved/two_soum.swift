import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numToIndex = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let complementIndex = numToIndex[target - num] {
                return [complementIndex, index]
            }
            numToIndex[num] = index
        }
        
        return []
    }
}

let solution = Solution()
let nums1 = [2, 7, 11, 15]
let target1 = 9
print(solution.twoSum(nums1, target1))

let nums2 = [3, 2, 4]
let target2 = 6
print(solution.twoSum(nums2, target2))

let nums3 = [3, 3]
let target3 = 6
print(solution.twoSum(nums3, target3))
