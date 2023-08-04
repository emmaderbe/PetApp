import UIKit

// MARK: - Properties and init()
final class LikeButton: UIButton {
    var isLiked = false {
        didSet {
            let image = isLiked ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
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
        setImage(UIImage(systemName: "star"), for: .normal)
        tintColor = UIColor.accentOrange
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

