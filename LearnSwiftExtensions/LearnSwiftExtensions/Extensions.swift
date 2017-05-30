//
//  Extensions.swift
//  LearnSwiftExtensions
//
//  Created by John Van Roekel on 5/28/17.
//  Copyright © 2017 John Van Roekel. All rights reserved.
//

import Foundation
import GLKit
import CoreMotion


extension Double {
    var fractionValue: Double {
        return self.truncatingRemainder(dividingBy: 1.0)
    }
    var radianValue: Double {
        return Double(GLKMathDegreesToRadians(Float(self)))
    }
    var degreeValue: Double {
        return Double(GLKMathRadiansToDegrees(Float(self)))
    }
    var degreeString: String {
        return self.degreeValue.stringValue2
    }
    var signOf: Double {
        return self < 0 ? -1.0 : 1.0
    }
    var stringValue: String {
        let s1 = NSString(format: "%f", self)
        var s2 = s1.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
        if s2 == "." {
            s2 = "0"
        }
        return s2
    }
    var stringValue0: String {
        let s1 = NSString(format: "%.00f", self)
        return s1 as String
    }
    var stringValue1: String {
        let s1 = NSString(format: "%.01f", self)
        return s1 as String
    }
    var stringValue2: String {
        let s1 = NSString(format: "%.02f", self)
        return s1 as String
    }
    var stringValue3: String {
        let s1 = NSString(format: "%.03f", self)
        return s1 as String
    }
    var stringValue4: String {
        let s1 = NSString(format: "%.04f", self)
        return s1 as String
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self)
    }
    func isSignificant(_ precision: Double) -> Bool {
        return abs(self) > precision
    }
    func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
    var nanoValue: Int64 {
        return Int64(Double(NSEC_PER_SEC) * self)
    }
    var unsignedNanoValue: UInt64 {
        return UInt64(Double(NSEC_PER_SEC) * self)
    }
    var delayDispatchTimeValue: DispatchTime {
        return DispatchTime.now() + Double(self.nanoValue) / Double(NSEC_PER_SEC)
    }
    var delayDispatchTimeIntervalMS: DispatchTimeInterval {
        return DispatchTimeInterval.milliseconds(Int(self/1000.0))
    }
    func inRange(_ minValue: Double, _ maxValue: Double) -> Double {
        let value = min(max(self, minValue), maxValue)
        return value
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    var intValue: Int {
        if self == "" {
            return 0
        }
        return Int((self as NSString).intValue)
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self.floatValue)
    }
    var utf8DataValue: Data {
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)!
        return data
    }
    func contains(_ target: String) -> Bool {
        return (self as NSString).contains(target)
    }
    var uicolorValue: UIColor {
        let values = self.components(separatedBy: ",")
        let red = values[0].cgfloatValue
        let green = values[1].cgfloatValue
        let blue = values[2].cgfloatValue
        let alpha = values.count < 4 ? 1.0 : values[3].cgfloatValue
        let uicolor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return uicolor
    }
    var length: Int {
        let length = self.lengthOfBytes(using: String.Encoding.utf8)
        return length
    }
    func appendedString(_ string: String) -> String {
        var value = self
        value.append(string)
        return value
    }
    
    // Add underlining to text string, delimited by "_".
    var underlineText: NSAttributedString {
        // Split into parts. Underline the odd numbered ones.
        let parts = self.components(separatedBy: "_")
        let attributedText: NSMutableAttributedString = NSMutableAttributedString(string: "")
        var underlineNow = false
        
        for i in 0..<parts.count {
            var text: NSAttributedString
            if underlineNow {
                text =  NSAttributedString(string: parts[i],
                    attributes: [NSUnderlineStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue])
            } else {
                text = NSAttributedString(string: parts[i])
            }
            attributedText.append(text)
            underlineNow = !underlineNow
        }
        return attributedText
    }
}

extension UILabel {
    /// Add underlining
    func underlineText() {
        self.attributedText = self.text!.underlineText
    }
}

extension UIView {
    // Fade in this view
    func fadeIn(delay: Double = 0.0,
                duration: Double = 0.75,
                alpha: CGFloat = 1,
                onCompletion: (() -> ())? = nil) {
        // May already be visible with nonzero alpha
        if !self.isHidden && self.alpha > 0 {
            if onCompletion != nil {
                onCompletion!()
            }
        } else {
            self.isHidden = false
            self.alpha = 0
            UIView.animate(
                withDuration: duration,
                delay: delay,
                options: UIViewAnimationOptions.curveEaseOut,
                animations: {
                    self.alpha = alpha
            }, completion: { finishied in
                self.alpha = alpha
                if onCompletion != nil {
                    onCompletion!()
                }
            }
            )
        }
    }
    
    // Flash a UIView (e.g. button or label) by expanding and contracting it
    func flash(delay: Double, duration: Double, count: Double = 1.0, scale: Double = 1.15) {
        
        var flashDelay = delay
        let flashDuration = duration / count
        
        // Initial transform is no change
        self.transform = CGAffineTransform.identity
        // Expanded view transform
        let flashTransform = CGAffineTransform(scaleX: CGFloat(scale), y: CGFloat(scale))
        
        for _ in 1...Int(count) {
            UIView.animate(
                withDuration: flashDuration/2.0,
                delay: flashDelay,
                options: UIViewAnimationOptions(),
                animations: {
                    self.transform = flashTransform
            },
                completion: { (finished)->Void in
                    if !finished {
                        self.transform = flashTransform
                    }
            }
            )
            UIView.animate(
                withDuration: flashDuration/2.0,
                delay: flashDelay + flashDuration/2.0,
                options:
                UIViewAnimationOptions(),
                animations: {
                    self.transform = CGAffineTransform.identity
            },
                completion: { (finished)->Void in
                    if !finished {
                        self.transform = CGAffineTransform.identity
                    }
            }
            )
            flashDelay += flashDuration
        }
    }

}
