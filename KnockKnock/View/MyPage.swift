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
        profileView.backgroundColor = .systemGray6
        profileView.layer.cornerRadius = 40
        
        
        return profileView
    }()
    
    let textTitle : UILabel = {
       let texttitle =  UILabel()
        texttitle.text = "내 문자 글"
        texttitle.font = UIFont.boldSystemFont(ofSize: 17)
        return texttitle
    }()
    
    let myText : UITextField = {
       let mytext = UITextField()
        mytext.placeholder = " 남기고 싶은 메모를 작성해주세요!"
        //left, top padding 필요
    
        mytext.backgroundColor = .systemGray6
        mytext.layer.cornerRadius = 5
        mytext.font = UIFont.systemFont(ofSize: 15)
        
        //content 위치 조정
        mytext.contentVerticalAlignment = .top
        mytext.contentHorizontalAlignment = .left

        return mytext
    }()
    let copyBtn : UIButton = {
       let copybtn = UIButton()
        copybtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        copybtn.tintColor = .white
        copybtn.setTitle("글 전체 복사", for: .normal)
        copybtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        copybtn.layer.cornerRadius = 15
        return copybtn
    }()
    
    
    func makeConstraint(){
        Name.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        myText.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
      
        
        NSLayoutConstraint.activate([
        ProfileView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ProfileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
        ProfileView.widthAnchor.constraint(equalToConstant: 90),
        ProfileView.heightAnchor.constraint(equalToConstant: 90),
        Name.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        Name.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 10),
        textTitle.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 60),
        textTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        myText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        myText.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 8),
        myText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        myText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
        myText.heightAnchor.constraint(equalToConstant: 120),
        copyBtn.topAnchor.constraint(equalTo: myText.bottomAnchor, constant: 10),
        copyBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        copyBtn.widthAnchor.constraint(equalToConstant: 120),
        copyBtn.heightAnchor.constraint(equalToConstant: 30),
        
        
        
        
       
       
        ])
    }
    
    
    func makeSubView(){
        self.addSubview(Name)
        self.addSubview(ProfileView)
        self.addSubview(textTitle)
        self.addSubview(myText)
        self.addSubview(copyBtn)
       
    }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeConstraint()
        
      
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
    
}
