//
//  ProfileTableViewCell.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 23/12/24.
//

import UIKit






class ProfileTableViewCell: UITableViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let messengerIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message.circle.fill")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(messengerIconView)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            messengerIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            messengerIconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            messengerIconView.widthAnchor.constraint(equalToConstant: 24),
            messengerIconView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}



//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
   
    // Configure the view for the selected state
//        if selected {
//            accessoryType = .checkmark
//        } else {
//            accessoryType = .none
//        }
