import UIKit
import MessageUI
import SafariServices

// MARK: - Properties and viewDidLoad()
class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        editButton()

    }
}

// MARK: - setupView()
private extension SettingsViewController {
    func setupView() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        configureData()
    }
}

private extension SettingsViewController {
    func configureData() {
        settingsView.setupData(image: ImageConstants.AboutProject.mainImageSettingsView,
                               title: NSLocalizedString("titleLabelSettingsView", comment: ""),
                               description: NSLocalizedString("descriptionTitleASettingsView", comment: ""),
                               firstBttn: "О проекте",
                               secondBttn: "Обратная связь")
    }
}

// MARK: - editButton()
private extension SettingsViewController {
    func editButton() {
        settingsView.onAboutProjectButtonTap = { [weak self] in
            self?.showAboutProject()
        }
        settingsView.onSendMessageButtonTap = { [weak self] in
            self?.sendFeedbackForm()
        }
    }
}

// MARK: - showAboutProject()
private extension SettingsViewController {
    func showAboutProject() {
        let vc = AboutProjectViewController()
        vc.title = "О проекте"
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - sendFeedbackForm()
private extension SettingsViewController {
    func sendFeedbackForm() {
        sendMailByMessageUI()
    }
}

// MARK: - sendMailByMessageUI()
private extension SettingsViewController {
    func sendMailByMessageUI() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["petdietapp@gmail.com"])
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
        let feedbackURL = StringConstants.URL.feedbackFormURL
        if let url = URL(string: feedbackURL) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        } else {
            print("Invalid URL")
        }
    }
}
