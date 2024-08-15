import UIKit
import MessageUI
import SafariServices

// MARK: - Properties
final class CustomAlertViewController: UIViewController {
    
    private let backgroundView = ViewFactory.backgroundView(cornerRadius: 15)
    private let titleLabel = LabelFactory.montserratSemiBold17()
    private let messageLabel = LabelFactory.montserratRegular13()
    private var product: String = ""

    private let sendButton = {
        let button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.accentOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.accentGrey.withAlphaComponent(0.3).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let cancelButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.accentOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.accentGrey.withAlphaComponent(0.3).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let stackView = StackFactory.horizontalStackView(spacing: 0)
    
 // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupText()
        setupConstraints()
        setupButtonTargets()
    }
}

// MARK: - setupView()
private extension CustomAlertViewController {
    func setupView() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(messageLabel)
        backgroundView.addSubview(stackView)
        
        stackView.addArrangedSubview(sendButton)
        stackView.addArrangedSubview(cancelButton)
    }
    
    func setupText() {
        titleLabel.text = NSLocalizedString("titleLabelOfAletr", comment: "")
        messageLabel.text = NSLocalizedString("messageLabelOfAletr", comment: "")
    }
}

// MARK: - setupView()
private extension CustomAlertViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: VcConstraintsConstants.CustomAlertConstraints.backgroundWeight),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.titleTop),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.messageTop),
            messageLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.generalLeading),
            messageLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.generalTrailing),
            
            stackView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.stackTop),
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: VcConstraintsConstants.CustomAlertConstraints.stackHeight),
            
        ])
    }
}

// MARK: - setupButtonTargets()
private extension CustomAlertViewController {
    func setupButtonTargets() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
}

// MARK: - sendButtonTapped()
private extension CustomAlertViewController {
    @objc func sendButtonTapped() {
        sendMail()
        }
    }

// MARK: - cancelButtonTapped()
private extension CustomAlertViewController {
    @objc func cancelButtonTapped() {
        dismissWithFade()
    }
}

// MARK: - sendMail()
private extension CustomAlertViewController {
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["petdietapp@gmail.com"])
            mail.setSubject("Новый продукт")
            mail.setMessageBody("<p>Предлагаю добавить следующий продукт в список – \(self.product)</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            openFeedbackForm()
        }
    }
}

extension CustomAlertViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            self.dismissWithFade()
        }
    }
}

// MARK: - openFeedbackForm()
private extension CustomAlertViewController {
    func openFeedbackForm() {
        let feedbackURL = StringConstants.URL.newProductOfferURL
        if let url = URL(string: feedbackURL) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        } else {
            print("Invalid URL")
        }
    }
}

extension CustomAlertViewController {
    func updateProduct(product: String) {
        self.product = product
    }
    
   func presentWithFade(from parentViewController: UIViewController) {
        self.modalPresentationStyle = .overFullScreen
        self.view.alpha = 0
        parentViewController.present(self, animated: false) {
            UIView.animate(withDuration: 0.5) {
                self.view.alpha = 1.0
            }
        }
    }
    
     private func dismissWithFade() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0
        }) { _ in
            self.dismiss(animated: false)
        }
    }
}
