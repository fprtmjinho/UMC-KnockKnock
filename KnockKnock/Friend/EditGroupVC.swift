//
//  EditGroupVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/05.
//

import UIKit
class EditGroupVC : UIViewController {
    var EditBtn : UIButton = UIButton()
    
    let scrollView : UIScrollView = UIScrollView()
    
    let editGroupView : EditGroupView = {
       let view = EditGroupView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.title = "모임 편집하기"
        
    }
}

extension EditGroupVC{
    
    func makeSubView(){
        view.addSubview(scrollView)
        scrollView.addSubview(editGroupView)
        EditBtn = setNextBtn(view: self, title: "편집하기")
    }
    
    func makeConstraint(){
        
    }
    
    func makeAddTarget(){
        EditBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
    }
    
    @objc func editBtnFunc(_: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
