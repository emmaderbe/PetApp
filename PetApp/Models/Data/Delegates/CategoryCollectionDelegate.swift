import UIKit

protocol CategorySelectedDelegate: AnyObject {
    func categorySelected(_ category: DogProductTypeModelDTO)
}

final class CategoryCollectionDelegate: NSObject, UICollectionViewDelegate {
    private var dogCategory: [DogProductTypeModelDTO] = []
    weak var delegate: CategorySelectedDelegate?
}

extension CategoryCollectionDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = dogCategory[indexPath.item]
        delegate?.categorySelected(selectedCategory)
    }
}

extension CategoryCollectionDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
    }
}
