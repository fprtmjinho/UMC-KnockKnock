//
//  AddGroupView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/20.
//

import UIKit
class AddGroupView : UIView {
    
    
    let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 이름"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nametext : UITextField = {
       let text = UITextField()
        text.placeholder = "이름을 입력해주세요"
        text.addLeftPadding()
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 5
        return text
    }()
    
    let memberLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 구성원"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    //구성원에 대한 tableView
    let memberTableview = UITableView(frame: .zero, style: .plain)
    
    let addmemberBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("+ 추가하기", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.systemGray4.cgColor
        //layer의 색을 변경할 때는 cgColor 사용해야 함
        return btn
    }()
    
    let placeLabel : UILabel = {
       let label = UILabel()
        label.text = "만나는 위치"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let placetext : UITextField = {
       let text = UITextField()
        text.placeholder = "만나는 위치를 입력해주세요"
        text.addLeftPadding()
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 5
        return text
    }()
    
    
    let friendData = Friends.shared
    var checked: Array<Bool> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getData()
        makeSubView()
        makeConstraint()
        settableView()
      
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
   
}


extension AddGroupView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupMemberList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "gourpMemberList")
        
        
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = UIColor.systemGray2
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func settableView(){
        memberTableview.backgroundColor = .white
        memberTableview.separatorStyle = .none
        self.memberTableview.dataSource = self
        self.memberTableview.delegate = self
        //addSubView, Constraint는 위에서 실행함
    }
    
    
    
}

extension AddGroupView {
    func makeSubView(){
        addSubview(nameLabel)
        addSubview(nametext)
        addSubview(memberLabel)
        addSubview(memberTableview)
        addSubview(addmemberBtn)
        addSubview(placeLabel)
        addSubview(placetext)
    }
    
    func makeConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nametext.translatesAutoresizingMaskIntoConstraints = false
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        memberTableview.translatesAutoresizingMaskIntoConstraints = false
        addmemberBtn.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placetext.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nametext.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nametext.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nametext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            nametext.heightAnchor.constraint(equalToConstant: 45),
            
            memberLabel.topAnchor.constraint(equalTo: nametext.bottomAnchor, constant: 40),
            memberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            memberTableview.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 10),
            memberTableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            memberTableview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            memberTableview.heightAnchor.constraint(equalToConstant: CGFloat(nameList.count*60)),
            addmemberBtn.topAnchor.constraint(equalTo: memberTableview.bottomAnchor, constant: 10),
            addmemberBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            addmemberBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            addmemberBtn.heightAnchor.constraint(equalToConstant: 50),
            
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            placeLabel.topAnchor.constraint(equalTo: addmemberBtn.bottomAnchor, constant: 40),
            placetext.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 10),
            placetext.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            placetext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            placetext.heightAnchor.constraint(equalToConstant: 45),
        
        ])
        
    }
    func getData(){
        nameList = friendData.name
        nickNameList = friendData.nickName
        numberList = friendData.number
        checked = friendData.bestFriend
    }
}
