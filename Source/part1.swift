
func fall(_ L: [Int]) -> [Int]
{
    let hæsta: Int = L.max()!
    var countL: [Int] = [Int](repeating: 0, count: hæsta+1)
    var resultL: [Int] = [Int](repeating: 0, count: L.count)

    for i in L {
        countL[i] += 1
    }

    var summa = 0
    for i in 0..<countL.count {
        summa += countL[i]
        countL[i] = summa
    }

    for i in 0..<L.count {
        resultL[countL[L[i]]-1] = L[i]
        countL[L[i]] -= 1
    }

    return resultL
}

func runPart1()
{
    let L = [7, 1, 8, 2, 5, 10, 8, 9, 3, 6, 1]
    print(fall(L))
}