import UIKit

class CardView: UIView {
    var identifier: String?
    var profileURL: String = ""
    
    private let imageView = ImageFactory.imageViewAspectFill(cornerRadius: 16)
    private let titleLabel = LabelFactory.montserratSemiBold20()
    private let descriptionLabel = LabelFactory.montserratRegular16()
    
    var profileButton = OrangeButton(title: "Мой профиль")
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setupView()
extension CardView {
    private func setupView() {
        backgroundColor = .accentBackground
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(profileButton)
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - setupConstraints()
extension CardView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstants.CardView.viewTop),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.CardView.generalLeading),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.CardView.generalTrailing),
            imageView.heightAnchor.constraint(equalToConstant: ViewConstants.CardView.viewHeight),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ViewConstants.CardView.titleTop),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewConstants.CardView.labelTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.CardView.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.CardView.generalTrailing),
            
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.CardView.generalLeading),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.CardView.generalTrailing),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ViewConstants.CardView.generalBottom),
            profileButton.heightAnchor.constraint(equalToConstant: ViewConstants.CardView.buttonHeight),
        ])
    }
}

extension CardView {
    func setupData(image: UIImage,
                   title: String,
                   description: String) {
        imageView.image = image
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

