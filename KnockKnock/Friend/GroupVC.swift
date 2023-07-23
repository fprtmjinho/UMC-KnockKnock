//
//  GroupVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GroupVC: UIViewController {
    
    var addGroupBtn : UIButton = UIButton()
    var tableView = UITableView(frame: .zero, style: .plain)
  
    var groupList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setTableView()
              makeSubView()
              makeConstraint()
              makeAddTarget()
        
    }
    
}

 
 extension GroupVC : UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return groupList.count
     }
 
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "groupList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "groupList")
         cell.backgroundColor = .systemGray6
         cell.accessoryType = .disclosureIndicator
         
         cell.textLabel?.text = groupList[indexPath.row]
         //cell.detailTextLabel?.text = numberList[indexPath.row]
         cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
         cell.textLabel!.textColor = UIColor.black
        // cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
         //cell.detailTextLabel!.textColor = UIColor.systemGray2
         
         //subtitle style로 지정해서 subtitle에 구성원 이름을 간략히 넣는건 어떤지
         return cell
    }
 
     func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
         return 60
         //row 두께 설정
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath)
         nextView(index:indexPath)
     }
     
     func setTableView(){
         tableView.backgroundColor = .white
         tableView.separatorStyle = .none
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "groupList")
         
         self.tableView.dataSource = self
         self.tableView.delegate = self

     }
 
}

 
extension GroupVC {
    private func makeSubView() {
        view.addSubview(tableView)
        addGroupBtn = setNextBtn(view: self, title: "그룹 추가하기")
    }
    
    private func makeConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
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
    @objc func nextView(index:IndexPath) {
        let nextView = GroupProfileVC()
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
}
