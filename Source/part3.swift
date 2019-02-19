
func binarySearch(list: [Int], value: Int, startIndex: Int = 0) -> Int?
{
    guard list.count > 0 else {
        return nil
    }
    let center = list.count / 2
    if list[center] == value {
        return center + startIndex + 1
    } else if list[center] < value {
        return binarySearch(list: Array(list[center...]), value: value, startIndex: startIndex + center)
    } else {
        return binarySearch(list: Array(list[0..<center]), value: value, startIndex: startIndex)
    }
}

func runBinarySearch()
{
    let arr: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]

    guard let val: Int = input("Element to find") else {
        print("Invalid input")
        return
    }

    if let result = binarySearch(list: arr, value: val) {
        print("Found at: \(result)")
    } else {
        print("Not found")
    }
}