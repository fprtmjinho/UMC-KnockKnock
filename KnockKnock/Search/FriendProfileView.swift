
import UIKit
import MessageUI

class FriendProfileView : UIView {
    
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
    
    let textScroll : UIScrollView = UIScrollView()
    
    let myText : UITextView = {
       let mytext = UITextView()
        mytext.text = " 남기고 싶은 메모를 작성해주세요!"
        mytext.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10);
        mytext.layer.cornerRadius = 5
        mytext.backgroundColor = .systemGray6
        mytext.font = UIFont.systemFont(ofSize: 15)
      
        return mytext
    }()
    
    lazy var sendMessageBtn : UIButton = {
        let btn = UIButton()
        var title = AttributedString("문자하기")
        title.font = UIFont.systemFont(ofSize: 15)
        title.foregroundColor = .black
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray6
        config.attributedTitle = title
        btn.configuration = config
        btn.addTarget(self, action: #selector(shareText), for: .touchUpInside)
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
    
    let AlarmMemoText : UITextView = {
       let mytext = UITextView()
        mytext.text = "메모를 입력해주세요\n(최대 45자)"
        mytext.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10);
        mytext.layer.cornerRadius = 5
        mytext.backgroundColor = .systemGray6
        mytext.font = UIFont.systemFont(ofSize: 15)
        return mytext
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
    
    let alarmLabel : UILabel = {
       let Label = UILabel()
        Label.text = "연락 알림"
        Label.font = UIFont.boldSystemFont(ofSize: 18)
        return Label
    }()
    
    let alarmSwitch : UISwitch = {
       let Switch = UISwitch()
        return Switch
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

extension FriendProfileView {
    func makeSubView(){
        addSubview(textScroll)
        addSubview(Number)
        addSubview(ProfileView)
        addSubview(editBtn)
        addSubview(textTitle)
        addSubview(textGuideBtn)
        textScroll.addSubview(myText)
        addSubview(sendMessageBtn)
        addSubview(copyBtn)
        addSubview(AlarmMemoLabel)
        addSubview(AlarmMemoText)
        addSubview(AlarmLabel)
        addSubview(addAlarmBtn)
        addSubview(setBFLabel)
        addSubview(BfSwitch)
        addSubview(alarmLabel)
        addSubview(alarmSwitch)
            }
    func makeConstraint(){
        
        AlarmMemoLabel.translatesAutoresizingMaskIntoConstraints = false
        AlarmMemoText.translatesAutoresizingMaskIntoConstraints = false
        Number.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textGuideBtn.translatesAutoresizingMaskIntoConstraints = false
        textScroll.translatesAutoresizingMaskIntoConstraints = false
        myText.translatesAutoresizingMaskIntoConstraints = false
        sendMessageBtn.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        AlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        addAlarmBtn.translatesAutoresizingMaskIntoConstraints = false
        setBFLabel.translatesAutoresizingMaskIntoConstraints = false
        BfSwitch.translatesAutoresizingMaskIntoConstraints = false
        alarmLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            
            textScroll.topAnchor.constraint(equalTo: textGuideBtn.bottomAnchor, constant: 7),
            textScroll.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textScroll.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            textScroll.bottomAnchor.constraint(equalTo: sendMessageBtn.topAnchor, constant: -10),
            myText.topAnchor.constraint(equalTo: textScroll.topAnchor),
            myText.leadingAnchor.constraint(equalTo: textScroll.leadingAnchor),
            myText.trailingAnchor.constraint(equalTo: textScroll.trailingAnchor),
            myText.bottomAnchor.constraint(equalTo: textScroll.bottomAnchor),
            myText.widthAnchor.constraint(equalTo: textScroll.widthAnchor),
            
            sendMessageBtn.topAnchor.constraint(equalTo: textGuideBtn.bottomAnchor, constant: 180),
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
            AlarmMemoText.heightAnchor.constraint(equalToConstant: 100),
            
           AlarmLabel.topAnchor.constraint(equalTo: AlarmMemoText.bottomAnchor, constant: 40),
            AlarmLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.topAnchor.constraint(equalTo: AlarmLabel.bottomAnchor, constant: 10),
            addAlarmBtn.heightAnchor.constraint(equalToConstant: 45),
            addAlarmBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addAlarmBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            setBFLabel.topAnchor.constraint(equalTo: addAlarmBtn.bottomAnchor, constant: 40),
            setBFLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            BfSwitch.topAnchor.constraint(equalTo: setBFLabel.topAnchor),
            BfSwitch.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            alarmLabel.topAnchor.constraint(equalTo: setBFLabel.bottomAnchor, constant: 40),
            alarmLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            alarmSwitch.topAnchor.constraint(equalTo: alarmLabel.topAnchor),
            alarmSwitch.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
        let contentViewHeight = myText.heightAnchor.constraint(greaterThanOrEqualTo: textScroll.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
    }
    
    @objc func shareText() {
            guard let text = myText.text else { return }

            let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
        }
 
}
