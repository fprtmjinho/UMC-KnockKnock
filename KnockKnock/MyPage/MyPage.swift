//
//  MyPage.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/24.
//

import UIKit
class MyPage : UIView{
    
    let Name : UILabel = {
        let name = UILabel()
        name.text = MyData.shared.name
        name.textAlignment = .center
        name.font = .systemFont(ofSize: 16)
        name.backgroundColor = .white
        name.textColor = .black
        return name
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
        texttitle.text = "내 문자 글"
        texttitle.font = UIFont.boldSystemFont(ofSize: 17)
        return texttitle
    }()
    
    let messageView : MyMessage1 = {
       let message = MyMessage1()
        message.layer.cornerRadius = 10
        return message
    }()
    
    let changeMessageBtn : UIButton = {
       //문자 글 뷰 변환 버튼
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(paletteColors: [UIColor.systemGray3])
        let image = UIImage(systemName: "arrow.triangle.2.circlepath", withConfiguration: config)
        btn.setImage(image, for: .normal)
        return btn
    }()

    
    let copyBtn : UIButton = {
        let btn = UIButton()
           var title = AttributedString("글 전체 복사")
           title.font = UIFont.boldSystemFont(ofSize: 15)
           var config = UIButton.Configuration.filled()
           config.cornerStyle = .capsule
           config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
           config.attributedTitle = title
           btn.configuration = config
           return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        makeAddTarget()
      
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
    
}

extension MyPage {
    func makeConstraint(){
        
        Name.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        messageView.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
        changeMessageBtn.translatesAutoresizingMaskIntoConstraints = false
      
        
        NSLayoutConstraint.activate([
        ProfileView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ProfileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
        ProfileView.widthAnchor.constraint(equalToConstant: 100),
        ProfileView.heightAnchor.constraint(equalToConstant: 100),
        Name.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        Name.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 7),
        editBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        editBtn.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 2),
        
        textTitle.topAnchor.constraint(equalTo: editBtn.bottomAnchor, constant: 20),
        textTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        
        changeMessageBtn.topAnchor.constraint(equalTo: textTitle.topAnchor, constant: -5),
        changeMessageBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        changeMessageBtn.widthAnchor.constraint(equalToConstant: 35),
        changeMessageBtn.heightAnchor.constraint(equalToConstant: 35),
        
        messageView.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 8),
        messageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        messageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        messageView.heightAnchor.constraint(equalToConstant: 250),
        
        copyBtn.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 8),
        copyBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        copyBtn.widthAnchor.constraint(equalToConstant: 120),
        copyBtn.heightAnchor.constraint(equalToConstant: 35),
        
        ])
        
    }
    
    
    func makeSubView(){
        
        self.addSubview(Name)
        self.addSubview(ProfileView)
        self.addSubview(editBtn)
        self.addSubview(textTitle)
        self.addSubview(changeMessageBtn)
        self.addSubview(messageView)
        self.addSubview(copyBtn)
        
    }
    
    func makeAddTarget(){
        self.copyBtn.addTarget(self, action: #selector(pasteText(_:)), for: .touchUpInside)
        self.changeMessageBtn.addTarget(self, action: #selector(changeText(_:)), for: .touchUpInside)
    }
    @objc func changeText(_ sender: Any){
        if let currentView = messageView.label2.text{
            if currentView == MyMessage1().label2.text{
                messageView.label2.text = MyMessage2().label2.text
            }
            else{
                messageView.label2.text = MyMessage1().label2.text
            }
        }
    }
    @objc func pasteText(_ sender: Any) {
        var head: String = ""
        var connection: String = ""
        var memo: String = ""
        var link: String = "https://itunes.apple.com/app/knockknock"
        var share: String = ""
        var paste: String = ""
        if let label2 = messageView.label2.text{
            paste = label2
        }
        if let keyword = messageView.keywordtext.text{
            paste = paste + "\n관계 : " + keyword
        }
        if let memotext = messageView.memotext.text{
            paste = paste + "\n메모 : " + memotext
        }
//        if let shareText = messageView.lastLabel.text{
//            share = shareText
//        }
        paste = paste + "\n" + link + "\n" + "다운로드 여부와 상관없이 해당 채팅창에서 답장을 이어가주세요. 물론 받은 사람 마음입니다!"
        UIPasteboard.general.string = paste
    }
}
