import UIKit

// MARK: - Properties
class DetailView: UIView {

     let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("descriptionTitleLabelDetailView", comment: "")
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratRegular16()
        label.numberOfLines = 10
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restrictionsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("restrictionsTitleLabelDetailView", comment: "")
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let restrictionsLabel: UILabel = {
        let label = UILabel()
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
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.imageTop),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.imageLeading),
            mainImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.imageHeight),
            mainImage.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.imageWidth),

            descriptionTitleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.labelTop),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
            descriptionLabel.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.labelWight),
            
            restrictionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            restrictionsLabel.topAnchor.constraint(equalTo: restrictionsTitleLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            restrictionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
            restrictionsLabel.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.labelWight),
        ])
    }
}
