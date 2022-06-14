//
//  ViewController.swift
//  CollectionView+SwiftUI
//
//  Created by Ivan Pryhara on 13.06.22.
//

import UIKit
import SwiftUI
import Charts

class ViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCellConfig")
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }
    
    enum Section: Hashable {
        case main
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Stat>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Stat>
    
    var dataSource: DataSource!
    
    var items: [Stat] = [Stat(statistics: [Entity(time: 5, number: 33), Entity(time: 10, number: 15), Entity(time: 15, number: 20), Entity(time: 20, number: 54), Entity(time: 25, number: 47), Entity(time: 30, number: 31), Entity(time: 35, number: 28)]),
                         Stat(statistics: [Entity(time: 5, number: 15), Entity(time: 10, number: 30), Entity(time: 15, number: 25)]),
                         Stat(statistics: [Entity(time: 5, number: 10), Entity(time: 10, number: 10), Entity(time: 15, number: 40)]),
                         Stat(statistics: [Entity(time: 5, number: 10), Entity(time: 10, number: 20), Entity(time: 15, number: 80)]),
                         Stat(statistics: [Entity(time: 5, number: 90), Entity(time: 10, number: 60), Entity(time: 15, number: 45)])
    ]
    
    // MARK: Helper methods
    func configureDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellConfig", for: indexPath)
            
            cell.contentConfiguration = UIHostingConfiguration {
                // SwiftUI Block
                VStack(alignment: .leading) {
                    Spacer()
                    Label("Statistics", systemImage: "chart.bar.fill").padding(.leading, 15)
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        Spacer()
                        Chart(self.items[indexPath.item].statistics) { item in
                            LineMark(x: .value("Time", item.time),
                                     y: .value("Number", item.number)
                            )
                            .symbol(Circle().strokeBorder(lineWidth: 2))
                            .interpolationMethod(.catmullRom)
                        }
                        .chartYAxis(.hidden)
                        .chartXAxis(.hidden)
                        Spacer()
                    }
                    Spacer()
                }
                .border(.black, width: 4)
                .cornerRadius(10)
            }
            
            return cell
        })
        
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(self.items, toSection: .main)
        
        dataSource.apply(snapshot)
    }
}

// MARK: Create Layout
extension ViewController {
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            
            let padding: CGFloat = 10
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.8))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .fractionalWidth(0.5))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            group.interItemSpacing = .fixed(padding * 2)
            
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: 0)
            
            return section
        }
        return layout
    }
}
