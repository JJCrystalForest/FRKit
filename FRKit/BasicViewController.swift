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
    var reuseIdentifierID : String
    /// 方法名
    var method : String
}

class BasicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- property
    private var fr_pickerView_selectIndex = 0
    
    private let models : [CellModel] = {
        var models = [CellModel]()
        let model = CellModel(text: "FRPickerView (轻量级封装 UIPickerView)", reuseIdentifierID: "\(FRHomeCell.self)", method: "showPickerView")
        models.append(model)
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
        
        switch indexPath.row {
            
        case 0: self.showPickerView() // FRPickerView
            
        default: break
        }
    }

}

extension BasicViewController {
    
    //MARK:- FRPickerView
    private func showPickerView() {
        var titles = [String]()
        for index in 0..<100 { titles.append("test_" + "\(index)") }
        let picker = FRPickView(view.bounds, titles, fr_pickerView_selectIndex) { [weak self] (model) in
            self?.fr_pickerView_selectIndex = model.index
        }
        view.addSubview(picker)
    }
    
}
