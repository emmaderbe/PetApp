import UIKit

// MARK: - Properties and viewDidLoad()
class SettingsViewController: UIViewController {
    
    private let aboutProjectView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - setupView()
extension SettingsViewController {
    private func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(aboutProjectView)
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        aboutProjectView.translatesAutoresizingMaskIntoConstraints = false
        
        editButton()
    }
}

// MARK: - setupView()
extension SettingsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutProjectView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutProjectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutProjectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutProjectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SettingsViewController {
    private func editButton() {
        aboutProjectView.aboutProjectButton.onTap = { [weak self] in
            self?.showAboutProject()
        }
        aboutProjectView.sendMessageButton.onTap = { [weak self] in
            self?.showSendMessage()
        }
    }
}

// MARK: - showAboutProject()
extension SettingsViewController {
    private func showAboutProject() {
        let vc = AboutProjectViewController()
        vc.title = "О проекте"
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - showSendMessage()
extension SettingsViewController {
    private func showSendMessage() {
        let vc = MainVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
