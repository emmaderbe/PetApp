import UIKit

// MARK: - Properties
class DetailVC: UIViewController {
    private let detailView = DetailView()
    private let likeButton = LikeButton()
    var productInfo: DogProductModel?
    private let dataSource = FoodMarkCollectionDataSource()
    
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
extension DetailVC {
    private func updateProductInfo() {
        guard let product = productInfo else {return}
        
        detailView.setupData(descriptionTitle: NSLocalizedString("descriptionTitleLabelDetailView", comment: ""),
                             description: product.descriptions,
                             restrictionTitle: NSLocalizedString("restrictionsTitleLabelDetailView", comment: ""),
                             restriction: product.restriction,
                             image: product.detailPhoto)
        detailView.setupFoodMark(with: dataSource)
    }
}

// MARK: - setupNavigationBar()
extension DetailVC {
    private func setupNavigationBar() {
        likeButton.onTap = { [weak self] isLiked in
            guard let self = self, let product = self.productInfo else { return }
            FavouritesManager.shared.updateFavourite(product: product)
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
        guard let product = productInfo else { return }
        let isFavourite = FavouritesManager.shared.isFavourite(product: product)
        likeButton.isLiked = isFavourite
    }
}

