
class Node {
    let number: Int

    var leftBranch: Node?
    var rightBranch: Node?

    init(number: Int, leftBranch: Node? = nil, rightBranch: Node? = nil)
    {
        self.number = number
        self.leftBranch = leftBranch
        self.rightBranch = rightBranch
    }

    func insert(number: Int) -> Bool
    {
        guard number != self.number else {
            return false
        }

        if self.number > number {
            if var left = self.leftBranch {
                return left.insert(number: number)
            } else {
                self.leftBranch = Node(number: number)
                return true
            }
        } else {
            if var right = self.rightBranch {
                return right.insert(number: number)
            } else {
                self.rightBranch = Node(number: number)
                return true
            }
        }
    }

    func find(number: Int) -> Bool
    {
        if self.number == number {
            return true
        } else if self.number > number {
            guard let left = self.leftBranch else {
                return false
            }
            return left.find(number: number)
        } else {
            guard let right = self.rightBranch else {
                return false
            }
            return right.find(number: number)
        }
    }

    func addToPrintList(printList: inout [[Int]], level: Int = 0)
    {
        if printList.count < level + 1 {
            printList.append([])
        }
        printList[level].append(self.number)

        if let left = self.leftBranch {
            left.addToPrintList(printList: &printList, level: level+1)
        }
        if let right = self.rightBranch {
            right.addToPrintList(printList: &printList, level: level+1)
        }
    }
}

class Tree {

    var root: Node? = nil

    func insert(number: Int) -> Bool
    {
        guard var r = root else {
            root = Node(number: number)
            return true
        }
        
        return r.insert(number: number)
    }

    func find(number: Int) -> Bool
    {
        guard let r = root else {
            return false
        }
        return r.find(number: number)
    }

    func printTree()
    {
        guard let r = root else {
            print("Failed to print, no root defined")
            return
        }
        var printList: [[Int]] = []
        r.addToPrintList(printList: &printList)

        for r in printList {
            for i in r {
                print(i, terminator: "   ")
            }
            print()
        }
    }

}

func runTreeSearch()
{
    let t = Tree()
    t.insert(number: 6)
    t.insert(number: 2)
    t.insert(number: 3)
    t.insert(number: 1)
    guard let val: Int = input("Element to find") else {
        print("Invalid input")
        return
    }
    print("Find status \(t.find(number: val))")
    t.printTree()
}