//
//  GroupMemberVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/20.
//

import UIKit
class GroupMemberVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 구성원"
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}

extension GroupMemberVC {
    func makeSubView(){
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요!")
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    
    func makeConstraint(){
        NSLayoutConstraint.activate([
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            searchFriendBar.heightAnchor.constraint(equalToConstant: 45),
            ])
    }
    
    func makeAddTarget(){
        addBtn.addTarget(self, action: #selector(addBtnFunc(_:)), for: .touchUpInside)
    }
    
    
    @objc func addBtnFunc(_: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
