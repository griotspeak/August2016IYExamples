struct Dog {
    var name: String = "Jim"
}

var dog1 = Dog()
var dog2 = dog1
dog2.name = "Fido"
dog1.name = "Rex"
print(dog1.name)
print(dog2.name)
