class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = [
            "I": 1 , "V": 5, "X": 10, "L": 50,
            "C": 100, "D": 500 , "M": 1000
        ]
        var result = 0
        let chars = Array(s)
        
        for i in 0..<chars.count {
            let currentValue = roman[chars[i]]!

            if i < chars.count - 1 && currentValue < roman[chars[i + 1]]! {
                result -= currentValue
            } else {
                result += currentValue
            }
        }
        return result
    }
}