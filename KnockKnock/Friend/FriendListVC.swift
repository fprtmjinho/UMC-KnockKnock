//
//  FriendListVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//
import UIKit

class FriendListVC: UIViewController {
    var addFriendBtn : UIButton = UIButton()
    
    func makeSubView() {
        addFriendBtn = setNextBtn(view: self, title: "찐친 추가하기")
    }
    
    func makeConstraint() {
        
    }
    func makeAddTarget(){
          self.addFriendBtn.addTarget(self, action: #selector(addFriendFunc(_:)), for: .touchUpInside)
      }

      @objc func addFriendFunc(_: UIButton){
          let addBFVC = AddBFVC()
          //찐친 추가하기
          addBFVC.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(addBFVC, animated: true)
      }
    @objc func nextView(index:IndexPath) {
        let nextView = FriendProfileVC()
        friendData.choiceIndex = index
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @objc func getData(){
        nameList = friendData.name
        numberList = friendData.number
        checked = friendData.bestFriend
    }
    
    
    var tableView = UITableView(frame: .zero, style: .plain)
    let friendData = Friends.shared
    
    var checked: Array<Bool> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var date: Array<String> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
            getData()
            setTableView()
           makeSubView()
           makeConstraint()
           makeAddTarget()
        
    }
}


extension FriendListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestFriendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "BestFriendList")
       
        cell.backgroundColor = .systemGray6
        
        if checked[indexPath.row] == true{
            cell.accessoryType = .disclosureIndicator
        }else{
            //찐친 리스트를 따로 하나 만들어야 하나 ...
        }
        
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.black
        cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel!.textColor = UIColor.systemGray2
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        nextView(index:indexPath)
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
    }
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
 
   
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
