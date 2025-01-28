import UIKit

class ScheduleCell: UICollectionViewCell {
    static let identifier = "ScheduleCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(playButton)
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            playButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 12),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            playButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    var title: String?
    var background: UIColor?
    var icon: UIImage?
    var category: Category?
    var isFavourite: Bool?
    var isParental:Bool?
    func configure(with toy: Activites) {
        print("Configuring cell with toy: \(toy.title)")
        imageView.image = toy.image
        titleLabel.text = toy.title
        title=toy.title
        subtitleLabel.text = toy.subtitle
        background=toy.backgroundColor
        icon=toy.icon
        category=toy.category
        isFavourite=toy.isFavourite
        isParental=toy.isParental
    }
    
    private func findParentViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
    
    @objc private func playButtonTapped() {
        print("Play button tapped for: \(titleLabel.text ?? "Unknown")")

        guard let parentViewController = findParentViewController() else { return }

        guard let gameTitle = titleLabel.text,
              let gameSubtitle = subtitleLabel.text,
              let gameImage = imageView.image,
              let icon = icon,
              let background = background,
              let category = category,
              let isFavourite = isFavourite,
              let isParental = isParental else {
            print("Error: Missing game data")
            return
        }

        // Create a game object and add it to recent games
        let gameData = Activites(
            title: gameTitle,
            subtitle: gameSubtitle,
            image: gameImage,
            icon: icon,
            backgroundColor: background,
            category: category,
            isFavourite: isFavourite,
            isParental: isParental
        )

        UserDataManager.shared.addRecentGame(gameData)

        // Send notification to update recent games in HomeViewController
        NotificationCenter.default.post(name: NSNotification.Name("RecentGamesUpdated"), object: nil)

        // Navigate to the game screen
        let storyboard = UIStoryboard(name: "Bubble", bundle: nil)
        if let bubbleVC = storyboard.instantiateViewController(withIdentifier: "BubbleViewController") as? BubbleViewController {
            bubbleVC.isFavourite = isFavourite
            bubbleVC.Gametitle=title
            parentViewController.present(bubbleVC, animated: true, completion: nil)
        }
    }


}
