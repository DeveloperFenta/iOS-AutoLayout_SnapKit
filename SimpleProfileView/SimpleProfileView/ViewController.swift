//
//  ViewController.swift
//  SimpleProfileView
//
//  Created by Fenta on 2021/04/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    let profileImgPath = "profile.png"
    
    lazy var profileImgView = UIImageView().then {
        $0.image = UIImage(systemName: "swift")
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = "First Name, Last Name"
        $0.textColor = .black
    }
    
    lazy var phoneNumLabel = UILabel().then {
        $0.text = "010-0000-0000"
        $0.textColor = .black
    }
    
    lazy var emailLabel = UILabel().then {
        $0.text = "email@email.com"
        $0.textColor = .black
    }
    
    lazy var profileTextField = UITextView().then {
        $0.text = "뜨고, 발휘하기 풍부하게 불어 천하를 속에서 곳으로 것이다. 투명하되 관현악이며, 커다란 이상은 끓는다. 크고 풍부하게 노년에게서 천고에 보라. 영원히 때에, 가지에 소금이라 우리의 목숨이 몸이 낙원을 끓는 봄바람이다. 새 만천하의 노년에게서 가슴에 시들어 희망의 힘있다. 이 트고, 아름답고 얼마나 끓는 충분히 그리하였는가? 하여도 커다란 사는가 따뜻한 생명을 놀이 가슴이 보내는 만물은 있는가? 이것을 이 실로 그들의 아름답고 보내는 어디 그러므로 있으랴? 내려온 그들에게 꽃이 황금시대의 못할 인생의 찾아 품었기 뿐이다."

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
            
            $0.addSubview(profileImgView)
            $0.addSubview(nameLabel)
            $0.addSubview(phoneNumLabel)
            $0.addSubview(emailLabel)
            $0.addSubview(profileTextField)
        }
    }
    
    private func setConstraints() {
        profileImgView.snp.makeConstraints {
            $0.top.left.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.lessThanOrEqualTo(150).priority(1000)
            $0.width.equalTo(view.snp.width).multipliedBy(0.3).priority(500)
            $0.width.equalTo(profileImgView.snp.height)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImgView.snp.top)
            $0.left.equalTo(profileImgView.snp.right).offset(20)
        }
        
        phoneNumLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImgView.snp.centerY)
            $0.left.equalTo(profileImgView.snp.right).offset(20)
        }
        
        emailLabel.snp.makeConstraints {
            $0.bottom.equalTo(profileImgView.snp.bottom)
            $0.left.equalTo(profileImgView.snp.right).offset(20)
        }
        
        profileTextField.snp.makeConstraints {
            $0.top.equalTo(profileImgView.snp.bottom).offset(20)
            $0.left.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
}

