import UIKit

// MARK: - Properties and init()
final class LikeButton: UIButton {
    var isLiked = false {
        didSet {
            let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
            let heartFill = UIImage(systemName: "heart.fill", withConfiguration: configuration)
            let heart = UIImage(systemName: "heart", withConfiguration: configuration)
            let image = isLiked ? heartFill : heart
            setImage(image, for: .normal)
        }
    }
    
    var onTap: ((Bool) -> Void)?
    
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
extension LikeButton {
    private func configure() {
        tintColor = UIColor.accentOrange
        clipsToBounds = true
    }
}

// MARK: - btnPressed()
extension LikeButton {
    private func btnPressed() {
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
}

// MARK: - handleTap()
extension LikeButton {
    @objc private func handleTap() {
        isLiked.toggle()
        onTap?(isLiked)
    }
}

