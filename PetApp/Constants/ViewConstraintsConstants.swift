import Foundation

struct ViewConstraintsConstants {
    
    // onboarding view
    struct OnboardingViewConstraints {
        static let generalTop: CGFloat = 16
        static let generalLeading: CGFloat = 24
        static let generalTrailing: CGFloat = -24
        
        static let imageTop: CGFloat = 132
        static let imageHeight: CGFloat = 300

        static let labelTop: CGFloat = 80
        static let labelWight: CGFloat = 0.87692308
    }
    
    // detail view
    struct DetailViewConstraints {
        static let generalTop: CGFloat = 22
        static let generalLeading: CGFloat = 16
        static let generalTrailing: CGFloat = -16
        
        static let imageTop: CGFloat = 20
        static let imageLeading: CGFloat = 19
        static let imageHeight: CGFloat = 189
        static let imageWidth: CGFloat = 352

        static let labelTop: CGFloat = 83
        static let labelWight: CGFloat = 358
    }
    
    // food view cell
    struct FoodViewConstraints {
        static let generalTop: CGFloat = 22
        static let generalLeading: CGFloat = 16
        static let generalTrailing: CGFloat = -16
        
        static let imageTop: CGFloat = 12
        static let imageWigth: CGFloat = 32
        static let imageBottom: CGFloat = -12
        
        static let indicatorTop: CGFloat = 22
        static let indicatorLeading: CGFloat = 22
        static let indicatorHeight: CGFloat = 10
        
        static let likeHeight: CGFloat = 24
    }
    
    // category view cell
    struct CategoryViewConstraints {
        static let imageWidth: CGFloat = 72

        static let labelHeight: CGFloat = 15
    }
    
    // product Content Unavailable View
    struct ProductContentUnavailableConstraints {
        static let generalTop: CGFloat = 24
        static let generalLeading: CGFloat = 19
        static let generalTrailing: CGFloat = -19
        static let generalBottom: CGFloat = -30
        
        static let viewTop: CGFloat = 20
        static let viewLeading: CGFloat = 16
        static let viewTrailing: CGFloat = -16
        static let viewHeight: CGFloat = 160

        static let labelTop: CGFloat = 32
        static let labelBotton: CGFloat = -14
    }
    
    // settings View
    struct SettingsViewConstraints {
        static let imageHeight: CGFloat = 380
        
        static let viewTop: CGFloat = -70
        
        static let labelTop: CGFloat = 26
        
        static let generalLeading: CGFloat = 21
        static let generalTrailing: CGFloat = -21
        static let generalButtonHeight: CGFloat = 64
        
        static let firstButtonTop: CGFloat = 30
        static let secondButtonTop: CGFloat = 16

    }
    
    // about Project View
    struct AboutProjectView {
        static let imageHeight: CGFloat = 160
        static let imageWeight: CGFloat = 160
        
        static let generalTop: CGFloat = 85
        static let generalLeading: CGFloat = 16
        static let generalTrailing: CGFloat = -16
        static let generalButton: CGFloat = -20
        
        static let labelTop: CGFloat = 16
        static let scrollTop: CGFloat = 16
        
        static let buttonHeight: CGFloat = 64
    }
    
}

