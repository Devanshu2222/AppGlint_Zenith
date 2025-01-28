import UIKit

class LineProgressView: UIView {
    // MARK: - Properties
    private let sensoryColor = UIColor.systemRed.withAlphaComponent(0.8)
    private let calmingColor = UIColor.systemGreen.withAlphaComponent(0.8)
    private let interactiveColor = UIColor.systemBlue.withAlphaComponent(0.8)
    private let barHeight: CGFloat = 12
    private let cornerRadius: CGFloat = 6
    private let barSpacing: CGFloat = 45
    // Adjust this value to add more or less space between the bars
    
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
        let totalHeight = (barHeight * 3) + (barSpacing * 2)
        let startY = (bounds.height - totalHeight) / 2
        
        // Draw sensory bar
        drawBar(at: startY, value: sensoryValue, color: sensoryColor)
        
        // Draw calming bar
        drawBar(at: startY + barHeight + barSpacing, value: calmingValue, color: calmingColor)
        
        // Draw interactive bar
        drawBar(at: startY + (barHeight + barSpacing) * 2, value: interactiveValue, color: interactiveColor)
    }
    
    private func drawBar(at yPosition: CGFloat, value: CGFloat, color: UIColor) {
        _ = UIGraphicsGetCurrentContext()
        
        // Background bar
        let backgroundPath = UIBezierPath(roundedRect: CGRect(x: 0, y: yPosition, width: bounds.width, height: barHeight), cornerRadius: cornerRadius)
        UIColor.tertiarySystemFill.setFill()
        backgroundPath.fill()
        
        // Progress bar with animation
        let progressWidth = bounds.width * value
        let progressPath = UIBezierPath(roundedRect: CGRect(x: 0, y: yPosition, width: progressWidth, height: barHeight), cornerRadius: cornerRadius)
        color.setFill()
        progressPath.fill()
    }
}
