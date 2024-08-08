import UIKit

// MARK: - Properties and init()
final class ProductContentUnavailableView: UIView {
    var product: String
    
    private let titleLabel = LabelFactory.montserratSemiBold16()
    private let descriptionLabel = LabelFactory.montserratRegular16()
    private let backgroundView = ViewFactory.backgroundView(cornerRadius: 16)
    private let button = NextButton()
    
    init(product: String) {
        self.product = product
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setUpView()
private extension ProductContentUnavailableView {
    func setUpView() {
        backgroundColor = .accentBackground
        addSubview(backgroundView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(button)
        
        descriptionLabel.textAlignment = .center
        backgroundView.backgroundColor = .accentLightGrey
        button.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - setUpConstraints()
private extension ProductContentUnavailableView {
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.viewTop),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.viewLeading),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.viewTrailing),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.labelTop),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalLeading),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalTrailing),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.labelBotton),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalTrailing),
            
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalTop),
            button.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: ViewConstants.ProductContentUnavailableConstraints.generalBottom)
        ])
    }
}

// MARK: - updateProduct()
extension ProductContentUnavailableView {
    func updateProduct(product: String) {
        titleLabel.text = "Продукт \(product) не найден"
    }
}

// MARK: - setDelegate()
extension ProductContentUnavailableView {
    func setDelegate(_ delegate: NextButtonDelegate) {
        self.button.delegate = delegate
    }
}
