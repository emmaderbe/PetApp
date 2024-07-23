import UIKit

// MARK: - Properties
class DetailView: UIView {
    private let mainImage = ImageFactory.imageViewAspectFit(cornerRadius: 12)
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
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
            mainImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.imageHeight),
            
            foodMarkView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            foodMarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            foodMarkView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
//            foodMarkView.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.DetailViewConstraints.cellHeight),
//            
            descriptionTitleLabel.topAnchor.constraint(equalTo: foodMarkView.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTrailing),

            restrictionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            
            restrictionsLabel.topAnchor.constraint(equalTo: restrictionsTitleLabel.bottomAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalTop),
            restrictionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.DetailViewConstraints.generalLeading),
            restrictionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  ViewConstraintsConstants.DetailViewConstraints.generalTrailing),
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
    
    func setupFoodMark(with: FoodMarkCollectionDataSource) {
        foodMarkView.setDataSource(with)
    }
}
