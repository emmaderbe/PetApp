import UIKit
import SafariServices

// MARK: - Properties and viewDidLoad()
class CardViewController: UIViewController {
    private var cardViews: [CardView] = []
    private var cardData: [CardModel] = []
    var initialCardName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .accentBackground
        initializeCardData()
        setupCards()
    }
}

// MARK: - initializeCardData()
extension CardViewController {
    private func initializeCardData() {
        cardData = [
            CardModel(identifier: StringConstants.idDevCardData, title: StringConstants.titleDevCardData, description: StringConstants.descriptionDevCardData, profileURL: StringConstants.profileURLDev),
            CardModel(identifier: StringConstants.idDocCardData, title: StringConstants.titleDocCardData, description: StringConstants.descriptionDocCardData, profileURL: StringConstants.profileURLDoc),
            CardModel(identifier: StringConstants.idDesCardData, title: StringConstants.titleDesCardData, description: StringConstants.descriptionDesCardData, profileURL: StringConstants.profileURLDes),
        ]
        
        if let initialCardName = initialCardName, let index = cardData.firstIndex(where: { $0.identifier == initialCardName }) {
            let initialCard = cardData.remove(at: index)
            cardData.append(initialCard)
        }
    }
}

// MARK: - setupCards()
extension CardViewController {
    private func setupCards() {
        for card in cardData {
            let cardView = CardView()
            cardView.configure(with: UIImage(named: card.identifier) ?? UIImage(), title: card.title, description: card.description)
            cardView.profileButton.addTarget(self, action: #selector(cardButtonTapped(_:)), for: .touchUpInside)
            cardView.profileButton.tag = cardViews.count
            cardViews.append(cardView)
            view.addSubview(cardView)
            setupCardConstraints(cardView)
            addSwipeGesture(to: cardView)
        }
        editCardPositions()
    }
}

// MARK: - setupCardConstraints()
extension CardViewController {
    private func setupCardConstraints(_ card: CardView) {
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.widthAnchor.constraint(equalToConstant: 358),
            card.heightAnchor.constraint(equalToConstant: 634)
        ])
    }
}

// MARK: - editCardPositions()
extension CardViewController {
    private func editCardPositions() {
        for (index, card) in cardViews.enumerated() {
            UIView.animate(withDuration: 0.2) {
                card.transform = CGAffineTransform.identity.translatedBy(x: 0, y: CGFloat(index) * 20)
                
                card.alpha = 1.0
                card.layer.cornerRadius = 16
                card.layer.shadowColor = UIColor.black.cgColor
                card.layer.shadowOpacity = 0.1
                card.layer.shadowRadius = 5
                card.layer.shadowOffset = .zero
                
                card.layer.zPosition = CGFloat(index)
            }
        }
    }
}

// MARK: - addSwipeGesture()
extension CardViewController {
    private func addSwipeGesture(to card: CardView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(_:)))
        card.addGestureRecognizer(panGesture)
    }
}

// MARK: - handleCardPan()
extension CardViewController {
    @objc private func handleCardPan(_ gesture: UIPanGestureRecognizer) {
        guard let card = gesture.view as? CardView else { return }
        
        switch gesture.state {
        case .began, .changed:
            let translation = gesture.translation(in: view)
            card.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        case .ended, .cancelled:
            if abs(gesture.translation(in: view).x) > 100 {
                animateCardRemoval(card, direction: gesture.translation(in: view).x > 0 ? .right : .left)
            } else {
                UIView.animate(withDuration: 0.2) {
                    card.transform = .identity
                }
            }
        default:
            break
        }
    }
}

// MARK: - animateCardRemoval()
extension CardViewController {
    private func animateCardRemoval(_ card: CardView, direction: SwipeDirection) {
        UIView.animate(withDuration: 0.3, animations: {
            let width = self.view.bounds.width
            let translationX = direction == .right ? width : -width
            card.transform = CGAffineTransform(translationX: translationX, y: 0)
            card.alpha = 0
        }, completion: { _ in
            card.removeFromSuperview()
            self.cardViews = self.cardViews.filter { $0 != card }
            if self.cardViews.isEmpty {
                self.setupCardsAgain()
            } else {
                self.editCardPositions()
            }
        })
    }
    
    enum SwipeDirection {
        case left, right
    }
}

// MARK: - setupCardsAgain()
extension CardViewController {
    private func setupCardsAgain() {
        cardViews.forEach { $0.removeFromSuperview() }
        cardViews.removeAll()
        setupCards()
    }
}

// MARK: - cardButtonTapped()
extension CardViewController {
    @objc func cardButtonTapped(_ sender: UIButton) {
        let cardURL = cardData[sender.tag].profileURL
        openURL(cardURL: cardURL)
    }
}

// MARK: - openURL()
extension CardViewController {
    @objc private func openURL(cardURL: String) {
        if let url = URL(string: cardURL) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        } else {
            print("Invalid URL")
        }
    }
}
