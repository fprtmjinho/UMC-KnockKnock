//
//  AddGroupVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddGroupVC : UIViewController {
    //스크롤뷰
    let scrollView : UIScrollView! = UIScrollView()
    
    var addBtn : UIButton = UIButton()
    let addGroupView : AddGroupView = {
        let view = AddGroupView()
       return view
    }()
    
    private func setScrollView(){
        //scrollView 설정
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
     
    }

    private func makeSubView(){
        scrollView.addSubview(addGroupView)
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    private func makeConstraint(){
        addGroupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addGroupView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            addGroupView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            addGroupView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            addGroupView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
      
    }
    /*
    func setScrollHeight(){
        let contentViewHeight = myProfilePage.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        let height = placetext.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        
        
    }*/
    
    private func makeAddTarget(){
        self.addGroupView.addmemberBtn.addTarget(self, action: #selector(addmemberFunc(_:)), for: .touchUpInside)
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }
    @objc func addmemberFunc(_: UIButton){
        //그룹 구성원 추가하기
        let memberVC = GroupMemberVC()
        navigationController?.pushViewController(memberVC, animated: true)
    }

    @objc func addBtnFunc(_: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 추가하기"
        setScrollView()
        //setScrollHeight()
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
  
    
}
