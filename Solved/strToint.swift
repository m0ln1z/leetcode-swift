class Solution {
    func myAtoi(_ s: String) -> Int {
        let maxInt = Int32.max
        let minInt = Int32.min
        var index = s.startIndex
        var sign = 1
        var result: Int32 = 0

        while index < s.endIndex && s[index] == " " {
            index = s.index(after: index)
        }

        if index < s.endIndex {
            if s[index] == "-" {
                sign = -1
                index = s.index(after: index)
            } else if s[index] == "+" {
                index = s.index(after: index)
            }
        }

        while index < s.endIndex, let digitValue = s[index].wholeNumberValue {
            if result > (maxInt - Int32(digitValue)) / 10 {
                return sign == 1 ? Int(maxInt) : Int(minInt)
            }
            result = result * 10 + Int32(digitValue)
            index = s.index(after: index)
        }

        return Int(result) * sign
    }
}
