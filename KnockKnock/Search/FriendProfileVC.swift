//
//  FriendProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class FriendProfileVC : UIViewController {

    
    let Number : UILabel = {
        let number = UILabel()
        number.text = "010-0000-0000"
        number.textAlignment = .center
        number.font = .systemFont(ofSize: 16)
        //두께 및 크기 조정
        number.backgroundColor = .white
        number.textColor = .black

        return number
    }()
    
    
    let ProfileView : UIImageView = {
       var profileView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
        profileView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        profileView.layer.cornerRadius = 40
        
        return profileView
    }()
    
    let editBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("편집 >", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return btn
    }()
    
    
    let textTitle : UILabel = {
       let texttitle =  UILabel()
        texttitle.text = "연락하기"
        texttitle.font = UIFont.boldSystemFont(ofSize: 18)
        return texttitle
    }()
    
    let textGuideBtn : UIButton = {
       let textguide = UIButton()
        textguide.setTitle("쓸 말이 안떠오르시나요?", for: .normal)
        textguide.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        textguide.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return textguide
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
        sendMessagebtn.setTitle("문자하기", for: .normal)
        sendMessagebtn.setTitleColor(.black, for: .normal)
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
        alarmLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmLabel
    }()
    
    let addAlarmBtn : UIButton = {
       let addAlarm = UIButton()
        addAlarm.backgroundColor = .systemGray6
        addAlarm.setTitle("+ 연락 알림 추가", for: .normal)
        addAlarm.setTitleColor(.black, for: .normal)
        addAlarm.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        addAlarm.layer.cornerRadius = 25
        return addAlarm
    }()
    
    let setBFLabel : UILabel = {
       let setbfLabel = UILabel()
        setbfLabel.text = "찐친 등록하기"
        setbfLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return setbfLabel
    }()
    
    let BfSwitch : UISwitch = {
       let bfSwitch = UISwitch()
        return bfSwitch
    }()
    
    func makeSubView(){
        view.addSubview(Number)
        view.addSubview(ProfileView)
        view.addSubview(editBtn)
        view.addSubview(textTitle)
        view.addSubview(textGuideBtn)
        view.addSubview(myText)
        view.addSubview(sendMessageBtn)
        view.addSubview(copyBtn)
        view.addSubview(AlarmLabel)
        view.addSubview(addAlarmBtn)
        view.addSubview(setBFLabel)
        view.addSubview(BfSwitch)
    }
    
    func makeConstraint(){
        Number.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textGuideBtn.translatesAutoresizingMaskIntoConstraints = false
        myText.translatesAutoresizingMaskIntoConstraints = false
        sendMessageBtn.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        AlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        addAlarmBtn.translatesAutoresizingMaskIntoConstraints = false
        setBFLabel.translatesAutoresizingMaskIntoConstraints = false
        BfSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            ProfileView.widthAnchor.constraint(equalToConstant: 100),
            ProfileView.heightAnchor.constraint(equalToConstant: 100),
            Number.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Number.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 10),
            editBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editBtn.topAnchor.constraint(equalTo: Number.bottomAnchor, constant: 3),
            
            
            textTitle.topAnchor.constraint(equalTo: editBtn.bottomAnchor, constant: 40),
            textTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textGuideBtn.topAnchor.constraint(equalTo: Number.bottomAnchor, constant: 40),
            textGuideBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
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
            BfSwitch.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 40),
            BfSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget(){
        self.addAlarmBtn.addTarget(self, action: #selector(addAlarmFunc(_:)), for: .touchUpInside)
        self.textGuideBtn.addTarget(self, action: #selector(textGuideFunc(_:)), for: .touchUpInside)
    }
    
    @objc func addAlarmFunc(_:UIButton){
        let addAlarmVC = AddAlarmVC()
        addAlarmVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addAlarmVC, animated: true)
    }
    @objc func textGuideFunc(_: UIButton){
        let textGuideVC = TextGuideVC()
        textGuideVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(textGuideVC, animated: true)
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Name"
        //title은 cell 따라 변경 필요
        //임의 지정
        
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
       
    }
    
}


