//
//  GameCollectionViewCell.swift
//  Glint
//
//  Created by Tushita Srivastava(Chitkara) on 18/01/25.
//

import UIKit

class GameCardCell: UICollectionViewCell {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameSymbolLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8.0
    }
    
    func setup(with game: ExpoGame) {
        gameImageView.image = UIImage(named: game.image)
        gameNameLabel.text = game.name
        gameDescriptionLabel.text = game.description
        gameSymbolLabel.text = game.emoji
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("Play button tapped for \(gameNameLabel.text ?? "")")
    }
}
