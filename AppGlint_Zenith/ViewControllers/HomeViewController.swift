//
//  ViewController.swift
//  GlintHome
//
//  Created by student-2 on 14/01/25.
//

import UIKit


class HomeViewController: UIViewController {

@IBOutlet private weak var scheduleCollectionView: UICollectionView!
@IBOutlet private weak var jumpBackCollectionView: UICollectionView!
@IBOutlet private weak var favouriteCollectionView: UICollectionView!
@IBOutlet private weak var greetingLabel: UILabel!
@IBOutlet private weak var dateLabel: UILabel!
@IBOutlet weak var recentLabel: UILabel!
@IBOutlet weak var favouriteLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViews()
        updateHeader()
        loadData()
        recentLabel.isHidden = true
        scheduleCollectionView.reloadData()
        jumpBackCollectionView?.reloadData()
        favouriteCollectionView?.reloadData()

        // Listen for updates
        NotificationCenter.default.addObserver(self, selector: #selector(updateRecentGames), name: NSNotification.Name("RecentGamesUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavGames), name: NSNotification.Name("FavGamesUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateSchedule), name: NSNotification.Name("ScheduleUpdated"), object: nil)
    }

    @objc private func updateRecentGames() {
        jumpBackCollectionView?.reloadData()
    }
    @objc private func updateFavGames() {
        favouriteCollectionView?.reloadData()
    }
    @objc private func updateSchedule() {
        scheduleCollectionView?.reloadData()
    }
    

    
    @IBAction func ButtonTapped(_ sender: Any) {
        let bubbleVC = BubbleViewController()
        bubbleVC.modalPresentationStyle = .fullScreen
        bubbleVC.modalTransitionStyle = .crossDissolve
        bubbleVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissViewController))
                present(bubbleVC, animated: true, completion: nil)
    }
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        updateHeader()
        UserDataManager.shared.populateFav()
        favouriteCollectionView.reloadData()
    }
    
    
    
    
    
    
    private func setupCollectionViews() {
            print("Setting up collection views")
            scheduleCollectionView.delegate = self
            scheduleCollectionView.dataSource = self
            scheduleCollectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.identifier)
            scheduleCollectionView.backgroundColor = .clear
            scheduleCollectionView.showsHorizontalScrollIndicator = false
            
            if let layout = scheduleCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                layout.itemSize = CGSize(width: 160, height: 280)
                layout.minimumLineSpacing = 16
                layout.minimumInteritemSpacing = 16
                layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            }
            
            // Safely setup jumpBackCollectionView
            if let jumpBackCollectionView = jumpBackCollectionView {
                jumpBackCollectionView.delegate = self
                jumpBackCollectionView.dataSource = self
                jumpBackCollectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
                jumpBackCollectionView.backgroundColor = .clear
                jumpBackCollectionView.showsHorizontalScrollIndicator = false
                
                if let layout = jumpBackCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 20
                    layout.minimumInteritemSpacing = 20
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                }
            }
            
            // Setup favouriteCollectionView
            if let favouriteCollectionView = favouriteCollectionView {
                favouriteCollectionView.delegate = self
                favouriteCollectionView.dataSource = self
                favouriteCollectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
                favouriteCollectionView.backgroundColor = .clear
                favouriteCollectionView.showsHorizontalScrollIndicator = false
                
                if let layout = favouriteCollectionView.collectionViewLayout as? UICollectionViewFlowLayout { 
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 20
                    layout.minimumInteritemSpacing = 20
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                }
            }
        }
        
        private func updateHeader() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMMM d"
            dateLabel?.text = dateFormatter.string(from: Date())
            
            // Check if user data exists and update greeting
            if let userData = UserDataManager.shared.getUserData() {
                greetingLabel?.text = "Hello, \(userData.childName)"
            } else {
                greetingLabel?.text = "Hello, Guest"
            }
        }
        
        private func loadData() {
            // Load your data as needed
            scheduleCollectionView.reloadData()
            jumpBackCollectionView?.reloadData()
            favouriteCollectionView?.reloadData()
        }
    }

    extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == scheduleCollectionView {
                return schedule.count
            } else if collectionView == jumpBackCollectionView {
                let recentGamesCount = UserDataManager.shared.getRecentGames().count
                
                // Show or hide the label based on the count of recent games
                if recentGamesCount == 0 {
                    recentLabel.isHidden = false  // Show "You haven't played any games"
                    jumpBackCollectionView.isHidden = true  // Hide collection view
                } else {
                    recentLabel.isHidden = true   // Hide the label
                    jumpBackCollectionView.isHidden = false  // Show collection view
                }
                
                return recentGamesCount
            } else {
                //return favouriteGames.count
                let favGamesCount = UserDataManager.shared.countFavGames()

                        // Show or hide the favorite games label
                        if favGamesCount == 0 {
                            favouriteLabel.isHidden = false  // Show "You haven't favorited any game"
                            favouriteCollectionView.isHidden = true  // Hide collection view
                        } else {
                            favouriteLabel.isHidden = true  // Hide the label
                            favouriteCollectionView.isHidden = false  // Show collection view
                        }

                        return favGamesCount
            }
        }

        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == scheduleCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCell.identifier, for: indexPath) as! ScheduleCell
                cell.configure(with: schedule[indexPath.item])
                return cell
            } else if collectionView == jumpBackCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
                //cell.configure(with: games[indexPath.item])
                let recentGames = UserDataManager.shared.getRecentGames()
                if indexPath.item < recentGames.count {
                    let game = recentGames[indexPath.item].toGames()
                    cell.configure(with: game)
                }
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
                cell.configure(with: favouriteGames[indexPath.item])
                let favGames = UserDataManager.shared.getFavGame()
                if indexPath.item < favGames.count {
                    let game = favGames[indexPath.item].toGames()
                    cell.configure(with: game)
                }
                return cell
            }
        }
    }

    extension HomeViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == scheduleCollectionView {
                return CGSize(width: 160, height: 280)
            } else {
                let width = collectionView.bounds.width - 32
                return CGSize(width: width * 0.85, height: 180)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 16
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 16
        }

    }
