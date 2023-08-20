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
    
    let membertableView : UITableView = UITableView(frame: .zero, style: .plain)
    
    let groupAlarmLabel : UILabel = {
        let label = UILabel()
         label.text = "모임 연락 알림"
        label.font = UIFont.boldSystemFont(ofSize: 16)
         return label
    }()
    
    let groupAlarmSwitch : UISwitch = {
        let swit = UISwitch()
        return swit
    }()
    
    let placeLabel : UILabel = {
        let label = UILabel()
         label.text = "만남 장소"
        label.font = UIFont.boldSystemFont(ofSize: 16)
         return label
    }()
    let friendData = Friends.shared
    let group = Group.shared
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getData()
        sortData()
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
        let BFimage = UIImage(named: "BF")?.resizeImageTo(size: CGSize(width: 65, height: 25))
        cell.backgroundColor = .systemGray6
        cell.accessoryView = UIImageView(image: BFimage)
        
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.black
       cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = UIColor.systemGray2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //프로필로 이동
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
        addSubview(membertableView)
        addSubview(groupAlarmLabel)
        addSubview(groupAlarmSwitch)
        addSubview(placeLabel)
        
    }
    func makeConstraint(){
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        membertableView.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmSwitch.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memberLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            memberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            membertableView.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 7),
            membertableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            membertableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            membertableView.heightAnchor.constraint(equalToConstant:  CGFloat(nameList.count*60)),
            
            groupAlarmLabel.topAnchor.constraint(equalTo: membertableView.bottomAnchor, constant: 30),
            groupAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            groupAlarmSwitch.topAnchor.constraint(equalTo: groupAlarmLabel.topAnchor),
            groupAlarmSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            placeLabel.topAnchor.constraint(equalTo: groupAlarmSwitch.bottomAnchor, constant: 30),
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        
            
        ])
    }
    
    //임시로 적용
    func getData(){
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
//        var key: String = group.choiceTime!
//        print("key : \(key)")
//        for member in group.dic[key]!.user{
//            nameCh.append(friendData.dic[member]!.name)
//            numberCh.append(member)
//        }
        nameList = nameCh
        numberList = numberCh
    }
    func sortData(){
        var combinedList = zip(nameList,numberList).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        numberList = combinedList.map{$0.1}
        
    }
}
