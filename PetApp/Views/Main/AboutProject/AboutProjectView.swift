import UIKit

class AboutProjectView: UIView {
    private let portraitOfDeveloperImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDeveloperImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let portraitOfDesignerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDesignerImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let portraitOfDoctorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDoctorImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("titleLabelAboutProjectView", comment: "")
        label.font = .montserratSemiBold20()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("descriptionTitleAAboutProjectView", comment: "")
        label.font = .montserratRegular16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let supportTheProjectButton = OrangeButton(title: "Поддержать проект")
    
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

extension AboutProjectView {
    private func setupView() {
        backgroundColor = .accentBackground
        addSubview(portraitOfDeveloperImage)
        addSubview(portraitOfDesignerImage)
        addSubview(portraitOfDoctorImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(supportTheProjectButton)
        
        supportTheProjectButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitOfDeveloperImage.layer.zPosition = 0
        portraitOfDesignerImage.layer.zPosition = 1
        portraitOfDoctorImage.layer.zPosition = 1
    }
}

extension AboutProjectView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            portraitOfDeveloperImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            portraitOfDeveloperImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitOfDeveloperImage.heightAnchor.constraint(equalToConstant: 160),
            portraitOfDeveloperImage.widthAnchor.constraint(equalToConstant: 160),
            
            portraitOfDesignerImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: 85),
            portraitOfDesignerImage.trailingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDesignerImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDesignerImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            portraitOfDoctorImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: 85),
            portraitOfDoctorImage.leadingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDoctorImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDoctorImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            //            portraitOfDesignerImage.topAnchor.constraint(equalTo: portraitOfDeveloperImage.topAnchor, constant: 109),
            //            portraitOfDesignerImage.leadingAnchor.constraint(equalTo: portraitOfDeveloperImage.leadingAnchor, constant: 94), // Смещение влево от центра
            //            portraitOfDesignerImage.heightAnchor.constraint(equalToConstant: 115), // Высота
            //            portraitOfDesignerImage.widthAnchor.constraint(equalToConstant: 160),
            //
            //            portraitOfDoctorImage.topAnchor.constraint(equalTo: portraitOfDeveloperImage.topAnchor, constant: 109), // Смещение вниз от центрального изображения
            //            portraitOfDoctorImage.trailingAnchor.constraint(equalTo: portraitOfDeveloperImage.trailingAnchor, constant: -94), // Смещение вправо от центра
            //            portraitOfDoctorImage.heightAnchor.constraint(equalToConstant: 115), // Высота
            //            portraitOfDoctorImage.widthAnchor.constraint(equalToConstant: 160),
            
            titleLabel.topAnchor.constraint(equalTo: portraitOfDoctorImage.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            supportTheProjectButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            supportTheProjectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            supportTheProjectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            supportTheProjectButton.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
}
