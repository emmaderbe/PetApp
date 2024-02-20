import UIKit

class CardViewController: UIViewController {
    private var cardViews: [CardView] = []
    private var currentCardIndex = 0
    var initialCardName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .accentBackground
        setupCards()
    }
    
    private func setupCards() {
        var cardData = [
            ("Developer", "Эмма", "Все началось с  идеи сделать мир лучше для четвероногих друзей, начиная с их питания. Каждый шаг в разработке и реализации PetDiet был результатом моего усердия и преданности делу. Сейчас я в поиске новых возможностей и открыта к сотрудничеству. Если вам нужен талантливый разработчик с креативным подходом и страстью к своему делу, свяжитесь со мной! Вместе мы сможем создать что-то удивительное."),
            ("Doctor", "Доктор", "Эмма пришла ко мне с идеей, и я приступила к созданию дизайна. У нас впереди много работы — в  планах добавить питание для кроликов и морских свинок. Я открыта к сотрудничеству и буду рада поработать над новым продуктом :) "),
            ("Designer", "Анастасия", "Эмма пришла ко мне с идеей, и я приступила к созданию дизайна. У нас впереди много работы — в  планах добавить питание для кроликов и морских свинок. Я открыта к сотрудничеству и буду рада поработать над новым продуктом :) "),
        ]
        if let initialCardName = initialCardName, let index = cardData.firstIndex(where: { $0.0 == initialCardName }) {
            let initialCard = cardData.remove(at: index)
            cardData.append(initialCard)
        }
        
        for (identifier, title, description) in cardData {
            let card = CardView()
            card.identifier = identifier
            card.configure(with: UIImage(named: "\(identifier.lowercased())image") ?? UIImage(), title: title, description: description)
            cardViews.append(card)
            view.addSubview(card)
            setupCardConstraints(card)
            addSwipeGesture(to: card)
        }
        
        resetCardPositions()
    }
    
    private func setupCardConstraints(_ card: CardView) {
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.widthAnchor.constraint(equalToConstant: 358),
            card.heightAnchor.constraint(equalToConstant: 634)
        ])
    }
    
    private func addSwipeGesture(to card: CardView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(_:)))
        card.addGestureRecognizer(panGesture)
    }
    
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
    
    private func animateCardRemoval(_ card: CardView, direction: SwipeDirection) {
        UIView.animate(withDuration: 0.3, animations: {
            let width = self.view.bounds.width
            let translationX = direction == .right ? width : -width
            card.transform = CGAffineTransform(translationX: translationX, y: 0)
            card.alpha = 0
        }, completion: { _ in
            card.removeFromSuperview()
            self.cardViews = self.cardViews.filter { $0 != card }
            self.resetCardPositions()
        })
    }
    
    private func resetCardPositions() {
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
        currentCardIndex = cardViews.indices.contains(currentCardIndex) ? currentCardIndex : 0
    }
    
    enum SwipeDirection {
        case left, right
    }
}
