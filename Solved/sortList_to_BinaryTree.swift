class Solution {
    var head: ListNode?

    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        self.head = head
        let size = getSize(head)
        return sortedListToBSTHelper(0, size - 1)
    }

    private func getSize(_ node: ListNode?) -> Int {
        var size = 0
        var current = node
        while current != nil {
            size += 1
            current = current?.next
        }
        return size
    }

    private func sortedListToBSTHelper(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let mid = (left + right) / 2
        
        let leftChild = sortedListToBSTHelper(left, mid - 1)

        let root = TreeNode(head!.val)
        root.left = leftChild

        head = head?.next

        root.right = sortedListToBSTHelper(mid + 1, right)
        return root
    }
}
