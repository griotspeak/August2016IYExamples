func pairStrings(left: String, right: String) -> (String, String) {
    return (left, right)
}

func pairInt(left: Int, right: Int) ->  (Int, Int) {
    return (left, right)
}

func pairDouble(left: Double, right: Double) -> (Double, Double) {
    return (left, right)
}
let foo : Optional<Int>
// So we write a snippet using < # # >? right?
//func pair<#Double#>(left: <#Double#>, right: <#Double#>) -> (<#Double#>, <#Double#>) {
//    return (left, right)
//}

func pair<Type>(left: Type, right: Type) -> (Type, Type) {
    return (left, right)
}
func pairPartTwo<TypeA, TypeB>(left: TypeA, right: TypeB) -> (TypeA, TypeB) {
    return (left, right)
}


let tuple = pair(left: "Jerome", right: "Morris")


func forLoop<List: Sequence>(over input: List, fn: (List.Iterator.Element) -> Void) {
    var theIterator = input.makeIterator()

    while let item = theIterator.next() {
        fn(item)
    }
}

forLoop(over: [1, 2, 3]) { (n) in
    print(n)
}


func identity<T>(input: T) -> T {
    return input
}
