import UIKit

// MARK: - Properties
class SettingsView: UIView {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainPhotoAboutProject")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .accentBackground
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("titleLabelSettingsView", comment: "")
        label.font = .montserratSemiBold20()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("descriptionTitleASettingsView", comment: "")
        label.font = .montserratRegular16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aboutProjectButton = OrangeButton(title: "О проекте")
    let sendMessageButton = OrangeButton(title: "Обратная связь")
    
    var onAboutProjectButtonTap: (() -> Void)?
    var onSendMessageButtonTap: (() -> Void)?
    
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
extension SettingsView {
    func setupView() {
        backgroundColor = .accentBackground
        addSubview(mainImage)
        addSubview(backgroundView)
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(aboutProjectButton)
        backgroundView.addSubview(sendMessageButton)
        
        aboutProjectButton.translatesAutoresizingMaskIntoConstraints = false
        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - setupConstraints()
extension SettingsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 380),
            
            backgroundView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -70),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 26),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 21),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -21),
            
            aboutProjectButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            aboutProjectButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            aboutProjectButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            aboutProjectButton.heightAnchor.constraint(equalToConstant: 64),
            
            sendMessageButton.topAnchor.constraint(equalTo: aboutProjectButton.bottomAnchor, constant: 16),
            sendMessageButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            sendMessageButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            sendMessageButton.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
}
