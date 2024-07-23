import UIKit

protocol FoodSelectionDelegate: AnyObject {
    func foodSelected(_ product: DogProductModelDTO)
}

final class FoodCollectionDelegate: NSObject, UICollectionViewDelegate {
    private var products: [DogProductModelDTO] = []
    weak var delegate: FoodSelectionDelegate?
}

extension FoodCollectionDelegate {
    func updateProducts(_ products: [DogProductModelDTO]) {
        self.products = products
    }
}

extension FoodCollectionDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.item]
        delegate?.foodSelected(selectedProduct)
    }
}

extension FoodCollectionDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = collectionView.contentInset
        let width = collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: VcConstraintsConstants.FoodCellConstraints.cellHeight)
    }
}

////MARK: - didSelectItemAt
//extension FoodCollectionView {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailVC = DetailVC()
//        let product = self.dogProductList[indexPath.row]
//        detailVC.title = product.product
//        detailVC.productInfo = product
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
//}
