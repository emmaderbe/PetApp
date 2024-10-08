import UIKit

// MARK: - Properties
class OnboardingVC: UIViewController {
    private lazy var firstView = generateOnboardingView(titleLabel: NSLocalizedString("onboardingTitleLabelFirstView", comment: ""), 
                                                        descriprionLabel: NSLocalizedString("onboardingDescriptionLabelFirstView", comment: ""),
                                                        image: ImageConstants.OnboardingView.iconOnboardingFirst)
    private lazy var secondView = generateOnboardingView(titleLabel: NSLocalizedString("onboardingTitleLabelSecondView", comment: ""),
                                                         descriprionLabel: NSLocalizedString("onboardingDescriptionLabelSecondView", comment: ""),
                                                         image: ImageConstants.OnboardingView.iconOnboardingSecond)
    private lazy var  thirdView = generateOnboardingView(titleLabel: NSLocalizedString("onboardingTitleLabelThirdView",
                                                                                       comment: ""),
                                                         descriprionLabel: NSLocalizedString("onboardingDescriptionLabelThirdView", comment: ""),
                                                         image: ImageConstants.OnboardingView.iconOnboardingThird)
    
    private lazy var views = [firstView, secondView, thirdView]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width , height: view.frame.height)
        }
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .accentOrange
        button.layer.cornerRadius = 16
        button.setTitle(NSLocalizedString("continueButton", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .accentGrey
        pageControl.currentPageIndicatorTintColor = .accentOrange
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
// MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpConstraints()
    }
}

// MARK: - setUpView()
extension OnboardingVC {
    private func setUpView() {
        view.backgroundColor = .accentBackground
        view.addSubview(scrollView)
        view.addSubview(continueButton)
        view.addSubview(pageControl)
    }
}


// MARK: - setUpConstraints()
extension OnboardingVC {
    private func setUpConstraints() {
        scrollView.edgeTo(view: view)
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.076),
            continueButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -24),
            
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

// MARK: - OnboardingViewController()
extension OnboardingVC {
    private func generateOnboardingView(titleLabel: String, descriprionLabel: String, image: String) -> OnboardingView {
        let onboardingView = OnboardingView()
        onboardingView.setupData(image: image,
                                 title: titleLabel,
                                 description: descriprionLabel)
        return onboardingView
    }
}

// MARK: - scrollViewDidScroll()
extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
               pageControl.currentPage = Int(pageIndex)
    }
}

// MARK: - pageControlTapHandler()
extension OnboardingVC {
    @objc func pageControlTapHandler(sender: UIPageControl) {
            let pageWidth = scrollView.bounds.width
            let offset = sender.currentPage * Int(pageWidth)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.scrollView.contentOffset.x = CGFloat(offset)
            }, completion: nil)
    }
}

// MARK: - nextButtonTapped()
extension OnboardingVC {
    @objc func nextButtonTapped() {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        if Int(pageIndex) < views.count - 1 {
            scrollView.scrollTo(horizotalPage: Int(pageIndex) + 1, animated: true)
        } else {
            didFinishOnboarding()
            let tabBarController = TabBarController()
            tabBarController.modalPresentationStyle = .fullScreen
            tabBarController.modalTransitionStyle = .crossDissolve
            present(tabBarController, animated: true)
        }
    }
}

// MARK: - didFinishOnboarding()
extension OnboardingVC {
    func didFinishOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
    }
}



