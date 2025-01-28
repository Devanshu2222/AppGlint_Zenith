//
//  GameCollectionViewCell.swift
//  Glint
//
//  Created by Tushita Srivastava(Chitkara) on 18/01/25.
//

import UIKit

class GameCollectionViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var games: [ExpoGame] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 8
            flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)
            flowLayout.itemSize = CGSize(width: 150, height: 119)
        }
    }
    
    func setup(with games: [ExpoGame]) {
        self.games = games
        collectionView.reloadData()
    }
}

extension GameCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? GameCardCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: games[indexPath.item])
        return cell
    }
}
