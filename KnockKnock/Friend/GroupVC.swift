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
    
    var nameList: Array<String> = []
    var timeList: Array<String> = []
    var memberList: [[String]] = [[]]
    
    let group = Group.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        group.groupMember = []
        getData()
        sortData()
        
        setTableView()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        group.groupMember = []
        getData()
        sortData()
        tableView.reloadData()
    }
}


 
 extension GroupVC : UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return nameList.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "groupList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "groupList")
         cell.backgroundColor = .systemGray6

         cell.accessoryType = .disclosureIndicator
         
         cell.textLabel?.text = nameList[indexPath.row]
         cell.detailTextLabel?.text = timeList[indexPath.row]//memberList로 그룹원 이름들 보여주는것도 낫벧
         cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
         cell.textLabel!.textColor = UIColor.black
         cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
         cell.detailTextLabel!.textColor = UIColor.systemGray2
         return cell
     }
  
     func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
         return 60
         //row 두께 설정
     }
     
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             group.dic[timeList[indexPath.row]] = nil
             nameList.remove(at: indexPath.row)
             timeList.remove(at: indexPath.row)
             memberList.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
             //remove 확인용 alarm 필요
         }
         //화이팅!
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath)
         nextView(index:indexPath)
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
    
     @objc func nextView(index:IndexPath) {
        let nextView = GroupProfileVC()
         group.choiceTime = timeList[index.row]
         print("timeList : \(timeList[index.row])")
         print("groupInfo : \(group.dic[timeList[index.row]])")
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }

    @objc func addGroupFunc(_: UIButton){
        let addGroupVC = AddGroupVC()
        //찐친 추가하기
        addGroupVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addGroupVC, animated: true)
    }
    @objc func getData(){
        var nameCh: Array<String> = []
        var timeCh: Array<String> = []
        var memberCh: [[String]] = [[]]
        for key in group.dic.keys{
            var dic = group.dic[key]
            nameCh.append(dic!.name)
            timeCh.append(key)
            memberCh.append(dic!.user)
        }
        nameList = nameCh
        timeList = timeCh
        memberList = memberCh
    }
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList,zip(timeList,memberList).map{($0,$1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        timeList = combinedList.map{$0.1.0}
        memberList = combinedList.map{$0.1.1}
    }
//    @objc func groupSelect(index:IndexPath) {
//        let groupSelect = FriendProfileVC()// 여기를 그룹 수정 뷰 or 그룹 정보 뷰로 넘어가게 해야함
//        group.choiceTime = timeList[index.row]
////        friendData.choiceIndex = index.row
//        groupSelect.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(groupSelect, animated: true)
//    }
}
