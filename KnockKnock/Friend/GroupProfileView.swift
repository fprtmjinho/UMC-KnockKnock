//
//  GroupProfileView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class GroupProfileView : UIView {
    
    let memberLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 구성원"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let editmemberBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("편집", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        return btn
    }()
    
    let membertableView : UITableView = UITableView(frame: .zero, style: .plain)
    
    let groupAlarmLabel : UILabel = {
        let label = UILabel()
         label.text = "모임 연락 알림"
        label.font = UIFont.boldSystemFont(ofSize: 16)
         return label
    }()
    
    let groupAlarmBtn : UIButton = {
        let btn = UIButton(type: .detailDisclosure)
        return btn
    }()
    
    let placeLabel : UILabel = {
        let label = UILabel()
         label.text = "만남 장소"
        label.font = UIFont.boldSystemFont(ofSize: 16)
         return label
    }()
    
    
    let friendData = Friends.shared
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var bestFriendList: Array<Bool> = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getData()
        setTableView()
        makeSubView()
        makeConstraint()
        
      
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
}

extension GroupProfileView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupmemberList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "groupmemberList")
        cell.backgroundColor = .systemGray6
        cell.accessoryType = .disclosureIndicator
        
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
        //nextView(index:indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func setTableView(){
        membertableView.backgroundColor = .white
        membertableView.separatorStyle = .none
        membertableView.register(UITableViewCell.self, forCellReuseIdentifier: "groupmemberList")
        
        self.membertableView.dataSource = self
        self.membertableView.delegate = self

    }
    
    
}

extension GroupProfileView {
    func makeSubView(){
        addSubview(memberLabel)
        addSubview(editmemberBtn)
        addSubview(membertableView)
        addSubview(groupAlarmLabel)
        addSubview(groupAlarmBtn)
        addSubview(placeLabel)
        
    }
    func makeConstraint(){
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        editmemberBtn.translatesAutoresizingMaskIntoConstraints = false
        membertableView.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmBtn.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memberLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            memberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            editmemberBtn.topAnchor.constraint(equalTo: memberLabel.topAnchor),
            editmemberBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            membertableView.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 7),
            membertableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            membertableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            membertableView.heightAnchor.constraint(equalToConstant:  CGFloat(nameList.count*60)),
            
            groupAlarmLabel.topAnchor.constraint(equalTo: membertableView.bottomAnchor, constant: 30),
            groupAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            groupAlarmBtn.topAnchor.constraint(equalTo: groupAlarmLabel.topAnchor),
            groupAlarmBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            placeLabel.topAnchor.constraint(equalTo: groupAlarmBtn.bottomAnchor, constant: 30),
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        
            
        ])
    }
    
    
    //임시로 적용
    func getData(){
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var nickNameCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        for key in friendData.dic.keys{
            var dic = friendData.dic[key]
            nameCh.append(dic!.name)
            numberCh.append(key)
            nickNameCh.append(dic!.nickName)
            bestFriendCh.append(dic!.bestFriend)
        }
        nameList = nameCh
        numberList = numberCh
        nickNameList = nickNameCh
        bestFriendList = bestFriendCh
    }
}
