import UIKit

struct ScheduleItem {
    var title: String
    var subtitle: String
    var image: UIImage
    var icon: UIImage
    var backgroundColor: UIColor
    var category: Category
    var isFavourite: Bool
    var isParental: Bool
    var time: Date
}

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var scheduleItems: [ScheduleItem] = []
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addButton.target = self
        addButton.action = #selector(addScheduleItem)
        
        loadSampleData()
    }
    
    private func loadSampleData() {
        scheduleItems = convertToScheduleItems(from: schedule)
        tableView.reloadData()
    }
    
    @objc private func addScheduleItem() {
        let pickerVC = PickerViewController()
        pickerVC.delegate = self
        pickerVC.modalPresentationStyle = .formSheet
        present(pickerVC, animated: true)
    }
}

func convertToScheduleItems(from activities: [Activites]) -> [ScheduleItem] {
    var scheduleItems: [ScheduleItem] = []
    let calendar = Calendar.current
    let now = Date()
    var currentTime = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: now)!
    
    for activity in activities {
        let scheduleItem = ScheduleItem(
            title: activity.title,
            subtitle: activity.subtitle,
            image: activity.image,
            icon: activity.icon,
            backgroundColor: activity.backgroundColor,
            category: activity.category,
            isFavourite: activity.isFavourite,
            isParental: activity.isParental,
            time: currentTime
        )
        
        scheduleItems.append(scheduleItem)
        currentTime = calendar.date(byAdding: .minute, value: 90, to: currentTime)!
    }
    
    return scheduleItems
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath)
        let item = scheduleItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = dateFormatter.string(from: item.time)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedItem = scheduleItems[indexPath.row]
            scheduleItems.remove(at: indexPath.row)
            schedule.removeAll { $0.title == removedItem.title && $0.subtitle == removedItem.subtitle }
            tableView.deleteRows(at: [indexPath], with: .fade)
            NotificationCenter.default.post(name: NSNotification.Name("ScheduleUpdated"), object: nil)
        }
    }
}

// MARK: - PickerViewControllerDelegate
extension ScheduleViewController: PickerViewControllerDelegate {
    func didAddScheduleItem(_ item: ScheduleItem) {
        if !scheduleItems.contains(where: { $0.title == item.title && $0.subtitle == item.subtitle }) {
            scheduleItems.append(item)
            schedule.append(Activites(
                title: item.title,
                subtitle: item.subtitle,
                image: item.image,
                icon: item.icon,
                backgroundColor: item.backgroundColor,
                category: item.category,
                isFavourite: item.isFavourite,
                isParental: item.isParental
            ))
            scheduleItems.sort { $0.time < $1.time }
            tableView.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name("ScheduleUpdated"), object: nil)
        }
    }
}
