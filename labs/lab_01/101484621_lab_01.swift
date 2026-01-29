// COMP 3097 - Lab 01
// 101484621
// Jayden Lewis

var x = "Hello, World!"
let y = 32

IT, Indiana Jones, ET, Jaws

func add(num_01 a:Int, num_02 b:Int)->Int{
	
	return a+b
}

print(add(num_01: 32, num_02: y))



func greetings(name:String){
	
	let greeting = "Hello, \(name) "
	print(greeting)
}

greetings( name: "Jayden")



func firstLastChecker(num: Int, arr: [Int]) -> String {

    if arr.count < 1 {
        return "Invalid array. It must have at least 1 element"
    }

    let isFirst = (num == arr[0])
    let isLast = (num == arr[arr.count - 1])

    switch (isFirst, isLast) {
    
	case (true, false):
        return "\(num) appears as the first element."
    
	case (false, true):
        return "\(num) appears as the last element."
    
	case (true, true):
        return "\(num) appears as both the first and last element."
    
	default:
        return "\(num) does not appear as the first or last element."
    }
}

print(firstLastChecker(num: 8, arr: [0, 1, 2, 3, 4, 5, 6, 7, 8]))



func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
    
    return touchingPowerUp || touchingSeed
}

print(score(touchingPowerUp: true, touchingSeed: true))
