//
//  ViewController.swift
//  GlintParentalGame
//
//  Created by Tushita Srivastava(Chitkara) on 19/01/25.
//

import UIKit


class ParentalGamesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
} 

// MARK: - UITableView DataSource & Delegate
extension ParentalGamesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepCell", for: indexPath) as! StepCell
        let step = steps[indexPath.row]
        cell.configure(with: step, stepNumber: indexPath.row + 1)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - StepCell Delegate
extension ParentalGamesViewController: StepCellDelegate {
    func stepCircleTapped(at index: Int) {
        guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? StepCell else { return }
        steps[index].markedDone.toggle()
        cell.animateCircle()
        self.navigationItem.title = "Parental Games" 
    }
}

