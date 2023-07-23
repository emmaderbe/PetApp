import UIKit

// MARK: - Properties
class DetailVC: UIViewController {
    private var detailView = DetailView()
    private var foodMarkView = FoodMarkCollectionView()
    
    var product: DogProduct? {
            didSet {
                detailView.mainImage.image = UIImage(named: product!.photo)
                detailView.descriptionLabel.text = product?.description
                detailView.restrictionsLabel.text = product?.restriction        
                foodMarkView.dogProduct = [product].compactMap { $0 }
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
            
            foodMarkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 229),
            foodMarkView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodMarkView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodMarkView.heightAnchor.constraint(equalToConstant: 31),
            foodMarkView.widthAnchor.constraint(equalToConstant: 96),
        ])
    }
}
