import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count
        let n = nums2.count
        let totalLeft = (m + n + 1) / 2
        
        var left = 0
        var right = m
        
        while left <= right {
            let i = (left + right) / 2
            let j = totalLeft - i
            
            let nums1LeftMax = (i == 0) ? Int.min : nums1[i - 1]
            let nums1RightMin = (i == m) ? Int.max : nums1[i]
            let nums2LeftMax = (j == 0) ? Int.min : nums2[j - 1]
            let nums2RightMin = (j == n) ? Int.max : nums2[j]
            
            if nums1LeftMax <= nums2RightMin && nums2LeftMax <= nums1RightMin {
                if (m + n) % 2 == 1 {
                    return Double(max(nums1LeftMax, nums2LeftMax))
                } else {
                    return Double(max(nums1LeftMax, nums2LeftMax) + min(nums1RightMin, nums2RightMin)) / 2.0
                }
            } else if nums1LeftMax > nums2RightMin {
                right = i - 1
            } else {
                left = i + 1
            }
        }
        
        fatalError("Не отсортированы корректно")
    }
}

let solution = Solution()
let nums1 = [1, 3]
let nums2 = [2]
print("Медиана: \(solution.findMedianSortedArrays(nums1, nums2))")  

let nums1_2 = [1, 2]
let nums2_2 = [3, 4]
print("Медиана: \(solution.findMedianSortedArrays(nums1_2, nums2_2))")  
