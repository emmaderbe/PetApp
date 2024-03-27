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
        label.numberOfLines = 0
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
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: screenHeight * ViewConstraintsConstants.DetailViewConstraints.imageTop),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth *  ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            mainImage.widthAnchor.constraint(equalToConstant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.imageWidth),

            descriptionTitleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: screenHeight * ViewConstraintsConstants.DetailViewConstraints.labelTop),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: screenHeight * ViewConstraintsConstants.DetailViewConstraints.generalTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
            descriptionLabel.widthAnchor.constraint(equalToConstant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.labelWight),
            
            restrictionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: screenHeight * ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            restrictionsLabel.topAnchor.constraint(equalTo: restrictionsTitleLabel.bottomAnchor, constant: screenHeight * ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            restrictionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
            restrictionsLabel.widthAnchor.constraint(equalToConstant: screenWidth * ViewConstraintsConstants.DetailViewConstraints.labelWight),
        ])
    }
}
