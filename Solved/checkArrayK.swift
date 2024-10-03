class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        var remainderCount = Array(repeating: 0, count: k)
        
        for num in arr {
            let remainder = ((num % k) + k) % k
            remainderCount[remainder] += 1
        }
        
        if remainderCount[0] % 2 != 0 {
            return false
        }
        
        for i in 1..<((k + 1) / 2) {
            if remainderCount[i] != remainderCount[k - i] {
                return false
            }
        }
        
        return true
    }
}

let solution = Solution()
print(solution.canArrange([1, 2, 3, 4, 5, 10, 6, 7, 8, 9], 5)) 
print(solution.canArrange([1, 2, 3, 4, 5, 6], 7)) 
print(solution.canArrange([1, 2, 3, 4, 5, 6], 10)) 
