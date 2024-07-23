import UIKit

protocol CategorySelectedDelegate: AnyObject {
    func categorySelected(_ category: DogProductTypeModelDTO)
}

final class CategoryCollectionDelegate: NSObject, UICollectionViewDelegate {
    private var dogCategory: [DogProductTypeModelDTO] = []
    weak var delegate: CategorySelectedDelegate?
}

extension CategoryCollectionDelegate {
    func updateTypes(_ types: [DogProductTypeModelDTO]) {
        self.dogCategory = types
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < dogCategory.count else {
            print("Index out of range")
            return
        }
        let selectedCategory = dogCategory[indexPath.item]
        delegate?.categorySelected(selectedCategory)
    }
}

extension CategoryCollectionDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
    }
}
