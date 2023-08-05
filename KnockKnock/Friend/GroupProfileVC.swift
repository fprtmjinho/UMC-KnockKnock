//
//  GroupProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class GroupProfileVC : UIViewController {
    let groupProfileView : GroupProfileView = {
       let view = GroupProfileView()
        return view
    }()
    
    let scrollView : UIScrollView = UIScrollView()
    
    
    let group = Group.shared
    
    var groupName: String = ""
    var groupMember: [String] = []
    var groupPlace: String = ""
    var groupTime: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        editNavigationBarBtn()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        groupProfileView.membertableView.reloadData()
       // groupProfileView.settableView()
        makeAddTarget()
    }
}

extension GroupProfileVC {
    func makeSubView(){
        view.addSubview(scrollView)
        scrollView.addSubview(groupProfileView)
    }
    
    func makeConstraint(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        groupProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groupProfileView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            groupProfileView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            groupProfileView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            groupProfileView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            groupProfileView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        let contentViewHeight = groupProfileView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
    }
    func makeAddTarget(){
        groupProfileView.groupAlarmSwitch.addTarget(self, action: #selector(groupAlarmSwitchFunc(_:)), for: .touchUpInside)
        
    }
    @objc func editmemberBtnFunc(_: UIButton){
        let groupmemberVC = GroupMemberVC()
        navigationController?.pushViewController(groupmemberVC, animated: true)
    }
    
    @objc func groupAlarmSwitchFunc(_: UIButton){
        //그룹 알림 on/off 설정
    }
    
    func editNavigationBarBtn(){
        let editbtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarBtnFunc(_:)))
        editbtn.tintColor = .systemGray2
        navigationItem.rightBarButtonItem = editbtn
    }
    
    @objc func editNavigationBarBtnFunc(_: UINavigationItem){
        navigationController?.pushViewController(EditGroupVC(), animated: true)
    }
}
