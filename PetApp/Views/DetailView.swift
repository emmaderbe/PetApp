import UIKit

// MARK: - Properties
class DetailView: UIView {
    
    private let mainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "heart-icon-fill"))
        image.backgroundColor = .accentGrey
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание продукта"
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Не кормите собаку ананасами, так как они содержат синильную кислоту, которая ядовита."
        label.font = .montserratRegular16()
        label.numberOfLines = 10
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let restrictionsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Все продукты"
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let restrictionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Все продукты"
        label.font = .montserratRegular16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
extension DetailView {
    func setupView() {
        backgroundColor = .accentBackground
        addSubview(mainImage)
        addSubview(descriptionTitleLabel)
        addSubview(descriptionLabel)
        addSubview(restrictionsTitleLabel)
        addSubview(restrictionsLabel)
    }
}

// MARK: - setupConstraints()
extension DetailView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            mainImage.heightAnchor.constraint(equalToConstant: 189),
            mainImage.widthAnchor.constraint(equalToConstant: 352),

            descriptionTitleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 83),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 22),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 358),
            
            restrictionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 22),
            restrictionsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            restrictionsLabel.topAnchor.constraint(equalTo: restrictionsTitleLabel.bottomAnchor, constant: 22),
            restrictionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            restrictionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            restrictionsLabel.widthAnchor.constraint(equalToConstant: 358),
        ])
    }
}

