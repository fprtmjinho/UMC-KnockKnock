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
       let btn = UIButton()
        var title = AttributedString("문자하기")
        title.font = UIFont.systemFont(ofSize: 15)
        title.foregroundColor = .black
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray6
        config.attributedTitle = title
        btn.configuration = config
        return btn
    }()
    
    let copyBtn : UIButton = {
       let btn = UIButton()
        var title = AttributedString("글 전체 복사")
        title.font = UIFont.systemFont(ofSize: 15)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        config.attributedTitle = title
        btn.configuration = config
        return btn
    }()
    
    let AlarmLabel : UILabel = {
       let alarmLabel = UILabel()
        alarmLabel.text = "연락 주기 및 예정 알림"
        alarmLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmLabel
    }()
    
    let addAlarmBtn : UIButton = {
        let btn = UIButton()
        var title = AttributedString("+ 연락 알림 추가")
        title.font = UIFont.systemFont(ofSize: 18)
        title.foregroundColor = .black
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray6
        config.attributedTitle = title
        btn.configuration = config
        return btn
        
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
            
            
            textTitle.bottomAnchor.constraint(equalTo: myText.topAnchor, constant: -7),
            textTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textGuideBtn.bottomAnchor.constraint(equalTo: textTitle.bottomAnchor),
            textGuideBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            
            myText.bottomAnchor.constraint(equalTo: sendMessageBtn.topAnchor, constant: -10),
            myText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            myText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            myText.heightAnchor.constraint(equalToConstant: 110),
            sendMessageBtn.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            sendMessageBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            sendMessageBtn.widthAnchor.constraint(equalToConstant: 110),
            sendMessageBtn.heightAnchor.constraint(equalToConstant: 30),
            copyBtn.topAnchor.constraint(equalTo: sendMessageBtn.topAnchor),
            copyBtn.leadingAnchor.constraint(equalTo: sendMessageBtn.trailingAnchor, constant: 10),
            copyBtn.widthAnchor.constraint(equalTo : sendMessageBtn.widthAnchor),
            copyBtn.heightAnchor.constraint(equalTo : sendMessageBtn.heightAnchor),
            
           AlarmLabel.topAnchor.constraint(equalTo: copyBtn.bottomAnchor, constant: 40),
            AlarmLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.topAnchor.constraint(equalTo: AlarmLabel.bottomAnchor, constant: 10),
            addAlarmBtn.heightAnchor.constraint(equalToConstant: 40),
            addAlarmBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            setBFLabel.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 40),
            setBFLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            BfSwitch.topAnchor.constraint(equalTo: setBFLabel.topAnchor),
            BfSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func makeAddTarget(){
        self.editBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
        self.addAlarmBtn.addTarget(self, action: #selector(addAlarmFunc(_:)), for: .touchUpInside)
        self.textGuideBtn.addTarget(self, action: #selector(textGuideFunc(_:)), for: .touchUpInside)
        self.copyBtn.addTarget(self, action: #selector(pasteText(_:)), for: .touchUpInside)
    }
    
    @objc func pasteText(_ sender: Any) {
          UIPasteboard.general.string = myText.text
      }
    
    @objc func editBtnFunc(_: UIButton){
        let editProfileVC = EditProfileVC()
        editProfileVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(editProfileVC, animated: true)
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


