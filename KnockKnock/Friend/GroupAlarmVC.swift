//
//  GroupAlarmVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class GroupAlarmVc : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 연락 알림"
        
    }
}

extension GroupAlarmVc {
    func makeSubView(){
        saveBtn = setNextBtn(view: self, title: "저장하기")
    }
    func makeConstraint(){
        
    }
    func makeAddTarget(){
        saveBtn.addTarget(self, action: #selector(saveBtnFunc(_:)), for: .touchUpInside)
    }
    @objc func saveBtnFunc(_: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
