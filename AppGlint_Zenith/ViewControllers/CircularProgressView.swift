import UIKit

class CircularProgressView: UIView {
    // MARK: - Properties
    private let sensoryColor = UIColor.systemRed
    private let calmingColor = UIColor.systemGreen
    private let interactiveColor = UIColor.systemBlue
    
    var sensoryValue: CGFloat = 0.5 {
        didSet { setNeedsDisplay() }
    }
    var calmingValue: CGFloat = 0.2 {
        didSet { setNeedsDisplay() }
    }
    var interactiveValue: CGFloat = 0.3 {
        didSet { setNeedsDisplay() }
    }
    
    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) * 0.4
        let startAngle = -CGFloat.pi / 2
        
        // Draw sensory section
        let sensoryEndAngle = startAngle + (2 * .pi * sensoryValue)
        context.setFillColor(sensoryColor.cgColor)
        context.move(to: center)
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: sensoryEndAngle, clockwise: false)
        context.closePath()
        context.fillPath()
        
        // Draw calming section
        let calmingEndAngle = sensoryEndAngle + (2 * .pi * calmingValue)
        context.setFillColor(calmingColor.cgColor)
        context.move(to: center)
        context.addArc(center: center, radius: radius, startAngle: sensoryEndAngle, endAngle: calmingEndAngle, clockwise: false)
        context.closePath()
        context.fillPath()
        
        // Draw interactive section
        let interactiveEndAngle = calmingEndAngle + (2 * .pi * interactiveValue)
        context.setFillColor(interactiveColor.cgColor)
        context.move(to: center)
        context.addArc(center: center, radius: radius, startAngle: calmingEndAngle, endAngle: interactiveEndAngle, clockwise: false)
        context.closePath()
        context.fillPath()
    }
} 