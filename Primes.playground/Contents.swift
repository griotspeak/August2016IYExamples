
func primes(upperBound: Int) -> [Int] {
    upperBound
    var possibilities = Array(2..<upperBound)
    var listOfPrimes: [Int] = []

    while let thisPrime = possibilities.first {
        listOfPrimes.append(thisPrime)

        //        possibilities = possibilities.filter { item in
        //            item % thisPrime != 0
        //        }

        var newPossibilities: [Int] = []
        for possible in possibilities where possible % thisPrime != 0 {
            newPossibilities.append(possible)
        }

        possibilities = newPossibilities

    }

    
    return listOfPrimes
}



print(primes(upperBound: 10))