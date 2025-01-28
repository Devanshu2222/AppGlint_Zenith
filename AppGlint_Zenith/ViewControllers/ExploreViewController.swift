import UIKit

class ExploreViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let categories = ["Recommended By Glint", "Calming Games", "Sensory", "Interactive"]

    var filteredGames: [(category: String, games: [ExpoGame])] = []

    var games: [[ExpoGame]] = [
        // Calming Games
        [
            ExpoGame(name: "Popping Bubble", description: "Helps children practice focus ", image: "calming_1", isParental: false),
            
            ExpoGame(name: "Flow Free", description: "Connect matching colors with pipes", image: "calming_2", isParental: false),
            
            ExpoGame(name: "Finger Tracing Maze", description: "Improve motor skills and focus", image: "calming_3", isParental: true),
            
            ExpoGame(name: "Feather Balance Challenge", description: "Practice patience", image: "calming_4", isParental: true)
        ],
        // Sensory Games
        [
            ExpoGame(name: "Sensory Fidget", description: "Virtual fidget toys", image: "sensory_1", isParental: false),
            
            ExpoGame(name: "PeekaBoo Barn", description: "Learn about animals", image: "sensory_2", isParental: false),
            
            ExpoGame(name: "Sensory Bin", description: "Explore textures ", image: "sensory_fidget", isParental: true),
            
            ExpoGame(name: "Shaving Cream", description: "Explore textures ", image: "sensory_4", isParental: true)
        ],
        // Interactive Games
        [
            ExpoGame(name: "Breathe,Think", description: "Learn problem-solving", image: "interactive_1", isParental: false),
            
            ExpoGame(name: "Charades", description: "Act out or guess", image: "interactive_2", isParental: false),
            
            ExpoGame(name: "Follow the Leader", description: "Improve coordination", image: "interactive_3", isParental: true),
            
            ExpoGame(name: "Simon Says", description: "Test listening skills", image: "interactive_4", isParental: true)
        ]
    ]

        override func viewDidLoad() {
            super.viewDidLoad()
            
            searchBar.delegate = self
            tableView.delegate = self
            tableView.dataSource = self
            
            filteredGames = zip(categories, games).map { (category, games) in
                (category: category, games: games)
            }
            
            // Tab bar customization
            if let tabBar = self.tabBarController?.tabBar {
                tabBar.isTranslucent = false
                tabBar.backgroundColor = .white
                tabBar.barTintColor = .white
            }
        }
        
        func gameTapped(category: String, game: ExpoGame) {
            self.navigationItem.title = "\(category): \(game.name)"
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                filteredGames = zip(categories, games).map { (category, games) in
                    (category: category, games: games)
                }
            } else {
                filteredGames = zip(categories, games).compactMap { (category, games) in
                    let filteredSectionGames = games.filter { $0.name.lowercased().contains(searchText.lowercased()) }
                    return filteredSectionGames.isEmpty ? nil : (category: category, games: filteredSectionGames)
                }
            }
            tableView.reloadData()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            filteredGames = zip(categories, games).map { (category, games) in
                (category: category, games: games)
            }
            tableView.reloadData()
            searchBar.resignFirstResponder()
        }
    }

    extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return filteredGames.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = .white
            
            let label = UILabel()
            label.text = filteredGames[section].category
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
            
            return headerView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? GameCollectionViewCell else {
                return UITableViewCell()
            }
            let sectionGames = filteredGames[indexPath.section].games
            cell.setup(with: sectionGames)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 129
        }
    }
