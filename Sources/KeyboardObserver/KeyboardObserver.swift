import UIKit

public class KeyboardObserver {

    public typealias Handler = (Info) -> Void
    
    let notificationCenter = NotificationCenter.default
    
    public var willShowHandler: Handler?
    public var didShowHandler: Handler?
    public var willHideHandler: Handler?
    public var didHideHandler: Handler?
    public var willChangeFrameHandler: Handler?
    public var didChangeFrameHandler: Handler?
    
    public init() {
        setupKeyboardNotificationsHandlers()
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }

    private func setupKeyboardNotificationsHandlers() {
        
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillShowNotification), name: UIResponder.keyboardDidShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardDidShowNotification), name: UIResponder.keyboardDidShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillHideNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardDidHideNotification), name: UIResponder.keyboardDidHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillChangeFrameNotification), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardDidChangeFrameNotification), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
}

extension KeyboardObserver {
    
    @objc private func handleKeyboardWillShowNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        willShowHandler?(keyboardInfo)
    }
    
    @objc private func handleKeyboardDidShowNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        didShowHandler?(keyboardInfo)
    }
    
    @objc private func handleKeyboardWillHideNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        willHideHandler?(keyboardInfo)
    }
    
    @objc private func handleKeyboardDidHideNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        didHideHandler?(keyboardInfo)
    }
    
    @objc private func handleKeyboardWillChangeFrameNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        willChangeFrameHandler?(keyboardInfo)
    }
    
    @objc private func handleKeyboardDidChangeFrameNotification(notification: NSNotification) {
        guard let keyboardInfo = Info(withUserInfo: notification.userInfo) else { return }
        didChangeFrameHandler?(keyboardInfo)
    }
}
