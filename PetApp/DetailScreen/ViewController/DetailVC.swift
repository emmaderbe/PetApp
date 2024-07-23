import UIKit

// MARK: - Properties
class DetailVC: UIViewController {
    private let detailView = DetailView()
    private let foodMarkDataSource = FoodMarkCollectionDataSource()
    private let foodMarkDelegate = FoodMarkCollectionDelegate()
    
    private let productManager: DogProductDataManagerProtocol
    private let favouriteManager: FavouritesManagerProtocol
    private let likeButton = LikeButton()
    var productInfo: DogProductModelDTO
    
    init(productInfo: DogProductModelDTO,
         favouriteManager: FavouritesManagerProtocol = FavouritesManager(),
         productManager: DogProductDataManagerProtocol = DogProductDataManager()) {
        self.productInfo = productInfo
        self.productManager = productManager
        self.favouriteManager = favouriteManager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        updateProductInfo()
    }
}

// MARK: - updateProductInfo()
private extension DetailVC {
    func updateProductInfo() {
        let product = productInfo
        
        detailView.setupData(descriptionTitle: NSLocalizedString("descriptionTitleLabelDetailView", comment: ""),
                             description: product.descriptions,
                             restrictionTitle: NSLocalizedString("restrictionsTitleLabelDetailView", comment: ""),
                             restriction: product.restriction,
                             image: product.detailPhoto)
        
        detailView.setupFoodMark(with: foodMarkDataSource, and: foodMarkDelegate)
        let productTypes = product.type.enumerated().map { (index, type) in
            DogProductTypeModelDTO(type: type, photo: product.photo[index], backgroundType: product.backgroundType[index])
        }
        if product.restriction.isEmpty {
            detailView.hideRestrictionsTitle()
        }
        foodMarkDataSource.updateType(productTypes)
    }
}

// MARK: - setupNavigationBar()
extension DetailVC {
    private func setupNavigationBar() {
        likeButton.onTap = { [weak self] isLiked in
            guard let self = self else { return }
            let product = self.productInfo
            self.favouriteManager.updateFavourite(product: product)
            self.updateLikeButtonState()
        }
        let likeButtonItem = UIBarButtonItem(customView: likeButton)
        navigationItem.rightBarButtonItem = likeButtonItem
        updateLikeButtonState()
    }
}

// MARK: - updateLikeButtonState()
extension DetailVC {
    func updateLikeButtonState() {
        let product = productInfo
        let isFavourite = self.favouriteManager.isFavourite(product: product)
        likeButton.isLiked = isFavourite
    }
}

