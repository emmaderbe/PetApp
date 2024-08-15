import UIKit

final class FoodMarkCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var productType: [DogProductTypeModelDTO] = []
}

extension FoodMarkCollectionDataSource {
    func updateType(_ type: [DogProductTypeModelDTO]) {
        self.productType = type
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productType.count
    }
}

extension FoodMarkCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodMarkViewCell.identifier, for: indexPath) as? FoodMarkViewCell
        else { return UICollectionViewCell() }
        let category = productType[indexPath.row]
        cell.setupData(image: category.backgroundType,
                       label: category.type)
        return cell
    }
}

extension FoodMarkCollectionDataSource: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.FoodMarkCellConstraints.cellWidth,
                       height: VcConstraintsConstants.FoodMarkCellConstraints.cellHeight)
    }
}
