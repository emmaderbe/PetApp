import UIKit

// MARK: - Properties
class SettingsView: UIView {
    private let mainImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let backgroundView = ViewFactory.backgroundView(cornerRadius: 16)
    private let titleLabel = LabelFactory.montserratSemiBold20()
    private let descriptionLabel = LabelFactory.montserratRegular16()
    private let aboutProjectButton = OrangeButton(title: "")
    private let sendMessageButton = OrangeButton(title: "")
    
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
private extension SettingsView {
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
        
        editButtons()
    }
}

private extension SettingsView {
    func editButtons() {
            aboutProjectButton.onTap = { [weak self] in
                self?.onAboutProjectButtonTap?()
            }
            sendMessageButton.onTap = { [weak self] in
                self?.onSendMessageButtonTap?()
            }
        }
}

// MARK: - setupConstraints()
private extension SettingsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.SettingsViewConstraints.imageHeight),
            
            backgroundView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.viewTop),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.labelTop),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalTrailing),
            
            aboutProjectButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.firstButtonTop),
            aboutProjectButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalLeading),
            aboutProjectButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalTrailing),
            aboutProjectButton.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.SettingsViewConstraints.generalButtonHeight),
            
            sendMessageButton.topAnchor.constraint(equalTo: aboutProjectButton.bottomAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.secondButtonTop),
            sendMessageButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalLeading),
            sendMessageButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: ViewConstraintsConstants.SettingsViewConstraints.generalTrailing),
            sendMessageButton.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.SettingsViewConstraints.generalButtonHeight),
        ])
    }
}

extension SettingsView {
    func setupData(image: String,
                   title: String,
                   description: String,
                   firstBttn: String,
                   secondBttn: String) {
        mainImage.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description
        aboutProjectButton.setTitle(firstBttn, for: .normal)
        sendMessageButton.setTitle(secondBttn, for: .normal)
    }
}
