//
//  AddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class AddFriendVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
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
    
    let WarningLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "! 낙낙에서 수정된 정보는 기기 연락처에 반영되지 않아요 !\n\n카톡으로만 친구인 사용자의 경우, 이름만 입력하세요!\n전화번호는 나중에 따로 추가하시면 됩니다 :)"
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    //label 형식 상의 필요
    
    
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
    
    let nicknameLabel : UILabel = {
        let label = UILabel()
         label.text = "닉네임(선택)"
         label.font = UIFont.boldSystemFont(ofSize: 17)
         return label
     }()

     let nicknameText : UITextField = {
        let text = UITextField()
         text.placeholder = "입력해주세요!"
         text.backgroundColor = .systemGray6
         text.layer.cornerRadius = 10
         text.addLeftPadding()
         return text
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
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "연락처 추가"
       
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
    }
}

extension AddFriendVC {
    func makeSubView(){
        view.addSubview(ProfileView)
        view.addSubview(Name)
        view.addSubview(WarningLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(nicknameLabel)
        view.addSubview(nicknameText)
        view.addSubview(numberLabel)
        view.addSubview(numberText)
        saveBtn = setNextBtn(view: self, title: "저장하기")
    }
    
    func makeConstraint(){
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        Name.translatesAutoresizingMaskIntoConstraints = false
        WarningLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameText.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            ProfileView.widthAnchor.constraint(equalToConstant: 110),
            ProfileView.heightAnchor.constraint(equalToConstant: 110),
            Name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Name.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 2),
            Name.heightAnchor.constraint(equalToConstant: 40),
            
            WarningLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            WarningLabel.topAnchor.constraint(greaterThanOrEqualTo: Name.bottomAnchor),
            WarningLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            WarningLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            
            nameLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nameText.heightAnchor.constraint(equalToConstant: 45),
            
            nicknameLabel.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 20),
            nicknameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nicknameLabel.heightAnchor.constraint(equalToConstant: 30),

            nicknameText.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 7),
            nicknameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nicknameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nicknameText.heightAnchor.constraint(equalToConstant: 45),
            
            numberLabel.topAnchor.constraint(equalTo: nicknameText.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberLabel.heightAnchor.constraint(equalToConstant: 30),
            
            numberText.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 7),
            numberText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberText.heightAnchor.constraint(equalToConstant: 45),
            
            
        ])
        
    }
    func makeAddTarget(){
        saveBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func saveBtnPressed(_: UIButton){
        setData()
        navigationController?.popViewController(animated: true)
    }
    @objc func setData(){
        let fre = Friends.shared
        var names: String = ""
        var nickNames: String = ""
        if let name = nameText.text{
            names = name
        }
        if let nickName = nicknameText.text{
            nickNames = nickName
        }
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let number = numberText.text{
            if number != ""{
                print("number1")
                var phoneNumber: String = number
                var addInfo: Info = Info(
                    name:names,
                    nickName: nickNames,
                    bestFriend: false,
                    alram: true,
                    time:formatter.string(from: Date())
                )
                fre.dic[phoneNumber] = addInfo
            }else{
                print("number2")
                var addInfo: Info = Info(
                    name:names,
                    nickName: nickNames,
                    bestFriend: false,
                    alram: true,
                    time:formatter.string(from: Date())
                )
                for key in fre.dic.keys{
                    var dic = fre.dic[key]
                    print("number3")
                    print(names)
                    print(dic!.name)
                    if dic!.name.contains(names){
                        print("number4")
                        var i: Int=1
                        while(true){
                            var nkey = names
                            print("number5")
                            nkey = nkey + String(i)
                            if fre.dic.keys.contains(nkey){
                                print("number6")
                                i+=1
                            }else{
                                fre.dic[nkey] = addInfo
                                print("number7")
                                break
                            }
                        }
                    }
                }
                if fre.dic[names] == nil{
                    print("number8")
                    names = names + String(1)
                    fre.dic[names] = addInfo
                }
            }
        }
    }
}
