//
//  ViewController.swift
//  StackProfileView
//
//  Created by Fenta on 2021/04/07.
//

import UIKit
import SnapKit
import Then

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct MainVcRepresentble: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<MainVcRepresentble>) {
        print("updateUIView")
    }
    
    func makeUIView(context: Context) -> UIView { ViewController().view }
    
}
@available(iOS 13.0, *)
struct MainVcPreview: PreviewProvider {
    static var previews: some View { MainVcRepresentble() }
}
#endif

class ViewController: UIViewController {
    
    lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "swift")
    }
    
    lazy var firstNameLabel = UILabel().then {
        $0.text = "First"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    lazy var middleNameLabel = UILabel().then {
        $0.text = "Middle"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    lazy var lastNameLabel = UILabel().then {
        $0.text = "Last"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    lazy var nameLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    lazy var firstNameTextField = UITextField().then {
        $0.textAlignment = .left
        $0.keyboardType = .alphabet
        $0.placeholder = "Enter First Name"
        $0.borderStyle = .roundedRect
    }
    
    lazy var middleNameTextField = UITextField().then {
        $0.textAlignment = .left
        $0.keyboardType = .alphabet
        $0.placeholder = "Enter Middle Name"
        $0.borderStyle = .roundedRect
    }
    
    lazy var lastNameTextField = UITextField().then {
        $0.textAlignment = .left
        $0.keyboardType = .alphabet
        $0.placeholder = "Enter Last Name"
        $0.borderStyle = .roundedRect
    }
    
    lazy var nameTextFieldStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .equalSpacing
    }
    
    lazy var topPenelStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    lazy var profileTextField = UITextField().then {
        $0.text = "Test Text"
        
        $0.backgroundColor = .lightGray
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
            
            $0.addSubview(firstNameLabel)
            $0.addSubview(topPenelStackView)
            $0.addSubview(profileTextField)
        }

        nameLabelStackView.do { stackView in
            let subView = [firstNameLabel, middleNameLabel, lastNameLabel]
            subView.forEach{
                $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
                $0.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
                stackView.addArrangedSubview($0)
            }
            
            stackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        }

        nameTextFieldStackView.do { stackView in
            let subView = [firstNameTextField, middleNameTextField, lastNameTextField]
            subView.forEach {
                $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
                $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                stackView.addArrangedSubview($0)
            }
            
            stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        }

        topPenelStackView.do {stackView in
            let subView = [profileImageView, nameLabelStackView, nameTextFieldStackView]
            subView.forEach { stackView.addArrangedSubview($0) }
        }
    }
    
    private func setConstraints() {
        firstNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(firstNameTextField.snp.centerY)
        }
        
        middleNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(middleNameTextField.snp.centerY)
            $0.width.equalTo(nameLabelStackView)
        }
        
        lastNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(lastNameTextField.snp.centerY)
        }
        
        firstNameTextField.snp.makeConstraints {
            $0.width.equalTo(nameTextFieldStackView)
        }
        
        middleNameTextField.snp.makeConstraints {
            $0.width.height.equalTo(firstNameTextField)
        }
        
        lastNameTextField.snp.makeConstraints {
            $0.width.height.equalTo(firstNameTextField)
        }
        
        topPenelStackView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(profileImageView.snp.width)
            $0.height.equalTo(150)
        }
        
        profileTextField.snp.makeConstraints {
            $0.top.equalTo(topPenelStackView.snp.bottom).offset(20)
            $0.left.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}


