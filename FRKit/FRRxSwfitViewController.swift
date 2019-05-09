//
//  FRRxSwfitViewController.swift
//  FRKit
//
//  Created by 杨馥瑞 on 2019/5/9.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FRRxSwfitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    /// 初始化UI
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.title = "RxSwift Demo"
        
    }
    
    private func UIDemo() {
        
        let textF = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 30))
        view.addSubview(textF)
        
    }
    
}
