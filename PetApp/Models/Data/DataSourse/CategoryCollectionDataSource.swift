import UIKit

final class CategoryCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var dogTypes: [DogProductTypeModelDTO] = []
}

extension CategoryCollectionDataSource {
    func updateTypes(_ types: [DogProductTypeModelDTO]) {
        self.dogTypes = types
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogTypes.count
    }
}

extension CategoryCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as? CategoryViewCell
        else { return UICollectionViewCell() }
        let category = dogTypes[indexPath.row]
        cell.setupCell(image: category.photo,
                       label: category.type)
        return cell
    }
}

//extension CategoryCollectionDataSource: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
//    }
//}
