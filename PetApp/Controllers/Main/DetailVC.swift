import UIKit

// MARK: - Properties
class DetailVC: UIViewController {
    private let detailView = DetailView()
    private let foodMarkView = FoodMarkCollectionView()
    
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
        detailView.mainImage.image = UIImage(named: product.photo)
        detailView.descriptionLabel.text = product.descriptions
        detailView.restrictionsLabel.text = product.restriction
        foodMarkView.dogProductList = [product]
    }
}
