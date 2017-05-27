import Foundation

struct RectangleStruct {
	var length: Double
	var width: Double
}

class RectangleClass {
	var length: Double
	var width: Double

	init(length: Double, width: Double) {
		self.length = length
		self.width = width
	}
}

var rectangleStruct1 = RectangleStruct(length: 40.0, width: 40.0) {
	willSet {
		print("Changed rectangleStruct1 to \(newValue)")
	}
	didSet {
		print("from \(oldValue)")
	}
}

var rectangleClass1 = RectangleClass(length: 40.0, width: 40.0) {
	willSet {
		print("Changed rectangleStruct1 to \(newValue)")
	}
	didSet {
		print("from \(oldValue)")
	}
}

//var rectangleStruct2 = rectangleStruct1
//
//let rectangleClass2 = rectangleClass1
//
//rectangleClass2.length = 20.0
//
//rectangleClass1.length
//
//rectangleStruct2.length = 20.0
//
//rectangleStruct1.length

rectangleStruct1.length = 20.0
rectangleStruct1.width = 10.0

rectangleClass1.length = 20.0
rectangleClass1.width = 5
