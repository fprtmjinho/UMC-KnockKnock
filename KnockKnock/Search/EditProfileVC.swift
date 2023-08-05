//
//  EditProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
import CoreData
class EditProfileVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
//    let editLabel : UILabel = {
//        let label = UILabel()
//        label.text = "프로필 사진 편집"
//        label.textColor =  #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
//        label.font = .systemFont(ofSize: 14)
//        return label
//    }()
    //앨범에서 이미지 가져오는 작업하려면 위에꺼 주석처리하고 이거 주석 풀고 하면 됨
    //+ addtarget함수에 있는 주석도 풀어야함
    let editLabel : UIButton = {
        let label = UIButton()
        label.titleLabel?.text = "프로필 사진 편집"
        label.titleLabel?.textColor =  #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        label.titleLabel?.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    let ProfileView : UIImageView = {
       var profileView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [ #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
        profileView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        profileView.layer.cornerRadius = 40
        
        return profileView
    }()
    
    let nameLabel : UILabel = {
       let namelabel = UILabel()
        namelabel.text = "이름(필수)"
        namelabel.font = UIFont.boldSystemFont(ofSize: 17)
        return namelabel
    }()
    
    let nameText : UITextField = {
       let nametext = UITextField()
        let fre = Friends.shared
        nametext.text = fre.dic[fre.choiceNumber!]!.name
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
         let fre = Friends.shared
         text.text = fre.dic[fre.choiceNumber!]!.nickName
         text.placeholder = "입력해주세요!"
         text.backgroundColor = .systemGray6
         text.layer.cornerRadius = 10
         text.addLeftPadding()
         return text
     }()

    let numberLabel : UILabel = {
       let label = UILabel()
        label.text = "전화번호(선택)"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let numberText : UITextField = {
       let text = UITextField()
        let fre = Friends.shared
        text.text = fre.choiceNumber!
        text.placeholder = "입력해주세요!"
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 10
        text.addLeftPadding()
        return text
    }()
    
    let me = MyData.shared
    let fre = Friends.shared
    var imagePickerController = UIImagePickerController()
    let alertController = UIAlertController(title: "올릴 방식을 선택하세요", message: "사진 찍기 또는 앨범에서 선택", preferredStyle: .actionSheet)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigationBar()
        self.title = "편집"
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
}

extension EditProfileVC {
    func makeSubView(){
        view.addSubview(ProfileView)
        view.addSubview(editLabel)
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
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameText.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberText.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            ProfileView.widthAnchor.constraint(equalToConstant: 100),
            ProfileView.heightAnchor.constraint(equalToConstant: 100),
            editLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editLabel.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 5),
            
            nameLabel.topAnchor.constraint(equalTo: editLabel.bottomAnchor, constant: 50),
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
        saveBtn.addTarget(self, action: #selector(saveFriendData(_:)), for: .touchUpInside)
        editLabel.addTarget(self, action: #selector(enrollAlertEvent(_:)), for: .touchUpInside)
    }
    @objc func saveFriendData(_:UIButton){
        var newName: String = ""
        var newNickName: String = ""
        var newNumber: String = ""
        var png: Data?
        if let name = nameText.text{
            newName = name
        }
        if newName == ""{
            newName = fre.dic[fre.choiceNumber!]!.name
        }
        if let nickName = nicknameText.text{
            newNickName = nickName
        }
        if newNickName == ""{
            newNickName = fre.dic[fre.choiceNumber!]!.nickName
        }
        if let number = numberText.text{
            newNumber = number
        }
        if newNumber == ""{
            newNumber = fre.choiceNumber!
        }
        if let data = ProfileView.image?.pngData(){
            png = data
        }
        print(newName)
        var info: Info = Info(
            name: newName,
            nickName: newNickName,
            bestFriend: fre.dic[fre.choiceNumber!]!.bestFriend,
            alram: fre.dic[fre.choiceNumber!]!.alram,
            time: fre.dic[fre.choiceNumber!]!.time,
            image: png!
        )
        fre.dic.removeValue(forKey: fre.choiceNumber!)
        fre.dic[newNumber] = info
        fre.choiceNumber = newNumber
        self.navigationController?.popViewController(animated: true)
    }
}
// 앨범에서 이미지 가져오기
extension EditProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @objc func enrollAlertEvent(_:UILabel) {
        let alert = UIAlertController(title: "사진 가져오기", message: "사진 유형을 선택해주세요", preferredStyle: .actionSheet)
        let photoLibraryAlertAction = UIAlertAction(title: "사진 앨범", style: .default) { action in
            self.openAlbum()
            //DatePicker의 date를 btn의 title로 설정
        }
        let cancelAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
                        
        
        alert.addAction(photoLibraryAlertAction)
        alert.addAction(cancelAlertAction)
        self.present(alert, animated: true)
    }
    @objc func openAlbum(){
        self.imagePickerController.delegate = self
        self.imagePickerController.sourceType = .photoLibrary
        self.imagePickerController.allowsEditing = false
        present(self.imagePickerController, animated: false, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage]
                as? UIImage {
                //가져온 이미지를 UIImage뷰에 넣는 곳
                ProfileView.image = image
                ProfileView.layer.cornerRadius = ProfileView.frame.width/2
                ProfileView.clipsToBounds = true
            }
            else {
                print("error detected in didFinishPickinMediaWithInfo method")
            }
            dismiss(animated: true, completion: nil) // 반드시 dismiss 하기.
    }
}
