//
//  AddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class AddFriendVC : UIViewController {
    
    let ProfileView : UIImageView = {
       var profileView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [.systemGray5])
        profileView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        profileView.layer.cornerRadius = 40
        
        return profileView
    }()
    
    let Name : UILabel = {
        let name = UILabel()
        name.text = "프로필 사진 편집"
        name.textAlignment = .center
        name.font = .systemFont(ofSize: 14)
        name.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)

        return name
    }()
    
    
    let nameLabel : UILabel = {
       let namelabel = UILabel()
        namelabel.text = "이름(필수)"
        namelabel.font = UIFont.boldSystemFont(ofSize: 17)
        return namelabel
    }()
    
    let nameText : UITextField = {
       let nametext = UITextField()
        nametext.placeholder = "입력해주세요!"
        nametext.backgroundColor = .systemGray6
        nametext.layer.cornerRadius = 10
        nametext.addLeftPadding()
        return nametext
    }()
    
    let NicknameLabel : UILabel = {
       let nicknamelabel = UILabel()
        nicknamelabel.text = "별명(선택)"
        nicknamelabel.font = UIFont.boldSystemFont(ofSize: 17)
        return nicknamelabel
    }()
    
    let NicknameText : UITextField = {
       let nicknametext = UITextField()
        nicknametext.placeholder = "입력해주세요!"
        nicknametext.backgroundColor = .systemGray6
        nicknametext.layer.cornerRadius = 10
        nicknametext.addLeftPadding()
        return nicknametext
    }()
    
    let numberLabel : UILabel = {
       let numberlabel = UILabel()
        numberlabel.text = "전화번호(선택)"
        numberlabel.font = UIFont.boldSystemFont(ofSize: 17)
        return numberlabel
    }()
    
    let numberText : UITextField = {
       let numbertext = UITextField()
        numbertext.placeholder = "입력해주세요!"
        numbertext.backgroundColor = .systemGray6
        numbertext.layer.cornerRadius = 10
        numbertext.addLeftPadding()
        return numbertext
    }()
    
    let saveBtn : UIButton = {
       let savebtn = UIButton()
        savebtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        savebtn.setTitle("저장하기", for: .normal)
        savebtn.tintColor = .white
        savebtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        savebtn.layer.cornerRadius = 25
        return savebtn
    }()
    
    func makeSubView(){
        view.addSubview(ProfileView)
        view.addSubview(Name)
        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(NicknameLabel)
        view.addSubview(NicknameText)
        view.addSubview(numberLabel)
        view.addSubview(numberText)
        view.addSubview(saveBtn)
        
    }
    
    func makeConstraint(){
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        Name.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameText.translatesAutoresizingMaskIntoConstraints = false
        NicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        NicknameText.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberText.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            ProfileView.widthAnchor.constraint(equalToConstant: 110),
            ProfileView.heightAnchor.constraint(equalToConstant: 110),
            Name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Name.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 3),
            Name.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 140),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nameText.heightAnchor.constraint(equalToConstant: 50),
            
            NicknameLabel.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 30),
            NicknameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            NicknameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            NicknameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            NicknameText.topAnchor.constraint(equalTo: NicknameLabel.bottomAnchor, constant: 7),
            NicknameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            NicknameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            NicknameText.heightAnchor.constraint(equalToConstant: 50),
            
            numberLabel.topAnchor.constraint(equalTo: NicknameText.bottomAnchor, constant: 30),
            numberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberLabel.heightAnchor.constraint(equalToConstant: 30),
            
            numberText.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 7),
            numberText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberText.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            saveBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
            saveBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            saveBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        
        self.title = "연락처 추가"
        //large X
       
        
        
        makeSubView()
        makeConstraint()
        //makeAddTarget()
        
    }
}
