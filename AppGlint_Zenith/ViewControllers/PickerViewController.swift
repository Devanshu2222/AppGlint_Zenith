import UIKit

protocol PickerViewControllerDelegate: AnyObject {
    func didAddScheduleItem(_ item: ScheduleItem)
}

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var delegate: PickerViewControllerDelegate?
    
    // Data Model
    private let scheduleItems: [Activites] = UserDataManager.shared.getAllGames() // Updated to use allGames
    private var selectedActivity: Activites?
    private var selectedTime = Date()
    
    // UI Components
    private let gamePicker = UIPickerView()
    private let timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        selectedActivity = scheduleItems.first // Default selection
    }
    
    private func setupUI() {
        // Game Picker
        gamePicker.delegate = self
        gamePicker.dataSource = self
        gamePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gamePicker)
        
        // Time Picker
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timePicker)
        
        // Buttons
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        buttonStack.addArrangedSubview(cancelButton)
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        buttonStack.addArrangedSubview(saveButton)
        
        view.addSubview(buttonStack)
        
        // Layout Constraints
        NSLayoutConstraint.activate([
            gamePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gamePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gamePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            timePicker.topAnchor.constraint(equalTo: gamePicker.bottomAnchor, constant: 20),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveTapped() {
        guard let selectedActivity = selectedActivity else { return }
        
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.hour, .minute], from: timePicker.date)
        
        if let scheduleTime = calendar.date(bySettingHour: components.hour ?? 0,
                                            minute: components.minute ?? 0,
                                            second: 0,
                                            of: now) {
            let newItem = ScheduleItem(
                title: selectedActivity.title,
                subtitle: selectedActivity.subtitle,
                image: selectedActivity.image,
                icon: selectedActivity.icon,
                backgroundColor: selectedActivity.backgroundColor,
                category: selectedActivity.category,
                isFavourite: selectedActivity.isFavourite,
                isParental: selectedActivity.isParental,
                time: scheduleTime
            )
            delegate?.didAddScheduleItem(newItem)
        }
        dismiss(animated: true)
    }
    
    // MARK: - UIPickerView DataSource & Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scheduleItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scheduleItems[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedActivity = scheduleItems[row]
    }
}
