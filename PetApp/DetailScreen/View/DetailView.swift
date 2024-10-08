import UIKit

// MARK: - Properties
class DetailView: UIView {
    private let mainImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let foodMarkView = FoodMarkCollectionView()
    private let descriptionTitleLabel = LabelFactory.montserratBold16()
    private let descriptionLabel = LabelFactory.montserratRegular16()
    private let restrictionsTitleLabel = LabelFactory.montserratBold16()
    private let restrictionsLabel = LabelFactory.montserratRegular16()
    
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
private extension DetailView {
    func setupView() {
        backgroundColor = .accentBackground
        addSubview(mainImage)
        addSubview(foodMarkView)
        addSubview(descriptionTitleLabel)
        addSubview(descriptionLabel)
        addSubview(restrictionsTitleLabel)
        addSubview(restrictionsLabel)
    }
}

// MARK: - setupConstraints()
private extension DetailView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.DetailViewConstraints.generalLeading),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.DetailViewConstraints.generalTrailing),
            mainImage.heightAnchor.constraint(equalToConstant: ViewConstants.DetailViewConstraints.imageHeight),
            
            foodMarkView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            foodMarkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodMarkView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodMarkView.heightAnchor.constraint(equalToConstant: ViewConstants.DetailViewConstraints.cellHeight),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: foodMarkView.bottomAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.DetailViewConstraints.generalLeading),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.DetailViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.DetailViewConstraints.generalTrailing),
            
            restrictionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            restrictionsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.DetailViewConstraints.generalLeading),
            
            restrictionsLabel.topAnchor.constraint(equalTo: restrictionsTitleLabel.bottomAnchor, constant: ViewConstants.DetailViewConstraints.generalTop),
            restrictionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.DetailViewConstraints.generalLeading),
            restrictionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  ViewConstants.DetailViewConstraints.generalTrailing),
        ])
    }
}

extension DetailView {
    func setupData(descriptionTitle: String,
                   description: String,
                   restrictionTitle: String,
                   restriction: String?,
                   image: String) {
        descriptionTitleLabel.text = descriptionTitle
        descriptionLabel.text = description
        restrictionsTitleLabel.text = restrictionTitle
        restrictionsLabel.text = restriction
        mainImage.image = UIImage(named: image)
    }
    
    func setupFoodMark(with: FoodMarkCollectionDataSource, and: FoodMarkCollectionDelegate) {
        foodMarkView.setFoodMark(with, and)
    }
    
    func hideRestrictionsTitle() {
        restrictionsTitleLabel.isHidden = true
    }
}
