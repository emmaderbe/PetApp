import UIKit
import SafariServices

// MARK: - Properties and viewDidLoad()
class AboutProjectViewController: UIViewController {
    
    private let aboutProjectView = AboutProjectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupGestureRecognizers()
    }
}

// MARK: - setupView()
extension AboutProjectViewController {
    private func setupView() {
        view.backgroundColor = .accentBackground
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        view.addSubview(aboutProjectView)
        aboutProjectView.translatesAutoresizingMaskIntoConstraints = false
        
        aboutProjectView.supportTheProjectButton.addTarget(self, action: #selector(openSupportForm), for: .touchUpInside)
    }
}

// MARK: - setupConstraints()
extension AboutProjectViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutProjectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            aboutProjectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutProjectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutProjectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - showSupportTheProjectButton()
extension AboutProjectViewController {
    @objc private func openSupportForm() {
        let feedbackURL = StringConstants.howHeplURl
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
        let imageViewsToIdentifiers: [(imageView: UIImageView, identifier: String)] = [
            (aboutProjectView.portraitOfDeveloperImage, "Developer"),
            (aboutProjectView.portraitOfDesignerImage, "Designer"),
            (aboutProjectView.portraitOfDoctorImage, "Doctor")
        ]

        for (imageView, _) in imageViewsToIdentifiers {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(tapGesture)
            imageView.isUserInteractionEnabled = true
        }
    }
}

// MARK: - imageTapped()
extension AboutProjectViewController {
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedImageView = gesture.view as? UIImageView else { return }
        
        let identifier: String
        switch tappedImageView {
        case aboutProjectView.portraitOfDeveloperImage:
            identifier = "Developer"
        case aboutProjectView.portraitOfDesignerImage:
            identifier = "Designer"
        case aboutProjectView.portraitOfDoctorImage:
            identifier = "Doctor"
        default:
            return
        }

        let vc = CardViewController()
        vc.initialCardName = identifier
        vc.title = "Команда проекта"
        navigationController?.pushViewController(vc, animated: true)
    }
}
