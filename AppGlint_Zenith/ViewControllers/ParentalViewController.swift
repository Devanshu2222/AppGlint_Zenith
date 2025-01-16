//
//  ViewController.swift
//  GlintParental
//
//  Created by student-2 on 16/01/25.
//

import UIKit

class ParentalViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var lineGraph: LineProgressView!
    
    // MARK: - Properties
    private var hours: Int = 1
    private var minutes: Int = 20
    private var seconds: Int = 0
    private var timer: Timer?
    private var isTimerRunning = false
    private var sensoryProgress: CGFloat = 0.5
    private var calmingProgress: CGFloat = 0.2
    private var interactiveProgress: CGFloat = 0.3
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimerDisplay()
        updateProgressGraph()
    }
    
    // MARK: - IBActions
    @IBAction func hoursUpPressed(_ sender: UIButton) {
        hours = min(hours + 1, 23)
        updateTimerDisplay()
    }
    
    @IBAction func hoursDownPressed(_ sender: UIButton) {
        hours = max(hours - 1, 0)
        updateTimerDisplay()
    }
    
    @IBAction func minutesUpPressed(_ sender: UIButton) {
        minutes = min(minutes + 1, 59)
        updateTimerDisplay()
    }
    
    @IBAction func minutesDownPressed(_ sender: UIButton) {
        minutes = max(minutes - 1, 0)
        updateTimerDisplay()
    }
    
    @IBAction func secondsUpPressed(_ sender: UIButton) {
        seconds = min(seconds + 1, 59)
        updateTimerDisplay()
    }
    
    @IBAction func secondsDownPressed(_ sender: UIButton) {
        seconds = max(seconds - 1, 0)
        updateTimerDisplay()
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if isTimerRunning {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    // MARK: - Private Methods
    private func updateTimerDisplay() {
        hoursLabel.text = String(format: "%02d", hours)
        minutesLabel.text = String(format: "%02d", minutes)
        secondsLabel.text = String(format: "%02d", seconds)
    }
    
    private func startTimer() {
        guard !isTimerRunning else { return }
        
        isTimerRunning = true
        playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimer()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    
    private func updateTimer() {
        if seconds > 0 {
            seconds -= 1
        } else if minutes > 0 {
            minutes -= 1
            seconds = 59
        } else if hours > 0 {
            hours -= 1
            minutes = 59
            seconds = 59
        } else {
            stopTimer()
            // TODO: Handle timer completion (e.g., show alert, play sound)
        }
        
        updateTimerDisplay()
    }
    
    private func updateProgressGraph() {
        lineGraph.sensoryValue = sensoryProgress
        lineGraph.calmingValue = calmingProgress
        lineGraph.interactiveValue = interactiveProgress
        
        // Update percentage labels
        if let sensoryPercent = view.viewWithTag(1) as? UILabel {
            sensoryPercent.text = "\(Int(sensoryProgress * 100))%"
        }
        if let calmingPercent = view.viewWithTag(2) as? UILabel {
            calmingPercent.text = "\(Int(calmingProgress * 100))%"
        }
        if let interactivePercent = view.viewWithTag(3) as? UILabel {
            interactivePercent.text = "\(Int(interactiveProgress * 100))%"
        }
    }
}

