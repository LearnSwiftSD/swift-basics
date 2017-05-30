
//: Playground - noun: a place where people can play

import GLKit


    var s = "Hello, playground"

    let i = 123
    s = "\(i)"
    s = String(i)












//extension Int {
//    var stringValue: String {
//        return String(self)
//    }
//    var hexValue: String {
//        return String(format: "%X", self)
//    }
//}

//    s = i.stringValue
//    s = i.hexValue

// Note how the Swift editor helps

// A literal also has a class

//    s = 123456.hexValue



//    var d = 100.0/3.0
//    s = String(d)





//extension Double {
//    var stringValue0 : String {
//        return String(format: "%.00f", self)
//    }
//    var stringValue1 : String {
//        return String(format: "%.01f", self)
//    }
//    func stringValue(_ precision: Int) -> String {
//        let f = "%.0\(precision)f"
//        return String(format: f, self)
//    }
//    var radianValue: Double {
//        return Double(GLKMathDegreesToRadians(Float(self)))
//    }
//}

//    s = d.stringValue0
//    s = d.stringValue1
//    s = d.stringValue(5)
//    var r = d.radianValue
//    r = 90.0.radianValue

// Again note how the editor helps






//extension String {
//    
//    var length: Int {
//        let length = self.lengthOfBytes(using: String.Encoding.utf8)
//        return length
//    }
//    
//    // Add underlining to text string, delimited by "_".
//    var underlineText : NSAttributedString {
//        let parts = self.components(separatedBy: "_")
//        let attributedText: NSMutableAttributedString = NSMutableAttributedString(string: "")
//        var underlineNow = false
//        
//        for i in 0..<parts.count {
//            var text: NSAttributedString
//            if underlineNow {
//                text =  NSAttributedString(string: parts[i],
//                    attributes: [NSUnderlineStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue])
//            } else {
//                text = NSAttributedString(string: parts[i])
//            }
//            attributedText.append(text)
//            underlineNow = !underlineNow
//        }
//        return attributedText
//    }
//}

//    s = "Underline _this_ and _this_"
//    let len = s.length
//    let a = s.underlineText









//extension UILabel {
//    func underlineText() {
//        self.attributedText = self.text!.underlineText
//    }
//}
//
//    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//    label.text = "Underline _this_ and _this_"
//    label.underlineText()








// Note the use of default values for optional arguments
// Note the type of onCompletion

//extension UIView {
//    // Fade in this view
//    func fadeIn(duration: Double = 0.75,
//                delay: Double = 0.0,
//                alpha: CGFloat = 1,
//                onCompletion: (()->())? = nil) {
//        // May already be visible with nonzero alpha
//        if !self.isHidden && self.alpha > 0 {
//            onCompletion?()
//        } else {
//            self.isHidden = false
//            self.alpha = 0
//            UIView.animate(
//                withDuration: duration,
//                delay: delay,
//                options: UIViewAnimationOptions.curveEaseOut,
//                animations: {
//                    self.alpha = alpha
//            }) { finishied in
//                self.alpha = alpha
//                onCompletion?()
//            }
//        }
//    }
//}
//
//    label.isHidden = true

//    label.fadeIn(duration: 5.0, onCompletion: {
//        print("on completion label.isHidden: \(label.isHidden)")
//    })

//    label.fadeIn(duration: 5.0) {
//        print("on completion label.isHidden: \(label.isHidden)")
//    }


