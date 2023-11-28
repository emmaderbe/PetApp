import UIKit

// MARK: - Properties and viewDidLoad()
class AboutProjectViewController: UIViewController {
    
    private let aboutProjectView = AboutProjectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - setupView()
extension AboutProjectViewController {
    private func setupView() {
        view.backgroundColor = .accentBackground
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
        let vc = MainVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
