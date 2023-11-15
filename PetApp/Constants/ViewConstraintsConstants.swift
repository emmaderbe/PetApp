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
        static let generalLeading: CGFloat = 19
        static let generalTrailing: CGFloat = -19
        
        static let viewTop: CGFloat = 20
        static let viewLeading: CGFloat = 16
        static let viewTrailing: CGFloat = -16
        static let viewHeight: CGFloat = 160

        
        static let labelTop: CGFloat = 32
        static let labelBotton: CGFloat = -14
    }
    
}

