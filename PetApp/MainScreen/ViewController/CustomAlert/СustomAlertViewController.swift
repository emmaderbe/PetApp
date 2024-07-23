import UIKit
import MessageUI
import SafariServices

// MARK: - Properties
final class CustomAlertViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    private let backgroundView = ViewFactory.backgroundView(cornerRadius: 15)
    private let titleLabel = LabelFactory.montserratSemiBold17()
    private let messageLabel = LabelFactory.montserratRegular13()
    
    private let textField = {
        let field = UITextField()
        field.placeholder = "..."
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
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
        backgroundView.addSubview(textField)
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
            
            textField.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.textFieldTop),
            textField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.generalLeading),
            textField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.generalTrailing),
            
            stackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: VcConstraintsConstants.CustomAlertConstraints.stackTop),
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
        if textField.hasText {
            sendMail()
        }
        }
    }

// MARK: - cancelButtonTapped()
private extension CustomAlertViewController {
    @objc func cancelButtonTapped() {
        dismiss(animated: true) {}
    }
}

// MARK: - sendMail()
private extension CustomAlertViewController {
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            let dogProduct: String = textField.text ?? ""
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["petdietapp@gmail.com"])
            mail.setSubject("Новый продукт")
            mail.setMessageBody("<p>Предлагаю добавить следующий продукт в список – \(dogProduct)</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            openFeedbackForm()
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
