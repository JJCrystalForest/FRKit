//
//  BasicViewComtroller.swift
//  FRKit
//
//  Created by free on 2019/4/16.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

struct TitleModel {
    var text : String
}

class BasicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- property
    private var fr_pickerView_selectIndex = 0
    
    private let models : [TitleModel] = {
        var models = [TitleModel]()
        let model = TitleModel(text: "FRPickerView (轻量级封装 UIPickerView)")
        models.append(model)
        return models
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "\(FRBasicCell.self)", bundle: nil), forCellReuseIdentifier: "\(FRBasicCell.self)")
        tableView.rowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FRBasicCell.self)", for: indexPath) as! FRBasicCell
        cell.titleLabel.text = models[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {  // FRPickerView
        case 0:
            self.showPickerView()
        default:
            break
        }
    }

}

extension BasicViewController {
    
    //MARK:- FRPickerView
    private func showPickerView() {
        var titles = [String]()
        for index in 0..<100 { titles.append("test_" + "\(index)") }
        let picker = FRPickView(UIScreen.main.bounds, titles, fr_pickerView_selectIndex) { [weak self] (model) in
            self?.fr_pickerView_selectIndex = model.index
        }
        view.addSubview(picker)
    }
    
}
