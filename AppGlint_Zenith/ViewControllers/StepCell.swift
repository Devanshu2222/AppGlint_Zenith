import UIKit

protocol StepCellDelegate: AnyObject {
    func stepCircleTapped(at index: Int)
}

class StepCell: UITableViewCell {
    
    @IBOutlet weak var timelineView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var stepImageView: UIImageView!
    
    weak var delegate: StepCellDelegate?
    private var stepIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupGestures()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        // Configure circle view
        circleView.backgroundColor = .white
        circleView.layer.borderWidth = 2.5
        circleView.layer.borderColor = UIColor.systemBlue.cgColor
        circleView.layer.cornerRadius = 10
        circleView.layer.shadowColor = UIColor.black.cgColor
        circleView.layer.shadowOffset = CGSize(width: 0, height: 2)
        circleView.layer.shadowRadius = 4
        circleView.layer.shadowOpacity = 0.1
        
        // Configure card view
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 8
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.systemGray6.cgColor
        
        // Configure image view
        stepImageView.contentMode = .scaleAspectFit
        stepImageView.clipsToBounds = true
        stepImageView.backgroundColor = .systemGray6
        stepImageView.layer.cornerRadius = 12
    }
    
    private func setupGestures() {
        let circleTap = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        circleView.addGestureRecognizer(circleTap)
        circleView.isUserInteractionEnabled = true
        
        let cardTap = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        cardView.addGestureRecognizer(cardTap)
        cardView.isUserInteractionEnabled = true
    }
    
    func configure(with step: Step, stepNumber: Int) {
        stepIndex = stepNumber - 1
        titleLabel.text = step.title
        subtitleLabel.text = step.subtitle
        if step.markedDone {
            circleView.backgroundColor = .systemBlue
        } else {
            circleView.backgroundColor = .white
        }
        if step.image.contains("SF_") {
            // Handle SF Symbols
            var symbolName = step.image.replacingOccurrences(of: "SF_", with: "")
            stepImageView.image = UIImage(systemName: "star.fill")
            stepImageView.tintColor = .systemBlue
        } else {
            // Handle regular images
            stepImageView.image = UIImage(systemName: "star.fill")
            stepImageView.tintColor = nil
        }
    }
    
    @objc private func circleTapped() {
        delegate?.stepCircleTapped(at: stepIndex)
        
    }
    
    func animateCircle() {
        let scaleDown = CATransform3DMakeScale(0.8, 0.8, 1)
        let scaleUp = CATransform3DMakeScale(1.0, 1.0, 1)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.15)
        
        circleView.layer.transform = scaleDown
        
        UIView.animate(withDuration: 0.2) {
            if self.circleView.backgroundColor == .white {
                self.circleView.backgroundColor = .systemBlue
            } else {
                self.circleView.backgroundColor = .white
            }
            self.circleView.layer.transform = scaleUp
        }
        
        CATransaction.commit()
    }
} 
