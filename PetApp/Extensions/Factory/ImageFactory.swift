import UIKit

final class ImageFactory {
    static func imageViewAspectFit(cornerRadius: CGFloat) -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = cornerRadius
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    static func imageViewAspectFill(cornerRadius: CGFloat) -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = cornerRadius
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
