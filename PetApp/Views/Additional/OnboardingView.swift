import UIKit

// MARK: - Properties and init()
class OnboardingView: UIView {
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accentText
        label.font = .montserratSemiBold24()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accentText
        label.font = .montserratRegular16()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setUpView()
extension OnboardingView {
    private func setUpView() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
}

// MARK: - setUpConstraints()
extension OnboardingView {
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.imageTop),
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.OnboardingViewConstraints.imageHeight),
            mainImage.widthAnchor.constraint(equalTo: mainImage.heightAnchor),

            titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.labelTop),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.generalLeading),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.generalTrailing),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.generalTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.generalTrailing),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ViewConstraintsConstants.OnboardingViewConstraints.labelWight)
        ])
    }
}
