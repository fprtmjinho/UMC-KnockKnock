//
//  LoginAddBestFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class LoginAddBestFriendVC : LoginAddFriendVC {
    //이전 VC 상속
    

    
    override func makeSubView(){
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(searchFriendBar)
        
        nextBtn = setNextBtn(view: self, title: "다음")
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요")
    }
    
    override func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchFriendBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            searchFriendBar.topAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.bottomAnchor),
            searchFriendBar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
    }
    
   override func makeAddTarget(){
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        self.nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    
    @objc override func nextView(_: UIButton){
        let loginSuccessVC = LoginSuccessVC()
        self.navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    @objc override func skipBtnFunc(_: UIBarButtonItem){
         let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }
    
    override func setLabel(){
        titleLabel.text = "정말 친한 친구,\n'찐친'을 골라주세요!"
        subtitleLabel.text = "자신과 정말 친한 찐친들의 연락처를 골라주세요.\n\n2개월에 한 번씩 알림을 보내드릴게요.\n연락 주기는 추후에 변경이 가능합니다!"
    }
    //일부 글씨만 두껍게 수정해야 함
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
        setLabel()
    }
    
}
