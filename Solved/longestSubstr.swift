class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var left = 0
        var charIndexMap = [Int](repeating: -1, count: 128) 

        for (right, char) in s.enumerated() {
            let asciiValue = Int(char.asciiValue!) 
            
            if charIndexMap[asciiValue] >= left {
                left = charIndexMap[asciiValue] + 1
            }
            
            charIndexMap[asciiValue] = right
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}
