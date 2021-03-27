//
//  ViewController.swift
//  VarietySolutions
//
//  Created by Fenta on 2021/03/26.
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
        
        setUI()
        
        // Three methods work the same.
        setConstraintsOne()
//        setConstraintsTwo()
//        setConstraintsThree()
    }
    
    private func setUI() {
        view.do {
            $0.backgroundColor = .white
            $0.addSubview(viewOne)
            $0.addSubview(viewTwo)
        }
    }
    
    private func setConstraintsOne() {
        viewOne.snp.makeConstraints {
            $0.top.left.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.right.equalTo(viewTwo.snp.left).offset(-20)
            $0.width.equalTo(viewTwo.snp.width)
        }
        
        viewTwo.snp.makeConstraints {
            $0.top.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setConstraintsTwo() {
        viewOne.snp.makeConstraints {
            $0.top.left.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.right.equalTo(viewTwo.snp.left).offset(-20)
        }
        
        viewTwo.snp.makeConstraints {
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.top.bottom.equalTo(viewOne)
        }
    }
    
    private func setConstraintsThree() {
        viewTwo.snp.makeConstraints {
            $0.top.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        viewOne.snp.makeConstraints {
            $0.width.top.bottom.equalTo(viewTwo)
            $0.left.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.right.equalTo(viewTwo.snp.left).offset(-20)
        }
    }

}

