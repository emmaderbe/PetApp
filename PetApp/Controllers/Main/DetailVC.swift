import UIKit

// MARK: - Properties
class DetailVC: UIViewController {
    private let detailView = DetailView()
    private let foodMarkView = FoodMarkCollectionView()
    private let likeButton = LikeButton()
    
    var productInfo: DogProductModel? {
        didSet {
            updateProductInfo()
        }
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
}

// MARK: - setupView()
extension DetailVC {
    func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(detailView)
        view.addSubview(foodMarkView)
    }
}

// MARK: - setupConstraints()
extension DetailVC {
    func setupConstraints()  {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            foodMarkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: VcConstraintsConstants.DetailVcConstraints.collectionTop),
            foodMarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodMarkView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodMarkView.heightAnchor.constraint(equalToConstant: VcConstraintsConstants.DetailVcConstraints.collectionHeight),
            foodMarkView.widthAnchor.constraint(equalToConstant: VcConstraintsConstants.DetailVcConstraints.collectionWidth),
        ])
    }
}

extension DetailVC {
    private func updateProductInfo() {
        guard let product = productInfo else {return}
        detailView.mainImage.image = UIImage(named: product.detailPhoto)
        detailView.descriptionLabel.text = product.descriptions
        if product.restriction.trimmingCharacters(in: .whitespaces).isEmpty {
            detailView.restrictionsTitleLabel.isHidden = true
        } else {
            detailView.restrictionsLabel.text = product.restriction
            detailView.restrictionsTitleLabel.isHidden = false
        }
        foodMarkView.dogProductListType = product.type.enumerated().map { index, type in
            let photo = index < product.photo.count ? product.photo[index] : ""
            let backgroundType = index < product.backgroundType.count ? product.backgroundType[index] : ""
            return DogProductTypeModel(type: type, photo: photo, backgroundType: backgroundType)
        }
        foodMarkView.reloadData()
    }
}

extension DetailVC {
    private func setupNavigationBar() {
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        let likeButtonItem = UIBarButtonItem(customView: likeButton)
        navigationItem.rightBarButtonItem = likeButtonItem
    }
    
    @objc private func likeButtonTapped() {
        guard let product = productInfo else { return }
        FavouritesManager.shared.updateFavourite(product: product)
    }
}
