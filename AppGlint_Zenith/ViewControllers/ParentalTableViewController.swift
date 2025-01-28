
//  ParentalTableViewController.swift
//  GlintParental
//
//  Created by student-2 on 16/01/25.
//

import UIKit

class ParentalTableViewController: UITableViewController {

    private var countdownTimer: Timer?
    private var remainingTime: TimeInterval = 0
    private var countdownPicker: UIDatePicker?
    private var startButton: UIButton?
    private var secondsLabel: UILabel?
    private var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTimerControls()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTimerControls()
    }

    private func setupTimerControls() {
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 2))?.contentView else {
            return
        }

        if countdownPicker == nil {
            if let picker = cell.subviews.first(where: { $0 is UIDatePicker }) as? UIDatePicker {
                countdownPicker = picker
                picker.addTarget(self, action: #selector(timerValueChanged), for: .valueChanged)
            }
        }

        if startButton == nil {
            if let button = cell.subviews.first(where: { $0 is UIButton }) as? UIButton {
                startButton = button
                button.layer.cornerRadius = 20
                button.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
            }
        }

        if secondsLabel == nil {
            if let label = cell.viewWithTag(0) as? UILabel ?? cell.subviews.first(where: { ($0 as? UILabel)?.text == "" }) as? UILabel {
                secondsLabel = label
                label.alpha = 0
            }
        }

        loadSavedTimerState()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func loadSavedTimerState() {
        if let savedTime = UserDefaults.standard.value(forKey: "TimerValue") as? TimeInterval {
            remainingTime = savedTime
            countdownPicker?.countDownDuration = savedTime

            if UserDefaults.standard.bool(forKey: "IsTimerRunning") {
                startTimer()
            }
        }
    }

    @objc private func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning {
            stopTimer()
        } else {
            startNewTimer()
        }

        UserDefaults.standard.set(isTimerRunning, forKey: "IsTimerRunning")
    }

    private func startNewTimer() {
        remainingTime = countdownPicker?.countDownDuration ?? 0
        guard remainingTime > 0 else { return }

        startTimer()
        startButton?.setTitle("Stop", for: .normal)
        startButton?.backgroundColor = .systemRed
        countdownPicker?.isEnabled = false

        UIView.animate(withDuration: 0.3) {
            self.countdownPicker?.alpha = 0
            self.secondsLabel?.alpha = 1
        }
        updateSecondsLabel()
    }

    private func stopTimer() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        isTimerRunning = false

        startButton?.setTitle("Start", for: .normal)
        startButton?.backgroundColor = .systemGreen
        countdownPicker?.isEnabled = true

        UIView.animate(withDuration: 0.3) {
            self.countdownPicker?.alpha = 1
            self.secondsLabel?.alpha = 0
        }
    }

    @objc private func timerValueChanged(_ picker: UIDatePicker) {
        remainingTime = picker.countDownDuration
        UserDefaults.standard.set(remainingTime, forKey: "TimerValue")
    }

    private func startTimer() {
        isTimerRunning = true
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.remainingTime > 0 {
                self.remainingTime -= 1
                self.countdownPicker?.countDownDuration = self.remainingTime
                self.updateSecondsLabel()
                
                if self.remainingTime == 0 {
                    self.timerFinished()
                }
            }
        }
    }

    private func updateSecondsLabel() {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        secondsLabel?.text = String(format: "%02d:%02d", minutes, seconds)
    }

    private func timerFinished() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        isTimerRunning = false
        
        startButton?.setTitle("Start", for: .normal)
        startButton?.backgroundColor = .systemGreen
        countdownPicker?.isEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.countdownPicker?.alpha = 1
            self.secondsLabel?.alpha = 0
        }
        
        showAlert(title: "Time's Up!", message: "The allocated time has expired.")
        UserDefaults.standard.removeObject(forKey: "TimerValue")
        UserDefaults.standard.set(false, forKey: "IsTimerRunning")
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isTimerRunning {
            UserDefaults.standard.set(remainingTime, forKey: "TimerValue")
            UserDefaults.standard.set(true, forKey: "IsTimerRunning")
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 2
        case 2: return 1
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}
