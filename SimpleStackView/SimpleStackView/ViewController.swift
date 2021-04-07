//
//  ViewController.swift
//  SimpleStackView
//
//  Created by Fenta on 2021/04/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    lazy var imgLabel = UILabel().then {
        $0.text = "Image Text Label"
        $0.textAlignment = .center
    }
    
    lazy var imgView = UIImageView().then {
        $0.image = UIImage(systemName: "swift")
        $0.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
    }
    
    lazy var imgBtnToggle = false
    lazy var imgButton = UIButton(type: .system).then {
        $0.setTitle("Click", for: .normal)
        $0.addTarget(self, action: #selector(onClickImgButton), for: .touchUpInside)
    }
    
    lazy var imgStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        setConstraints()
    }
    
    @objc
    private func onClickImgButton() {
        imgBtnToggle.toggle()
        imgLabel.text = imgBtnToggle ? "Button Clicked!" : "Image Text Label"
    }
    
    private func setUI() {
        view.do {
            $0.backgroundColor = .white
            
            $0.addSubview(imgStackView)
        }
        
        imgStackView.do {
            $0.addArrangedSubview(imgLabel)
            $0.addArrangedSubview(imgView)
            $0.addArrangedSubview(imgButton)
        }
    }
    
    private func setConstraints() {
        imgStackView.snp.makeConstraints {
            $0.top.left.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

