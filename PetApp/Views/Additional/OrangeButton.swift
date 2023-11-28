import UIKit

// MARK: - Properties and init()
final class OrangeButton: UIButton {
    var onTap: (() -> Void)?
    
    @objc private func handleTap() {
        onTap?()
    }
    
    init(title: String, frame: CGRect = .zero) {
        super.init(frame: frame)
        configure(with: title)
        btnPressed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - configure()
extension OrangeButton {
    private func configure(with title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .accentOrange
        layer.cornerRadius = 16
    }
}

// MARK: - btnPressed()
extension OrangeButton {
    private func btnPressed() {
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
}
