import UIKit
import MessageUI
import SafariServices

// MARK: - Properties and viewDidLoad()
class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
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

// MARK: - editButton()
extension SettingsViewController {
    private func editButton() {
        aboutProjectView.aboutProjectButton.onTap = { [weak self] in
            self?.showAboutProject()
        }
        aboutProjectView.sendMessageButton.onTap = { [weak self] in
            self?.sendFeedbackForm()
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

// MARK: - sendFeedbackForm()
extension SettingsViewController {
    private func sendFeedbackForm() {
        sendMailByMessageUI()
    }
}

// MARK: - sendMailByMessageUI()
extension SettingsViewController {
    private func sendMailByMessageUI() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["emmaderbejoss@gmail.com"])
            mail.setSubject("Обратная связь")
            mail.setMessageBody("<p>Напишите здесь свою обратную связь. Спасибо! </p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            openWebForm()
        }
    }
}

// MARK: - openWebForm()
extension SettingsViewController {
    private func openWebForm() {
        let feedbackURL = "https://forms.gle/eectpNoQJymGaciE6"
        if let url = URL(string: feedbackURL) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        } else {
            print("Invalid URL")
        }
    }
}
