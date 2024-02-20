import UIKit

// MARK: - Properties
class AboutProjectView: UIView {
    let portraitOfDeveloperImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDeveloperImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let portraitOfDesignerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDesignerImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let portraitOfDoctorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portraitOfDoctorImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
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

// MARK: - setupView()
extension AboutProjectView {
    private func setupView() {
        backgroundColor = .accentBackground
        addSubview(portraitOfDeveloperImage)
        addSubview(portraitOfDesignerImage)
        addSubview(portraitOfDoctorImage)
        addSubview(titleLabel)
        addSubview(scrollView)
        scrollView.addSubview(descriptionLabel)
        addSubview(supportTheProjectButton)
        
        supportTheProjectButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitOfDeveloperImage.layer.zPosition = 0
        portraitOfDesignerImage.layer.zPosition = 1
        portraitOfDoctorImage.layer.zPosition = 1
    }
}

// MARK: - setupConstraints()
extension AboutProjectView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            portraitOfDeveloperImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            portraitOfDeveloperImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitOfDeveloperImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.AboutProjectView.imageHeight),
            portraitOfDeveloperImage.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.AboutProjectView.imageWeight),
            
            portraitOfDesignerImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalTop),
            portraitOfDesignerImage.trailingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDesignerImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDesignerImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            portraitOfDoctorImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalTop),
            portraitOfDoctorImage.leadingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDoctorImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDoctorImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: portraitOfDoctorImage.bottomAnchor, constant: ViewConstraintsConstants.AboutProjectView.labelTop),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewConstraintsConstants.AboutProjectView.scrollTop),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalLeading),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalTrailing),
            scrollView.bottomAnchor.constraint(equalTo: supportTheProjectButton.topAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalButton),
            
            descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            supportTheProjectButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalButton),
            supportTheProjectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalLeading * 2),
            supportTheProjectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.AboutProjectView.generalTrailing * 2),
            supportTheProjectButton.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.AboutProjectView.buttonHeight),
        ])
    }
}

extension AboutProjectView {
    func addDeveloperGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
            portraitOfDeveloperImage.addGestureRecognizer(gestureRecognizer)
            portraitOfDeveloperImage.isUserInteractionEnabled = true
        }
        
        func addDesignerGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
            portraitOfDesignerImage.addGestureRecognizer(gestureRecognizer)
            portraitOfDesignerImage.isUserInteractionEnabled = true
        }
        
        func addDoctorGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
            portraitOfDoctorImage.addGestureRecognizer(gestureRecognizer)
            portraitOfDoctorImage.isUserInteractionEnabled = true
        }
}
