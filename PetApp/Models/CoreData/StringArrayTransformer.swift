import Foundation

//@objc(StringArrayTransformer)
//class StringArrayTransformer: ValueTransformer {
//    override class func transformedValueClass() -> AnyClass {
//        return NSData.self
//    }
//    
//    override class func allowsReverseTransformation() -> Bool {
//        return true
//    }
//    
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let array = value as? [String] else { return nil }
//        do {
//            let data = try JSONSerialization.data(withJSONObject: array, options: [])
//            return data
//        } catch {
//            return nil
//        }
//    }
//    
//    override func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let data = value as? Data else { return nil }
//        do {
//            let array = try JSONSerialization.jsonObject(with: data, options: []) as? [String]
//            return array
//        } catch {
//            return nil
//        }
//    }
//}

@objc(StringArrayTransformer)
class StringArrayTransformer: NSSecureUnarchiveFromDataTransformer {
    override static var allowedTopLevelClasses: [AnyClass] {
        return [NSArray.self, NSString.self]
    }
}
