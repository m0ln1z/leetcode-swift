import Foundation

class CustomStack {
    private var stack: [Int]
    private var maxSize: Int
    private var increments: [Int]

    init(_ maxSize: Int) {
        self.maxSize = maxSize
        self.stack = []
        self.increments = Array(repeating: 0, count: maxSize)
    }
    
    func push(_ x: Int) {
        if stack.count < maxSize {
            stack.append(x)
        }
    }
    
    func pop() -> Int {
        guard !stack.isEmpty else { return -1 }
        let index = stack.count - 1
        let value = stack[index] + increments[index]
        stack.removeLast()
        
        if index > 0 {
            increments[index - 1] += increments[index]
        }
        
        increments[index] = 0
        
        return value
    }
    
    func increment(_ k: Int, _ val: Int) {
        let effectiveK = min(k, stack.count)
        if effectiveK > 0 {
            increments[effectiveK - 1] += val
        }
    }
}

let customStack = CustomStack(3)
customStack.push(1)
customStack.push(2)
print(customStack.pop())
customStack.push(2)
customStack.push(3)
customStack.push(4)
customStack.increment(5, 100)
customStack.increment(2, 100)
print(customStack.pop())
print(customStack.pop())
print(customStack.pop())
print(customStack.pop())
