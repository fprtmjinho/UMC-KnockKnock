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
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
    }
}

extension EditGroupVC{
    
    func makeSubView(){
        view.addSubview(scrollView)
        scrollView.addSubview(editGroupView)
        EditBtn = setNextBtn(view: self, title: "편집하기")
    }
    
    func makeConstraint(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        editGroupView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            editGroupView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            editGroupView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            editGroupView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            editGroupView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            editGroupView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        ])
        let contentViewHeight = editGroupView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
    }
    
    func makeAddTarget(){
        EditBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
    }
    
    @objc func editBtnFunc(_: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
