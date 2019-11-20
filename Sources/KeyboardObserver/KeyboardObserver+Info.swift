import Foundation
import UIKit

extension KeyboardObserver {
    
    public struct Info {
        
        public private(set) var startFrame: CGRect
        public private(set) var endFrame: CGRect
        public private(set) var animationCurve:  UIView.AnimationCurve
        public private(set) var animationDuration: Double
        
        private var _isLocal: Bool = false
        
        @available(iOS 9.0, *)
        public private(set) var isLocal: Bool {
            get { _isLocal }
            set { _isLocal = newValue }
        }
        
        init?(withUserInfo userInfo: [AnyHashable:Any]?) {
            
            guard let userInfo = userInfo else { return nil }
            
            let startFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
            let endFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            
            let animationCurveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationDurationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber
            
            self.startFrame = startFrameValue.cgRectValue
            self.endFrame = endFrameValue.cgRectValue
            self.animationCurve = UIView.AnimationCurve(rawValue: animationCurveValue.intValue) ?? .linear
            self.animationDuration = animationDurationValue.doubleValue
            
            if #available(iOS 9.0, *) {
                let isLocalValue = userInfo[UIResponder.keyboardIsLocalUserInfoKey] as! NSNumber
                self.isLocal = isLocalValue.boolValue
            }
        }
    }
}
