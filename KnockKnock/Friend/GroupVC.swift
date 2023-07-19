//
//  GroupVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GroupVC: UIViewController {
    
    var addGroupBtn : UIButton = UIButton()

    private func makeSubView() {
        addGroupBtn = setNextBtn(view: self, title: "그룹 추가하기")
    }
    
    private func makeConstraint() {
        
    }
    
    private func makeAddTarget(){
           self.addGroupBtn.addTarget(self, action: #selector(addGroupFunc(_:)), for: .touchUpInside)
    }

    @objc func addGroupFunc(_: UIButton){
           let addGroupVC = AddGroupVC()
           //찐친 추가하기
           addGroupVC.hidesBottomBarWhenPushed = true
           self.navigationController?.pushViewController(addGroupVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

              makeSubView()
              makeConstraint()
              makeAddTarget()
    }
    
}

/*
 
 extension GroupVC : UITableViewDelegate, UITableViewDataSource {
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 <#code#>
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 <#code#>
 }
 
 
}
 */
 
