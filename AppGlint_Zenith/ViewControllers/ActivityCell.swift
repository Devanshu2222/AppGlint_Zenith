import UIKit
class ActivityCell: UICollectionViewCell {
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    func configure(with activity: Activity) {
        titleLabel.text = activity.title
        descriptionLabel.text = activity.description
        activityImageView.image = UIImage(named: activity.image)
        
        // Setup cell appearance
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.1
        
        playButton.layer.cornerRadius=15
    }
} 
