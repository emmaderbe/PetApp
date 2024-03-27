import Foundation

struct VcConstraintsConstants {
    
    // main vc
    struct MainVcConstraints {
        static let generalTop: CGFloat = 8
        static let generalLeading: CGFloat = 8
        static let generalTrailing: CGFloat = -8
        
        static let collectionTop: CGFloat = 13
        static let collectionHeight: CGFloat = 95
    }
    
    // detail vc
    struct DetailVcConstraints {
        static let collectionTop: CGFloat = 229
        static let collectionHeight: CGFloat = 31
        static let collectionWidth: CGFloat = 96
    }
    
    // food collection view
    struct FoodCellConstraints {
        static let lineSpacing: CGFloat = 0
        static let cellHeight: CGFloat = 56
    }
    
    // category collection view
    struct CategoryCellConstraints {
        static let lineSpacing: CGFloat = 24
        
        static let leftDestination: CGFloat = 16
        static let rightDestination: CGFloat = 16
        
        static let cellHeight: CGFloat = 95
        static let cellWidth: CGFloat = 72
    }
    
    // food mark collection view
    struct FoodMarkCellConstraints {
        static let lineSpacing: CGFloat = 16
        
        static let leftDestination: CGFloat = 16
        static let rightDestination: CGFloat = 16
        
        static let cellHeight: CGFloat = 31
        static let cellWidth: CGFloat = 96
    }
    
    // custom alert collection view
    struct CustomAlertConstraints {
        static let backgroundWeight: CGFloat = 270
        
        static let generalLeading: CGFloat = 16
        static let generalTrailing: CGFloat = -16
        
        static let titleTop: CGFloat = 19
        static let messageTop: CGFloat = 5
        static let textFieldTop: CGFloat = 12
        
        static let stackTop: CGFloat = 18
        static let stackHeight: CGFloat = 44
    }
}
