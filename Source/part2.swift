import Foundation

func linearSearch(list: [Int], value: Int) -> Int?
{
    var index: Int? = nil
    let len4 = list.count / 4
    var startPos = 0
    let group = DispatchGroup()
    group.enter()
    for i in 0..<4 {
        let currentStartpos = startPos
        DispatchQueue.global().async {
            for i in currentStartpos..<currentStartpos + len4 {
                if index != nil {
                    return
                }
                if list[i] == value {
                    index = i
                    group.leave()
                    return
                }
            }
        }
        startPos += len4
    }
    group.wait()
    return index
}

func slowLinearSearch(list: [Int], value: Int) -> Int?
{
    for i in 0..<list.count {
        if list[i] == value {
            return i
        }
    }
    return nil
}

func runLinearSearch()
{
    var list = [5, 6, 16, 5, 3, 12, 8, 5, 22, 3, 1, 89, 4]
    print("Filling list")
    for i in 0...1000 {
        list.append(i)
    }
    print("List filled")

    guard let val: Int = input("Element to find") else {
        print("Invalid input")
        return
    }

    print("Single-threaded")

    if let index = slowLinearSearch(list: list, value: val) {
        print("Found \(index)")
    } else {
        print("Not found")
    }

    print("")
    print("Multi-threaded")

    if let index = linearSearch(list: list, value: val) {
        print("Found: \(index)")
    } else {
        print("Not found")
    }
}