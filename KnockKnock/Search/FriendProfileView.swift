

import UIKit
class FriendProrileView : UIView {
    
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
    
    let AlarmMemoLabel : UILabel = {
       let alarmMemoLabel = UILabel()
        alarmMemoLabel.text = "메모"
        alarmMemoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmMemoLabel
    }()
    
    let AlarmMemoText : UITextField = {
       let alarmMemoText = UITextField()
        alarmMemoText.placeholder = "메모를 입력해주세요\n(최대 45자)"
        alarmMemoText.addLeftPadding()
        alarmMemoText.contentVerticalAlignment = .top
        alarmMemoText.contentHorizontalAlignment = .left
        
        alarmMemoText.backgroundColor = .systemGray6
        alarmMemoText.layer.cornerRadius = 5
        return alarmMemoText
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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
      
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
    
}

extension FriendProrileView {
    func makeSubView(){
        addSubview(Number)
        addSubview(ProfileView)
        addSubview(editBtn)
        addSubview(textTitle)
        addSubview(textGuideBtn)
        addSubview(myText)
        addSubview(sendMessageBtn)
        addSubview(copyBtn)
        addSubview(AlarmMemoLabel)
        addSubview(AlarmMemoText)
        addSubview(AlarmLabel)
        addSubview(addAlarmBtn)
        addSubview(setBFLabel)
        addSubview(BfSwitch)
            }
    func makeConstraint(){
        
        AlarmMemoLabel.translatesAutoresizingMaskIntoConstraints = false
        AlarmMemoText.translatesAutoresizingMaskIntoConstraints = false
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
            ProfileView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            ProfileView.widthAnchor.constraint(equalToConstant: 100),
            ProfileView.heightAnchor.constraint(equalToConstant: 100),
            Number.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            Number.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 10),
            editBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            editBtn.topAnchor.constraint(equalTo: Number.bottomAnchor, constant: 3),
            
            
            textTitle.topAnchor.constraint(equalTo: editBtn.bottomAnchor, constant: 30),
            textTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textGuideBtn.topAnchor.constraint(equalTo: textTitle.topAnchor),
            textGuideBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            myText.topAnchor.constraint(equalTo: textGuideBtn.bottomAnchor, constant: 7),
            myText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            myText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            myText.heightAnchor.constraint(equalToConstant: 160),
            sendMessageBtn.topAnchor.constraint(equalTo: myText.bottomAnchor, constant: 10),
            sendMessageBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            sendMessageBtn.widthAnchor.constraint(equalToConstant: 110),
            sendMessageBtn.heightAnchor.constraint(equalToConstant: 30),
            copyBtn.topAnchor.constraint(equalTo: sendMessageBtn.topAnchor),
            copyBtn.leadingAnchor.constraint(equalTo: sendMessageBtn.trailingAnchor, constant: 10),
            copyBtn.widthAnchor.constraint(equalTo : sendMessageBtn.widthAnchor),
            copyBtn.heightAnchor.constraint(equalTo : sendMessageBtn.heightAnchor),
            
            AlarmMemoLabel.topAnchor.constraint(equalTo: copyBtn.bottomAnchor, constant: 40),
            AlarmMemoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.topAnchor.constraint(equalTo: AlarmMemoLabel.bottomAnchor, constant: 7),
            AlarmMemoText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            AlarmMemoText.heightAnchor.constraint(equalToConstant: 120),
            
           AlarmLabel.topAnchor.constraint(equalTo: AlarmMemoText.bottomAnchor, constant: 40),
            AlarmLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.topAnchor.constraint(equalTo: AlarmLabel.bottomAnchor, constant: 10),
            addAlarmBtn.heightAnchor.constraint(equalToConstant: 45),
            addAlarmBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            setBFLabel.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 40),
            setBFLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            BfSwitch.topAnchor.constraint(equalTo: setBFLabel.topAnchor),
            BfSwitch.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
    }
 
}
