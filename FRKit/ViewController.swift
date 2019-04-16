//
//  ViewController.swift
//  FRKit
//
//  Created by free on 2019/4/15.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var titles = [String]()
        for index in 0..<100 { titles.append("test_" + "\(index)") }
        let picker = FRPickView(UIScreen.main.bounds, titles) { print("\($0)") }
        view.addSubview(picker)
    }

}

