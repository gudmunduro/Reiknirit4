
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

    func find()
    {
        
    }

    /*func print() -> [() -> [() -> Void]]
    {
        let printList: [() -> Void] = []
        if let left = self.leftBranch {
            print(left.number)
            printList.append(left.print)
        }
        if let right = self.rightBranch {
            print(right.number)
            printList.append(left.print)
        }
        return printList
    }*/
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

    func find(number: Int) -> Node
    {
        return Node(number: 0)
    }

    /*func print()
    {
        guard let r = root else {
            root = Node(number: number)
            return true
        }
        var printFuncs: [() -> Void] = [ root.print ]
        while printFuncs.count != 0 {
            var oldPrintFuncs = printFuncs
            printFuncs = []
            for p in oldPrintFuncs {
                printFuncs += p()
            }
        }
    }*/

}

func runTreeSearch()
{
    let t = Tree()
    t.insert(number: 6)
    t.insert(number: 2)
    t.insert(number: 3)
}