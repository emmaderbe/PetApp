import UIKit

final class KeyboardManager {
    
    private weak var view: UIView?
    
    init(view: UIView) {
        self.view = view
        setupKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
}

private extension KeyboardManager {
    func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.height
        updateContentInset(bottom: keyboardHeight)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        updateContentInset(bottom: 0)
        scrollToTopIfNeeded()
    }
    
    func updateContentInset(bottom: CGFloat) {
        if let scrollView = view as? UIScrollView {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: 0)
            scrollView.scrollIndicatorInsets = scrollView.contentInset
        }
    }
    
    func scrollToTopIfNeeded() {
            if let collectionView = view as? UICollectionView, collectionView.numberOfItems(inSection: 0) > 0 {
                collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
            }
        }
}
