
extension Array where Iterator.Element == Int {

    mutating func insert(value: Int) -> Bool
    {
        for i in 0..<self.count {
            if self[i] > value {
                self.insert(value, at: i)
                return true
            }
        }
        return false
    }
}

func runInsert()
{
    var arr: [Int] = [2, 15, 16, 17, 20, 23, 27, 30, 40, 50, 63]

    guard let val: Int = input("Value to insert") else {
        print("Invalid input")
        return
    }

    print("Array before:")
    print(arr)

    arr.insert(value: val)

    print("Array after:")
    print(arr)

}