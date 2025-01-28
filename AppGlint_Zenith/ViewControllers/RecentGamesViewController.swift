import UIKit

class RecentGamesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let gameManager = GameManager.shared
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 100
        }
    }

    // MARK: - UITableViewDataSource
    extension RecentGamesViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let recentGames = UserDataManager.shared.getRecentGames()
            
            // If no recent games, show a message
            if recentGames.isEmpty {
                let messageLabel = UILabel()
                messageLabel.text = "You haven't played any games yet."
                messageLabel.textAlignment = .center
                tableView.backgroundView = messageLabel
                return 0
            } else {
                tableView.backgroundView = nil
                return recentGames.count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecentGameCell", for: indexPath) as? RecentGameCell else {
                return UITableViewCell()
            }

            // Get recent games from UserDataManager
            let recentGames = UserDataManager.shared.getRecentGames()
            let game = recentGames[indexPath.row] // Fetch the specific game at the indexPath
            
            cell.configure(with: game) // Configure the cell with the recent game data
            
            return cell
        }
    }

    // MARK: - UITableViewDelegate
    extension RecentGamesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            // Handle game selection
        }
}
