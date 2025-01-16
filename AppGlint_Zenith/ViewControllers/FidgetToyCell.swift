import UIKit

class FidgetToyCell: UICollectionViewCell {
    static let identifier = "FidgetToyCell"
    
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
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        
        imageView.backgroundColor = .systemGray4
        titleLabel.backgroundColor = .systemGray5
        subtitleLabel.backgroundColor = .systemGray6
        
        contentView.layer.masksToBounds = true
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.1
        
        playButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        playButton.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(playButton)
        
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
    
    func configure(with toy: FidgetToy) {
        print("Configuring cell with toy: \(toy.title)")
        imageView.image = toy.image
        titleLabel.text = toy.title
        subtitleLabel.text = toy.subtitle
        
        setNeedsLayout()
        layoutIfNeeded()
    }
} 