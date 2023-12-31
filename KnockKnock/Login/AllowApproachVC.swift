//
//  AllowApproachVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class AllowApproachVC : UIViewController {
    
    var nextBtn : UIButton = UIButton()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.text = "연락처 권한을\n허락해주세요!"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel : UILabel = {
       let label = UILabel()
        label.text = "시작하기 전에 회원님의 연락처를\n불러오려고 해요.\n\n스마트폰에서 연락처 접근 권한을 물어보면\n'승인'을 선택해주세요!"
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    func makeSubView(){
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        
        ])
        
    }
    
    func makeAddTarget(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        self.nextBtn.addTarget(self, action: #selector(popUpFunc(_:)), for: .touchUpInside)
    }
    
    @objc func popUpFunc(_: UIButton){
        
       let alert = UIAlertController(title: "'낙낙'이(가) 사용자의 연락처에\n접근하려고 합니다.",
                                     message: "App required contact permission to\nread phone number of mobile",
                                     preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default){ action in
            //handler
            let loginAddFriendVC = LoginAddFriendVC()
            self.navigationController?.pushViewController(loginAddFriendVC, animated: true)
        }
        let notok = UIAlertAction(title: "허용 안 함", style: .cancel){ action in
            
        }
        
        alert.addAction(ok)
        alert.addAction(notok)
        
        self.present(alert, animated: true)
    }
    
    @objc func skipBtnFunc(_: UIBarButtonItem){
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
    }
}

