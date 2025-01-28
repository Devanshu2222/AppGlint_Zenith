//import UIKit
//import Charts
//
//class ProgressTrackingViewController: UIViewController {
//    
//    // MARK: - IBOutlets
//    @IBOutlet weak var segmentControl: UISegmentedControl!
//    @IBOutlet weak var goalsLabel: UILabel!
//    @IBOutlet weak var progressLabel: UILabel!
//    @IBOutlet weak var todayLabel: UILabel!
//    @IBOutlet weak var chartContainer: UIView!
//    @IBOutlet weak var highlightsLabel: UILabel!
//    
//    // MARK: - Properties
//    private var barChartView: BarChartView!
//    private let categories = ["Sensory", "Calming", "Interactive"]
//    private let days = ["Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed"]
//    
//    // Sample data - replace with your actual data source
//    private let sensoryData = [25, 12, 0, 0, 28, 0, 10]
//    private let calmingData = [0, 18, 0, 15, 30, 0, 0]
//    private let interactiveData = [0, 0, 0, 0, 0, 0, 0]
//    
//    // Add these properties at the top of the class
//    private var dailyData: [String: [Double]] = [
//        "Sensory": [5, 8, 12, 15, 7, 10, 6, 9, 11, 13, 8, 14],
//        "Calming": [7, 10, 8, 12, 6, 9, 11, 8, 13, 7, 10, 9],
//        "Interactive": [3, 6, 9, 4, 8, 5, 7, 10, 6, 8, 11, 7]
//    ]
//
//    private var weeklyData: [String: [Double]] = [
//        "Sensory": [25, 12, 0, 0, 28, 0, 10],
//        "Calming": [0, 18, 0, 15, 30, 0, 0],
//        "Interactive": [0, 0, 0, 0, 0, 0, 0]
//    ]
////
//    private var monthlyData: [String: [Double]] = [
//        "Sensory": [45, 55, 40, 50],
//        "Calming": [35, 45, 50, 40],
//        "Interactive": [25, 30, 35, 40]
//    ]
//
//    // Update the existing properties
//    private var currentTimeLabels: [String] = []
//    private var currentData: [String: [Double]] = [:]
//    
//    // MARK: - Lifecycle Methods
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupChart()
//        
//        // Initialize with weekly view
//        setupWeeklyView()
//        updateChartData()
//    }
//    
////    // MARK: - Private Methods
//    private func setupUI() {
//        // Configure segment control
//        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
//        
//        // Set up labels
//        progressLabel.text = "50% completed"
//        todayLabel.text = "Today"
//    }
////
//    private func setupChart() {
//        // Initialize bar chart
//        barChartView = BarChartView()
//        barChartView.frame = chartContainer.bounds
//        barChartView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        chartContainer.addSubview(barChartView)
//        
//        // Configure chart appearance
//        barChartView.rightAxis.enabled = false
//        barChartView.leftAxis.axisMinimum = 0
//        barChartView.leftAxis.axisMaximum = 40
//        barChartView.leftAxis.drawGridLinesEnabled = false
//        
//        // X-axis configuration
//        let xAxis = barChartView.xAxis
//        xAxis.labelPosition = .bottom
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
//        xAxis.drawGridLinesEnabled = false
//        xAxis.granularity = 1
////
//        // Legend configuration
//        let legend = barChartView.legend
//        legend.horizontalAlignment = .left
//        legend.verticalAlignment = .top
//        legend.orientation = .horizontal
//        legend.drawInside = true
//        legend.form = .circle
//    }
////
//    private func updateChartData() {
//        var dataSets: [BarChartDataSet] = []
//        
//        // Create data sets for each category using currentData
//        for (category, data) in currentData {
//            let entries = data.enumerated().map { BarChartDataEntry(x: Double($0), y: Double($1)) }
//            let dataSet = BarChartDataSet(entries: entries, label: category)
//            
//            // Set colors based on category
//            switch category {
//            case "Sensory":
//                dataSet.setColor(.systemOrange)
//            case "Calming":
//                dataSet.setColor(.systemGreen)
//            case "Interactive":
//                dataSet.setColor(.systemBlue)
//            default:
//                break
//            }
//            
//            dataSets.append(dataSet)
//        }
////
//        // Create and set chart data
//        let groupedData = BarChartData(dataSets: dataSets)
//        groupedData.barWidth = 0.2
//        
//        // Calculate grouping
//        let groupSpace = 0.3
//        let barSpace = 0.05
//        
//        // Set the group spacing
//        groupedData.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
//        
//        barChartView.data = groupedData
//        barChartView.animate(yAxisDuration: 1.0)
//        
//        // Update progress label based on current view
//        updateProgressLabel()
//    }
//    
//    private func updateProgressLabel() {
//        var totalCompleted = 0
////        var totalPossible = 0
//        
//        for data in currentData.values {
//            totalCompleted += data.filter { $0 > 0 }.count
//            totalPossible += data.count
//        }
//        
//        let percentage = (Double(totalCompleted) / Double(totalPossible)) * 100
//        progressLabel.text = "\(Int(percentage))% completed"
//    }
//    
//    // MARK: - Actions
//    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
//        navigationController?.popViewController(animated: true)
//    }
//    
//    @objc private func segmentChanged(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0: // Daily view
//            setupDailyView()
//        case 1: // Weekly view
//            setupWeeklyView()
//        case 2: // Monthly view
//            setupMonthlyView()
//        default:
//            break
//        }
//        updateChartData()
//    }
//    
//    private func setupDailyView() {
//        // Set up daily labels (hours)
//        currentTimeLabels = ["8AM", "9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM"]
//        currentData = dailyData
//        
//        // Update UI
//        goalsLabel.text = "Daily goals"
//        updateAxisForDaily()
//    }
////
//    private func setupWeeklyView() {
//        // Set up weekly labels
//        currentTimeLabels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
//        currentData = weeklyData
//        
//        // Update UI
//        goalsLabel.text = "Weekly goals"
//        updateAxisForWeekly()
//    }
//    
//    private func setupMonthlyView() {
//        // Set up monthly labels
//        currentTimeLabels = ["Week 1", "Week 2", "Week 3", "Week 4"]
//        currentData = monthlyData
//        
//        // Update UI
//        goalsLabel.text = "Monthly goals"
//        updateAxisForMonthly()
//    }
//    
//    private func updateAxisForDaily() {
//        let xAxis = barChartView.xAxis
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: currentTimeLabels)
//        xAxis.labelCount = currentTimeLabels.count
//        xAxis.granularity = 1
//        
//        barChartView.leftAxis.axisMaximum = 20 // Adjust based on your daily data range
//        barChartView.leftAxis.axisMinimum = 0
//    }
//    
//    private func updateAxisForWeekly() {
//        let xAxis = barChartView.xAxis
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: currentTimeLabels)
//        xAxis.labelCount = currentTimeLabels.count
//        xAxis.granularity = 1
//        
//        barChartView.leftAxis.axisMaximum = 40 // Adjust based on your weekly data range
//        barChartView.leftAxis.axisMinimum = 0
//    }
//    
//    private func updateAxisForMonthly() {
//        let xAxis = barChartView.xAxis
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: currentTimeLabels)
//        xAxis.labelCount = currentTimeLabels.count
//        xAxis.granularity = 1
//        
//        barChartView.leftAxis.axisMaximum = 60 // Adjust based on your monthly data range
//        barChartView.leftAxis.axisMinimum = 0
//    }
//}
//
//// MARK: - ChartViewDelegate
//extension ProgressTrackingViewController: ChartViewDelegate {
//    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//        // Handle chart value selection
//        print("Selected value: \(entry.y) at index: \(entry.x)")
//    }
//}
