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
    
    private var fidgetToys: [FidgetToy] = []
    private var games: [Games] = []
    private var favouriteGames: [Games] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
        updateHeader()
        loadData()
        
        // Force collection views to reload
        scheduleCollectionView.reloadData()
        jumpBackCollectionView?.reloadData()
        favouriteCollectionView?.reloadData()
    }
    
    private func setupCollectionViews() {
        print("Setting up collection views")
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.register(FidgetToyCell.self, forCellWithReuseIdentifier: FidgetToyCell.identifier)
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
        
        // In a real app, you'd get the user's name from somewhere
        greetingLabel?.text = "Hello, Aditya"
    }
    
    private func loadData() {
        let defaultImage = UIImage(systemName: "leaf.fill")?
            .withTintColor(.white, renderingMode: .alwaysOriginal) ?? UIImage()
        
        fidgetToys = [
            FidgetToy(title: "Fidget toys", subtitle: "reduce anxiety.", image: defaultImage),
            FidgetToy(title: "Fidget toys", subtitle: "reduce anxiety.", image: defaultImage),
            FidgetToy(title: "Fidget toys", subtitle: "reduce anxiety.", image: defaultImage),
            FidgetToy(title: "Fidget toys", subtitle: "reduce anxiety.", image: defaultImage)
        ]
        
        // Sample games with system images
        games = [
            Games(title: "Bubble Game",
                 icon: UIImage(systemName: "bubble.right.fill") ?? UIImage(systemName: "square.fill")!,
                 backgroundColor: .systemPurple),
            Games(title: "Chat",
                 icon: UIImage(systemName: "message.fill") ?? UIImage(systemName: "square.fill")!,
                 backgroundColor: .systemTeal)
        ]
        
        // Add sample favourite games
        favouriteGames = [
            Games(title: "Memory Game",
                 icon: UIImage(systemName: "brain.head.profile") ?? UIImage(systemName: "square.fill")!,
                 backgroundColor: .systemIndigo),
            Games(title: "Puzzle",
                 icon: UIImage(systemName: "puzzlepiece.fill") ?? UIImage(systemName: "square.fill")!,
                 backgroundColor: .systemOrange)
        ]
        
        scheduleCollectionView.reloadData()
        jumpBackCollectionView?.reloadData()
        favouriteCollectionView?.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == scheduleCollectionView {
            return fidgetToys.count
        } else if collectionView == jumpBackCollectionView {
            return games.count
        } else {
            return favouriteGames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == scheduleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FidgetToyCell.identifier, for: indexPath) as! FidgetToyCell
            cell.configure(with: fidgetToys[indexPath.item])
            return cell
        } else if collectionView == jumpBackCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
            cell.configure(with: games[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
            cell.configure(with: favouriteGames[indexPath.item])
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

