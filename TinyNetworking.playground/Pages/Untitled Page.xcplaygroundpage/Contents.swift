let list1 = [0, 1, 2]
let list2 = [3, 4, 5]
let list3 = [6, 7, 8]

let lists = [list1, list2, list3]
let flattened = lists.flatMap {
    $0
}

func onlyIfEven(input: Int) -> Int? {
    if input % 2 == 0 {
        return input
    } else {
        return nil
    }
}


guard events.count == jsonObject.count else {
    self = .failure("fahsdlkjfhasdlkjfash")
    return
}

let result1: [Int?]  = list1.map { num -> Int? in
    return onlyIfEven(input: num)
}

let result_1: [Int] = list1.flatMap { num -> Int? in
    return onlyIfEven(input: num)
}


print(result1)

flattened.flatMap {
    $0 % 2 == 0 ? $0 : nil
}
