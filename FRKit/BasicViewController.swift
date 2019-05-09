//
//  BasicViewComtroller.swift
//  FRKit
//
//  Created by free on 2019/4/16.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

/// cell 对应的 model
private struct CellModel {
    /// text
    var text : String
    /// 复用标识，与cell同名
    var reuseIdentifierID : String = "\(FRHomeCell.self)"
    /// 方法名
    var method : Selector
    
    init(text : String, method : Selector) {
        self.text = text
        self.method = method
    }
}

class BasicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- property
    private var fr_pickerView_selectIndex = 0
    
    private let models : [CellModel] = {
        
        var model1 = CellModel.init(text: "FRPickerView (轻量级封装 UIPickerView)", method: #selector(showPickerView))
        
        var model2 = CellModel.init(text: "炫酷 UITableViewCell 动画效果", method: #selector(toFRTableViewAnimationViewController))
        
        var model3 = CellModel.init(text: "仿灭霸动画消失效果", method: #selector(toMiebaViewController))
        
        var model4 = CellModel.init(text: "RxSwift Demo", method: #selector(toRxSwiftDemoViewController))
        
        let models = [model1, model2, model3, model4]
        
        return models
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        // 注册 cell
        for titleModel in self.models { tableView.register(UINib(nibName: titleModel.reuseIdentifierID, bundle: nil), forCellReuseIdentifier: titleModel.reuseIdentifierID) }
        tableView.rowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.separatorStyle = .none
        return tableView
    }()

    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    /// 初始化 UI
    private func setupUI() {
        navigationItem.title = "FRKit"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(tableView)
    }
    
    //MARK:- UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: models[indexPath.row].reuseIdentifierID, for: indexPath) as! FRHomeCell
        cell.titleLabel.text = models[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        perform(models[indexPath.row].method)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1)
        UIView.animate(withDuration: 0.5) {  cell.layer.transform = CATransform3DMakeScale(1, 1, 1)  }
    }

}

extension BasicViewController {
    
    //MARK:- FRPickerView
    @objc private func showPickerView() {
        var titles = [String]()
        for index in 0..<100 { titles.append("test_" + "\(index)") }
        let picker = FRPickView(view.bounds, titles, fr_pickerView_selectIndex) { [weak self] (model) in
            self?.fr_pickerView_selectIndex = model.index
        }
        view.addSubview(picker)
    }
    
    //MARK:- 炫酷 UITableViewCell 动画效果
    @objc private func toFRTableViewAnimationViewController() {
        navigationController?.pushViewController(FRTableViewAnimationViewController(), animated: true)
    }

    //MARK:- 灭霸消失效果
    @objc private func toMiebaViewController() {
        navigationController?.pushViewController(FRMiebaViewController(), animated: true)
    }
    
    //MARK:- RxSwift Demo
    @objc private func toRxSwiftDemoViewController() {
        navigationController?.pushViewController(FRRxSwfitViewController(), animated: true)
    }
    
}
