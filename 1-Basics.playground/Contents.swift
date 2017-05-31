//: ## 1. The Basics

//: - Variables and constants

//:	let vs var
let someConstant = 10
var someVariable = 50
someVariable = 100
//: - Type inference
let apple = "🍎"
let orange = "🍊"

//:
let wifiPassword = "4875esubwireless"
var something = 20


//:		You don't always need to specify type

//: - Printing

//:		print or dump
//print(orange)
//print(apple)

struct Rectangle {
	let width: Double
	let height: Double
}

let rectangle = Rectangle(width: 20, height: 40)
//print(rectangle)
//dump(rectangle)
//: - Tuples

//:			Tuples are great
let (x,y) = ("Some string", 20)
//print((x,y))
//
//dump((x,y))
//
//print(x)
//print(y)
//print((x,y).0)
//: - Optionals

//:		An optional might be nil
let mightBeNil:String?

mightBeNil = "hello"

let anotherOptional: String?

anotherOptional = "world"

// THIS IS VERY VERY BAD!!!!!!!!!!!!!!!!!
let helloWorld = mightBeNil! + " " + anotherOptional!
//print(helloWorld)

//Some good options:

// Translation: If mightBeNil is not nil, then the variable unwrappedValue holds the value of mightBeNil but it is no longer an optional
// This is pretty good
//print(mightBeNil)
if
	let unwrappedValue = mightBeNil,
	let anotherUnwrappedValue = anotherOptional {

//		print(unwrappedValue + anotherUnwrappedValue)
}

// You can also use guard let

guard
	let unwrappedValue = mightBeNil,
	let anotherUnwrappedValue = anotherOptional else {
		fatalError("OH NO!!!")
}

print(unwrappedValue + " " + anotherUnwrappedValue)
//Now I can use the unwrapped values


// ALSO USUALLY BAD!
//Implicitly unwrapped Optionals

let thisIsDangerous: String!

//print(thisIsDangerous)

// Nil coalescing operator

let w: String? = nil

let defaultValue: String = w ?? "default"


//if w != nil {
//	defaultValue = w!
//} else {
//	defaultValue = "default"
//}

print(defaultValue)



//:		How to work with them

//:

//:		Implicitly unwrapped optional

//:

//:		Optional chaining
struct Room {
	let numberOfWalls: Int
	let numberOfToys: Int?
}

struct House {
	let room: Room?
	let kitchen: Int
}
let room = Room(numberOfWalls: 5, numberOfToys: 10)
let house = House(room: room, kitchen: 2)
print(house.room?.numberOfWalls)


//: ## 2. Operators

//:		There is no ++

//:

//: - Ternary operator

//:

//: - Nil coalescing operator

//:

//: - Range

//: ## 3. Strings

//: - Interpolation

//: - Concatenation

//:			Some examples of common string methods

//: ## 4. Collection Types

//: - Array

//: - Set

//: - Dictionary

//: ## 5. Control Flow

//: ## 6. Functions

//: ## 7. Closures

//: ## 8. Enumerations

//: ## 9. Classes and Structures... introduction to Protocols

//:	- Diffrences between classes and structs
go
//:		Value vs Reference Types

//: ## 10. Properties
