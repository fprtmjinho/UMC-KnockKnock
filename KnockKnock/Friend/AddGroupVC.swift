//
//  AddGroupVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/15.
//

import UIKit
class AddGroupVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    
    
    private func makeSubView(){
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    private func makeConstraint(){
        
        
    }
    private func makeAddTarget(){
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }
    
    @objc func addBtnFunc(_: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 추가하기"
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
}
