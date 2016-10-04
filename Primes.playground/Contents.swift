
func primes(upperBound: Int) -> [Int] {
    upperBound
    var possibilities = Array(2..<upperBound)
    var listOfPrimes: [Int] = []

    while let thisPrime = possibilities.first {
        listOfPrimes.append(thisPrime)
        possibilities = possibilities.filter { item in
            item % thisPrime != 0
        }
    }

    return listOfPrimes
}



print(primes(upperBound: 30))


var array = [AnyObject]()
array.append(1)
array.append(2.0)
array.append("3")
array.append([4, 5, 6])
array.append([7: "7", 8: "8"])