//
//  ViewController.swift
//  GlintResource
//
//  Created by student-2 on 15/01/25.
//

import UIKit

class ResourcesViewController: UIViewController {
  
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var sections: [ResourceSection] = [
        ResourceSection(title: "", items: [
            ResourceItem(title: "Understand your child more", backgroundColor: .systemCyan, linkURL: URL(string: "https://pmc.ncbi.nlm.nih.gov/articles/PMC1350917/"), imageName: "Resource_1"),
            ResourceItem(title: "Activities to be done at home", backgroundColor: .systemBlue, linkURL: URL(string: "https://www.mywellnesshub.in/blog/home-based-occupational-therapy-activities/"), imageName: "Resource_2")
        ]),
        ResourceSection(title: "Discover helpful resources", items: [
            ResourceItem(title: "Language based autism", backgroundColor: .systemCyan, linkURL: URL(string: "https://www.sciencedirect.com/science/article/pii/S1750946724001363"), imageName: "Resource_3"),
            ResourceItem(title: "Communication based autism", backgroundColor: .systemBlue, linkURL: URL(string: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6516977/"), imageName: "Resource_4")
        ]),
        ResourceSection(title: "About Us", items: [
            ResourceItem(title: "Language based autism", backgroundColor: .systemCyan, linkURL: URL(string: "https://www.sciencedirect.com/science/article/pii/S1750946724001363"), imageName: "Resource_5")
        ])
    ]
    
    private var filteredSections: [ResourceSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        filteredSections = sections // Initialize filteredSections with all sections
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchBar.delegate = self // Set the search bar delegate
    }
    
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.register(ResourceCard.self, forCellWithReuseIdentifier: ResourceCard.identifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.createFeaturedSection()
            case 1:
                return self?.createDiscoverSection()
            case 2:
                return self?.createTeamSection()
            default:
                return self?.createFeaturedSection()
            }
        }
    }
    
    private func createFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createDiscoverSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createTeamSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

// MARK: - UICollectionViewDataSource
extension ResourcesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return filteredSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResourceCard.identifier, for: indexPath) as? ResourceCard else {
            return UICollectionViewCell()
        }
        
        let item = filteredSections[indexPath.section].items[indexPath.item]
        
        // Load the image from assets using the imageName property
        let backgroundImage = item.imageName != nil ? UIImage(named: item.imageName!) : nil
        
        cell.configure(with: item.title, backgroundColor: item.backgroundColor, backgroundImage: backgroundImage)
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        let label = UILabel()
        label.text = filteredSections[indexPath.section].title
        label.font = .systemFont(ofSize: 22, weight: .bold)
        
        header.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: header.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8)
        ])
        
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension ResourcesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = filteredSections[indexPath.section].items[indexPath.item]
        if let url = item.linkURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: - UISearchBarDelegate
extension ResourcesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // If the search bar is empty, show all resources
            filteredSections = sections
        } else {
            // Filter the sections based on the search text
            filteredSections = sections.map { section in
                // Filter the items within each section based on the search text
                let filteredItems = section.items.filter { item in
                    item.title.lowercased().contains(searchText.lowercased())
                }
                return ResourceSection(title: section.title, items: filteredItems)
            }.filter { !$0.items.isEmpty } // Remove sections with no items
        }
        
        // Reload the collection view to reflect the changes
        collectionView.reloadData()
    }
}
