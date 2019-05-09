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
    
    let disposeBag = DisposeBag()
    
    lazy var button : UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setTitle("按我", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        button.rx.tap.subscribe(onNext: {
            print("button tap")
        }).disposed(by: disposeBag)
        
//        setupUI()

    }
    
    deinit {
        
    }
    
    /// 初始化UI
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.title = "RxSwift Demo"
        
        UIDemo()
        
    }
    
    private func UIDemo() {
        
        
        
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 30))
        label.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        view.addSubview(label)

    }
    
    @objc private func buttonTap() {
        print("button Tap Action")
    }
    
}
