//
//  FriendListVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class FriendListVC: UIViewController {
    
    var addFriendBtn : UIButton = UIButton()
    
    func makeSubView() {
        
    }
    
    func makeConstraint() {
        
    }
    
    func makeAddTarget(){
        self.addFriendBtn.addTarget(self, action: #selector(addFriendFunc(_:)), for: .touchUpInside)
    }
    
    @objc func addFriendFunc(_: UIButton){
        let addBFVC = AddBFVC()
        //찐친 추가하기
        addBFVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addBFVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFriendBtn = setNextBtn(view: self, title: "찐친 추가하기")
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}
