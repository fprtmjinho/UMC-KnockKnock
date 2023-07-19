//
//  GroupMemberVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/20.
//

import UIKit
class GroupMemberVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    
    func makeSubView(){
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    
    func makeConstraint(){
        
    }
    
    func makeAddTarget(){
        addBtn.addTarget(self, action: #selector(addBtnFunc(_:)), for: .touchUpInside)
    }
    
    @objc func addBtnFunc(_: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "그룹 구성원"
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}
