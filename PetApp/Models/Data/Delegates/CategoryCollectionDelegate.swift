import UIKit

protocol CategorySelectedDelegate: AnyObject {
    func categorySelected(_ category: DogProductTypeModelDTO?)
}

final class CategoryCollectionDelegate: NSObject, UICollectionViewDelegate {
    private var dogCategory: [DogProductTypeModelDTO] = []
    weak var delegate: CategorySelectedDelegate?
    private var selectedIndexPath: IndexPath?
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
        
        if selectedIndexPath == indexPath {
            if let previousCell = collectionView.cellForItem(at: indexPath) as? CategoryViewCell {
                previousCell.selectCategory(isSelected: false)
            }
            selectedIndexPath = nil
            delegate?.categorySelected(nil)
        } else {
            if let previousSelectedIndexPath = selectedIndexPath {
                if let previousCell = collectionView.cellForItem(at: previousSelectedIndexPath) as? CategoryViewCell {
                    previousCell.selectCategory(isSelected: false)
                }
            }
            
            selectedIndexPath = indexPath
            
            let selectedCategory = dogCategory[indexPath.item]
            delegate?.categorySelected(selectedCategory)
            
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryViewCell {
                cell.selectCategory(isSelected: true)
            }
        }
    }
}

extension CategoryCollectionDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
    }
}
