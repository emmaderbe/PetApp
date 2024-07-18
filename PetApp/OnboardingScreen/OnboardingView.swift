import UIKit

// MARK: - Properties and init()
class OnboardingView: UIView {
    private let mainImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let titleLabel = LabelFactory.montserratSemiBold24()
    private let descriptionLabel = LabelFactory.montserratRegular16()
    
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
private extension OnboardingView {
    func setUpView() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
}

// MARK: - setUpConstraints()
private extension OnboardingView {
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstraintsConstants.OnboardingViewConstraints.imageTop),
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            mainImage.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.877),

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

extension OnboardingView {
    func setupData(image: String,
              title: String,
              description: String) {
        mainImage.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
