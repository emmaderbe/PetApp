import UIKit

final class FoodMarkCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.FoodMarkCellConstraints.cellWidth, height: VcConstraintsConstants.FoodMarkCellConstraints.cellHeight)
    }
}
