import UIKit

protocol NextButtonDelegate: AnyObject {
    func nextButtonDidTap()
}

// MARK: - Properties and init()
final class NextButton: UIButton {
    
    weak var delegate: NextButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        btnPressed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - configure()
extension NextButton {
    private func configure() {
        setTitle("Продолжить", for: .normal)
        setTitleColor(.accentOrange, for: .normal)
    }
}

// MARK: - btnPressed()
extension NextButton {
    private func btnPressed() {
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
}

// MARK: - handleTap()
extension NextButton {
    @objc private func handleTap() {
        delegate?.nextButtonDidTap()
    }
}
