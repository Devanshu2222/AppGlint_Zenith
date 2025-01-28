import UIKit

class RecentGameCell: UITableViewCell {
    
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        gameImageView.layer.cornerRadius = 12
        gameImageView.clipsToBounds = true
        gameImageView.backgroundColor = .systemGray6
        gameImageView.contentMode = .scaleAspectFill
    }
    
    func configure(with game: Activites) {
        // Set the game title
        titleLabel.text = game.title
        
        // Format the played date
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        timeLabel.text = "Played at \(formatter.string(from: game.playedDate))"
        timeLabel.text = "Played at 00:00"
//
//        // Calculate and set the duration
//        let hours = Int(game.playDuration / 3600)
//        let minutes = Int((game.playDuration.truncatingRemainder(dividingBy: 3600)) / 60)
        
//        if hours > 0 {
//            durationLabel.text = "Duration: \(hours)h \(minutes)m"
//        } else {
//            durationLabel.text = "Duration: \(minutes) minutes"
//        }
        
        // Set the game image (replace this if you have custom images for games)
        gameImageView.image = game.icon
        gameImageView.tintColor = .systemBlue
    }
}
