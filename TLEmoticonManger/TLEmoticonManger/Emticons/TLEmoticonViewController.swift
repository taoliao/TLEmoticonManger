//
//  TLEmoticonViewController.swift
//  TLEmoticonManger
//
//  Created by corepress on 2019/3/8.
//  Copyright © 2019年 LuckHand. All rights reserved.
//

import UIKit

private let cellID = "cellIDD"

class TLEmoticonViewController: UIViewController {

    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: EmoticonCollectionViewFlowLayout())
    private lazy var toolBar : UIToolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        setUpCollectionView()
        prepareForToolBar()
    }
    
}

extension TLEmoticonViewController {

    func setUpCollectionView() {
        view.addSubview(collectionView)
        view.addSubview(toolBar)
        
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.backgroundColor = UIColor.brown
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let views = ["tBar" : toolBar, "cView" : collectionView] as [String : Any]
        var cons = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tBar]-0-|", options: [], metrics: nil, views: views)
        cons += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[cView]-0-[tBar]-34-|", options: [.alignAllLeft,.alignAllRight], metrics: nil, views: views)
        view.addConstraints(cons)
        
    }
    func prepareForToolBar() {
        let titles = ["最近","默认","emoji","小浪花"]
        var tag = 0
        var barItems : [UIBarButtonItem] = [UIBarButtonItem]()
        
        for title in titles {
            let barItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(toolBarItemClick(barItem:)))
            barItem.tag = tag
            tag+=1
            barItems.append(barItem)
            barItems.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))//加弹簧分割
            
        }
        barItems.removeLast()
        toolBar.items = barItems
        toolBar.tintColor = UIColor.orange

    }
    
    @objc func toolBarItemClick(barItem : UIBarButtonItem) -> Void {
        
        print(barItem.title)
        
    }
    
    
}




extension TLEmoticonViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.red : UIColor.green
        
        return cell
    }
    

}

class EmoticonCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        let itemWidth = UIScreen.main.bounds.size.width/7
        itemSize = CGSize(width: itemWidth, height: itemWidth)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        collectionView!.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        scrollDirection = .horizontal
        let verticalMargrin = ((collectionView?.bounds.size.height)! - 3*itemWidth)/2
        collectionView?.contentInset = UIEdgeInsets(top: verticalMargrin, left: 0, bottom: verticalMargrin, right: 0)
        
    }
    
}
