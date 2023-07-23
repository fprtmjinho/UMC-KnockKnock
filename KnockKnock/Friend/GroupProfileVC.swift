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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
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
        
    }
    func makeAddTarget(){
        groupProfileView.editmemberBtn.addTarget(self, action: #selector(editmemberBtnFunc(_:)), for: .touchUpInside)
        groupProfileView.groupAlarmBtn.addTarget(self, action: #selector(groupAlarmBtnFunc(_:)), for: .touchUpInside)
        
    }
    @objc func editmemberBtnFunc(_: UIButton){
        let groupmemberVC = GroupMemberVC()
        navigationController?.pushViewController(groupmemberVC, animated: true)
    }
    
    @objc func groupAlarmBtnFunc(_: UIButton){
        navigationController?.pushViewController(GroupAlarmVc(), animated: true)
    }
}
