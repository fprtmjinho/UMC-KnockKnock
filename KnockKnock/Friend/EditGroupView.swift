//
//  EditGroupView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/05.
//

import UIKit
class EditGroupView : UIView {
    
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
    
    let loopLabel : UILabel = {
       let loopLabel = UILabel()
        loopLabel.text = "반복 주기"
        loopLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return loopLabel
    }()
    
    let loopOnceBtn : UIButton = {
        let btn = UIButton()
               var title = AttributedString("두 달에 한 번")
               title.font = UIFont.boldSystemFont(ofSize: 17)
               title.foregroundColor = .black
               var config = UIButton.Configuration.filled()
               config.cornerStyle = .capsule
               config.baseBackgroundColor = .systemGray6
               config.attributedTitle = title
               btn.configuration = config
               return btn
    }()
    
    let loopBtn : UIButton = {
        let btn = UIButton()
               var title = AttributedString("6개월에 한 번")
               title.font = UIFont.boldSystemFont(ofSize: 17)
               var config = UIButton.Configuration.filled()
               config.cornerStyle = .capsule
               config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
               config.attributedTitle = title
               btn.configuration = config
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
    
    let group = Group.shared
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        makeSubView()
        makeConstraint()
        settableView()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
}

extension EditGroupView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupMemberList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "gourpMemberList")
        let BFimage = UIImage(named: "BFonly")?.resizeImageTo(size: CGSize(width: 65, height: 25))
        /*
        if groupMemberList[indexPath.row] == true{
            cell.accessoryView = UIImageView(image: BFimage)
        }else{
            cell.accessoryView = .none
        }*/
        
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = UIColor.systemGray2
        return cell
    }
    
    func settableView(){
        
    }
}

extension EditGroupView {
 
    func makeSubView(){
        addSubview(nameLabel)
        addSubview(nametext)
        addSubview(memberLabel)
        addSubview(memberTableview)
        addSubview(addmemberBtn)
        addSubview(loopLabel)
        addSubview(loopOnceBtn)
        addSubview(loopBtn)
        addSubview(placeLabel)
        addSubview(placetext)
        
    }
    
    func makeConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints  = false
        nametext.translatesAutoresizingMaskIntoConstraints = false
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        memberTableview.translatesAutoresizingMaskIntoConstraints = false
        addmemberBtn.translatesAutoresizingMaskIntoConstraints = false
        loopLabel.translatesAutoresizingMaskIntoConstraints = false
        loopOnceBtn.translatesAutoresizingMaskIntoConstraints = false
        loopBtn.translatesAutoresizingMaskIntoConstraints = false
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
            
            loopLabel.topAnchor.constraint(equalTo: addmemberBtn.bottomAnchor, constant: 40),
            loopLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loopOnceBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 10),
            loopOnceBtn.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -5),
            loopOnceBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loopOnceBtn.heightAnchor.constraint(equalToConstant: 45),
            loopBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 10),
            loopBtn.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5),
            loopBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            loopBtn.heightAnchor.constraint(equalToConstant: 45),
            
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            placeLabel.topAnchor.constraint(equalTo: loopOnceBtn.bottomAnchor, constant: 40),
            placetext.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 10),
            placetext.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            placetext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            placetext.heightAnchor.constraint(equalToConstant: 45),
            
        
        ])
        
    }
    
    
    
}
