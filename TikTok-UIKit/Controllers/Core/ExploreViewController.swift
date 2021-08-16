//
//  ExploreViewController.swift
//  TikTok-UIKit
//
//  Created by PROGRAMAR on 21/05/21.
//

import UIKit





class ExploreViewController: UIViewController {

    private let searchBar: UISearchBar = {
       let bar = UISearchBar()
        bar.placeholder = "Search ... "
        bar.layer.cornerRadius = 8
        bar.layer.masksToBounds = true
        return bar
        
    }()
    
    private var sections = [ExploreSection]()
    
    private var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configureModels()
        setUpSearchBar()
        setUpCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func setUpSearchBar(){
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    
    func configureModels(){
        var cells = [ExploreCell]()
        for x in 0...99{
            let cell = ExploreCell.banner(
                viewModel: ExploreBannerViewModel(
                    image: nil, tile: "Food", handler: {
                
            }))
            cells.append(cell)
        }
        
        sections.append(
            ExploreSection(type: .banners, cells:cells
            )
        )
    }
    
    
    func setUpCollectionView(){
        let layout = UICollectionViewCompositionalLayout { section, _ ->NSCollectionLayoutSection? in
            return self.layout(for: section)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        self.collectionView = collectionView
    
    }
    
    
    func layout(for section: Int) -> NSCollectionLayoutSection{
        let sectionType = sections[section].type
        switch sectionType {
        
        case .banners:
            break
        case .trandingPosts:
            break
        case .trandingHashtags:
            break
        case .users:
            break
        case .recommended:
            break
        case .popular:
            break
        case .new:
            break
        }
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200)), subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        return sectionLayout
        
        
    }
}

extension ExploreViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = sections[indexPath.section].cells[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    
}


extension ExploreViewController : UISearchBarDelegate{
    
}
