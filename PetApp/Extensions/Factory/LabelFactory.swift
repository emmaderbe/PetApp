import UIKit

final class LabelFactory {
    static func montserratRegular16() -> UILabel {
        let label = UILabel()
        label.font = .montserratRegular16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func montserratSemiBold12() -> UILabel {
        let label = UILabel()
        label.font = .montserratSemiBold12()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .accentText
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func montserratBold16() -> UILabel {
        let label = UILabel()
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func montserratSemiBold20() -> UILabel {
        let label = UILabel()
        label.font = .montserratSemiBold20()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .accentText
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func montserratSemiBold24() -> UILabel {
        let label = UILabel()
        label.font = .montserratSemiBold24()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    
}
