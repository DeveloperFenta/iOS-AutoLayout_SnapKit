//
//  ViewController.swift
//  SimpleConstraints
//
//  Created by Fenta on 2021/04/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    lazy var viewOne = UIView().then {
        $0.backgroundColor = .blue
    }
    
    lazy var viewTwo = UIView().then {
        $0.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        view.do {
            $0.backgroundColor = .white
            $0.addSubview(viewOne)
            $0.addSubview(viewTwo)
        }
    }
    
    private func setConstraints() {
        let ratio = 0.5
        
        viewOne.snp.makeConstraints {
            $0.top.left.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.right.equalTo(viewTwo.snp.left).offset(-20)
            $0.width.greaterThanOrEqualTo(150).priority(250)
            $0.width.equalTo(viewTwo.snp.width).multipliedBy(ratio).priority(150)
        }
        
        viewTwo.snp.makeConstraints {
            $0.top.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}

