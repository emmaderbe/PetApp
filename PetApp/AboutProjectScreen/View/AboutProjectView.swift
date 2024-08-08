import UIKit

// MARK: - Properties
class AboutProjectView: UIView {
    private let portraitOfDeveloperImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let portraitOfDesignerImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let portraitOfDoctorImage = ImageFactory.imageViewAspectFit(cornerRadius: 0)
    private let titleLabel = LabelFactory.montserratSemiBold20()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let descriptionLabel = LabelFactory.montserratRegular16()
    private let supportTheProjectButton = OrangeButton(title: "")
    
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
private extension AboutProjectView {
    func setupView() {
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
private extension AboutProjectView {
     func setupConstraints() {
        NSLayoutConstraint.activate([
            portraitOfDeveloperImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            portraitOfDeveloperImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            portraitOfDeveloperImage.heightAnchor.constraint(equalToConstant: ViewConstants.AboutProjectView.imageHeight),
            portraitOfDeveloperImage.widthAnchor.constraint(equalToConstant: ViewConstants.AboutProjectView.imageWeight),
            
            portraitOfDesignerImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: ViewConstants.AboutProjectView.generalTop),
            portraitOfDesignerImage.trailingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDesignerImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDesignerImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            portraitOfDoctorImage.centerYAnchor.constraint(equalTo: portraitOfDeveloperImage.centerYAnchor, constant: ViewConstants.AboutProjectView.generalTop),
            portraitOfDoctorImage.leadingAnchor.constraint(equalTo: portraitOfDeveloperImage.centerXAnchor),
            portraitOfDoctorImage.heightAnchor.constraint(equalTo: portraitOfDeveloperImage.heightAnchor),
            portraitOfDoctorImage.widthAnchor.constraint(equalTo: portraitOfDeveloperImage.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: portraitOfDoctorImage.bottomAnchor, constant: ViewConstants.AboutProjectView.labelTop),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewConstants.AboutProjectView.scrollTop),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.AboutProjectView.generalLeading),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.AboutProjectView.generalTrailing),
            scrollView.bottomAnchor.constraint(equalTo: supportTheProjectButton.topAnchor, constant: ViewConstants.AboutProjectView.generalButton),
            
            descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            supportTheProjectButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: ViewConstants.AboutProjectView.generalButton),
            supportTheProjectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.AboutProjectView.generalLeading * 2),
            supportTheProjectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstants.AboutProjectView.generalTrailing * 2),
            supportTheProjectButton.heightAnchor.constraint(equalToConstant: ViewConstants.AboutProjectView.buttonHeight),
        ])
    }
}

extension AboutProjectView {
    func addGestureRecognizersToImages(developerGesture: UIGestureRecognizer, 
                                       designerGesture: UIGestureRecognizer,
                                       doctorGesture: UIGestureRecognizer) {
        portraitOfDeveloperImage.addGestureRecognizer(developerGesture)
        portraitOfDeveloperImage.isUserInteractionEnabled = true

        portraitOfDesignerImage.addGestureRecognizer(designerGesture)
        portraitOfDesignerImage.isUserInteractionEnabled = true

        portraitOfDoctorImage.addGestureRecognizer(doctorGesture)
        portraitOfDoctorImage.isUserInteractionEnabled = true
    }
    
        func setupImageTags() {
            portraitOfDeveloperImage.tag = 1
            portraitOfDesignerImage.tag = 2
            portraitOfDoctorImage.tag = 3
        }
}


extension AboutProjectView {
    func setupData(firstImage: String,
                   secondImage: String,
                   thirdImage: String,
                   title: String,
                   description: String,
                   button: String) {
        portraitOfDeveloperImage.image = UIImage(named: firstImage)
        portraitOfDesignerImage.image = UIImage(named: secondImage)
        portraitOfDoctorImage.image = UIImage(named: thirdImage)
        titleLabel.text = title
        descriptionLabel.text = description
        supportTheProjectButton.setTitle(button, for: .normal)
    }
}

extension AboutProjectView {
    func configureSupportButtonAction(onTap: @escaping () -> Void) {
        supportTheProjectButton.onTap = onTap
    }
}
