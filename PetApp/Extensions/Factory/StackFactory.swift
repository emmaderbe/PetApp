import UIKit

final class StackFactory {
    static func verticalStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    static func horizontalStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = spacing
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
