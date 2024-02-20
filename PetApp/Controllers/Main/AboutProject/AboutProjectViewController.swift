import UIKit

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
        
        editButton()
    }
}

// MARK: - setupView()
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

extension AboutProjectViewController {
    private func editButton() {
        aboutProjectView.supportTheProjectButton.onTap = { [weak self] in
            self?.showSupportTheProjectButton()
        }
    }
}

// MARK: - showSendMessage()
extension AboutProjectViewController {
    private func showSupportTheProjectButton() {
        print("support")
    }
}

extension AboutProjectViewController {
    private func setupGestureRecognizers() {
        let developerTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        aboutProjectView.addDeveloperGestureRecognizer(developerTapGesture)
        
        let designerTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        aboutProjectView.addDesignerGestureRecognizer(designerTapGesture)
        
        let doctorTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        aboutProjectView.addDoctorGestureRecognizer(doctorTapGesture)
    }
    
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        let vc = CardViewController()
        if gesture.view === aboutProjectView.portraitOfDeveloperImage {
                vc.initialCardName = "Developer"
            } else if gesture.view === aboutProjectView.portraitOfDesignerImage {
                vc.initialCardName = "Designer"
            } else if gesture.view === aboutProjectView.portraitOfDoctorImage {
                vc.initialCardName = "Doctor"
            }
        vc.title = "О проекте"
        navigationController?.pushViewController(vc, animated: true)
    }
}
