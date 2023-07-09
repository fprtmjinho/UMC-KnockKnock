//
//  FriendProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class FriendProfileVC : UIViewController {

    
    let Name : UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = .center
        name.font = .systemFont(ofSize: 16)
        //두께 및 크기 조정
        name.backgroundColor = .white
        name.textColor = .black

        return name
    }()
    
    
    let ProfileView : UIImageView = {
       var profileView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
        profileView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        
        //profileView.image!.withTintColor(UIColor.systemGray2)
        profileView.layer.cornerRadius = 40
        
        return profileView
    }()
    
    let textTitle : UILabel = {
       let texttitle =  UILabel()
        texttitle.text = "연락하기"
        texttitle.font = UIFont.boldSystemFont(ofSize: 17)
        return texttitle
    }()
    
    let myText : UITextField = {
       let mytext = UITextField()
        mytext.placeholder = "문자 가이드라인 예시"
        mytext.addLeftPadding()
    
        mytext.backgroundColor = .systemGray6
        mytext.layer.cornerRadius = 5
        mytext.font = UIFont.systemFont(ofSize: 15)
        
        //content 위치 조정
        mytext.contentVerticalAlignment = .top
        mytext.contentHorizontalAlignment = .left

        return mytext
    }()
    
    let sendMessageBtn : UIButton = {
       let sendMessagebtn = UIButton()
        sendMessagebtn.backgroundColor = .systemGray6
        sendMessagebtn.tintColor = .black
        sendMessagebtn.setTitle("문자하기", for: .normal)
        sendMessagebtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sendMessagebtn.layer.cornerRadius = 15
        return sendMessagebtn
    }()
    
    let copyBtn : UIButton = {
       let copybtn = UIButton()
        copybtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        copybtn.setTitle("글 전체 복사", for: .normal)
        copybtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        copybtn.layer.cornerRadius = 15
        return copybtn
    }()
    
    let AlarmLabel : UILabel = {
       let alarmLabel = UILabel()
        alarmLabel.text = "연락 주기 및 예정 알림"
        alarmLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return alarmLabel
    }()
    
    let addAlarmBtn : UIButton = {
       let addAlarm = UIButton()
        addAlarm.backgroundColor = .systemGray6
       
        addAlarm.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        addAlarm.layer.cornerRadius = 25
        return addAlarm
    }()
    
    let setBFLabel : UILabel = {
       let setbfLabel = UILabel()
        setbfLabel.text = "찐친 등록하기"
        setbfLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return setbfLabel
    }()
    
    let BfSwitch : UISwitch = {
       let bfSwitch = UISwitch()
        return bfSwitch
    }()
    
    func makeSubView(){
        view.addSubview(Name)
        view.addSubview(ProfileView)
        view.addSubview(textTitle)
        view.addSubview(myText)
        view.addSubview(sendMessageBtn)
        view.addSubview(copyBtn)
        view.addSubview(AlarmLabel)
        view.addSubview(addAlarmBtn)
        view.addSubview(setBFLabel)
        view.addSubview(BfSwitch)
    }
    
    func makeConstraint(){
        Name.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        myText.translatesAutoresizingMaskIntoConstraints = false
        sendMessageBtn.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        AlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        addAlarmBtn.translatesAutoresizingMaskIntoConstraints = false
        setBFLabel.translatesAutoresizingMaskIntoConstraints = false
        BfSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            ProfileView.widthAnchor.constraint(equalToConstant: 100),
            ProfileView.heightAnchor.constraint(equalToConstant: 100),
            Name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Name.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 10),
            textTitle.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 40),
            textTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            myText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            myText.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 8),
            myText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            myText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            myText.heightAnchor.constraint(equalToConstant: 120),
            sendMessageBtn.topAnchor.constraint(equalTo: myText.bottomAnchor, constant: 10),
            sendMessageBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            sendMessageBtn.widthAnchor.constraint(equalToConstant: 110),
            sendMessageBtn.heightAnchor.constraint(equalToConstant: 30),
            copyBtn.topAnchor.constraint(equalTo: myText.bottomAnchor, constant: 10),
            copyBtn.leadingAnchor.constraint(equalTo: sendMessageBtn.trailingAnchor, constant: 10),
            copyBtn.widthAnchor.constraint(equalToConstant: 110),
            copyBtn.heightAnchor.constraint(equalToConstant: 30),
            
           AlarmLabel.topAnchor.constraint(equalTo: copyBtn.bottomAnchor, constant: 40),
            AlarmLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.topAnchor.constraint(equalTo: AlarmLabel.bottomAnchor, constant: 10),
            addAlarmBtn.heightAnchor.constraint(equalToConstant: 50),
            addAlarmBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            setBFLabel.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 40),
            setBFLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            BfSwitch.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 20),
            BfSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        
    }
    
}
