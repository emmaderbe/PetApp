import UIKit
import SafariServices

// MARK: - Properties and viewDidLoad()
class AboutProjectViewController: UIViewController {
    
    private let aboutProjectView = AboutProjectView()
    
    override func loadView() {
        view = aboutProjectView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestureRecognizers()
    }
}

// MARK: - setupView()
private extension AboutProjectViewController {
    func setupView() {
        configureData()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        aboutProjectView.configureSupportButtonAction {
                    self.openSupportForm()
                }
    }
}

private extension AboutProjectViewController {
    func configureData() {
        aboutProjectView.setupData(firstImage: ImageConstants.AboutProject.devPortret,
                                   secondImage: ImageConstants.AboutProject.desPortret,
                                   thirdImage: ImageConstants.AboutProject.docPortret,
                                   title: NSLocalizedString("titleLabelAboutProjectView", comment: ""),
                                   description: NSLocalizedString("descriptionTitleAAboutProjectView", comment: ""),
                                   button: "Поддержать проект")
        aboutProjectView.setupImageTags()
    }
}

// MARK: - showSupportTheProjectButton()
private extension AboutProjectViewController {
    @objc func openSupportForm() {
        let feedbackURL = StringConstants.URL.howHeplURl
            if let url = URL(string: feedbackURL) {
                let safariVC = SFSafariViewController(url: url)
                present(safariVC, animated: true, completion: nil)
            } else {
                print("Invalid URL")
            }
        }
}

// MARK: - setupGestureRecognizers()
extension AboutProjectViewController {
    private func setupGestureRecognizers() {
        let developerTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            let designerTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            let doctorTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))

            aboutProjectView.addGestureRecognizersToImages(developerGesture: developerTapGesture, designerGesture: designerTapGesture, doctorGesture: doctorTapGesture)
    }
}

// MARK: - imageTapped()
extension AboutProjectViewController {
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedImageView = gesture.view as? UIImageView else { return }

        var identifier = ""
        switch tappedImageView.tag {
        case 1:
            identifier = "Developer"
        case 2:
            identifier = "Designer"
        case 3:
            identifier = "Doctor"
        default:
            return 
        }

        if !identifier.isEmpty {
            let vc = CardViewController()
            vc.initialCardName = identifier
            vc.title = "Команда проекта"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
