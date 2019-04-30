//
//  FRTableViewAnimationViewController.swift
//  FRKit
//
//  Created by free on 2019/4/19.
//  Copyright © 2019 free. All rights reserved.
//

/**
 UITableView 动画控制器
 */

import UIKit

class FRTableViewAnimationViewController: UIViewController {
    
    //MARK:- properties
    fileprivate var colletionView : UICollectionView!
    
    /// 复用的 cell id
    let FRWaterfallCellID = "FRWaterfallCell"
    
    /// 数据
    let models : [FRWaterfallModel] = {
        let modelA = FRWaterfallModel(index: 0, title: "tableView 滚动效果")
        return [modelA]
    }()

    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "炫酷 UITableViewCell 动画效果"
        
        setupUI() // 初始化UI
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK:- private methods
    /// 初始化UI
    private func setupUI() {
        view.backgroundColor = .white
        setupCollectionView()
        view.addSubview(colletionView)
    }
    
    /// 初始化 collectionView
    private func setupCollectionView() {
        let layout = FRWaterfallLayout()
        var images = [UIImage]()
        for _ in 0..<models.count {  images.append(UIImage(named: "image1.jpg")!) }
        layout.items = images
        colletionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.backgroundColor = .white
        colletionView.register(UINib.init(nibName: "FRWaterfallCell", bundle: nil), forCellWithReuseIdentifier: "\(FRWaterfallCell.self)")
    }

}

extension FRTableViewAnimationViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "\(FRWaterfallCell.self)", for: indexPath) as! FRWaterfallCell
        cell.titleLabel.text = models[indexPath.row].title
        return cell
    }
    
}


