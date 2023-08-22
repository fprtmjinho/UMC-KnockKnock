//
//  EditMyPageVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/13.
//

import UIKit
import Alamofire

class EditMyPageVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    let editBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 사진 편집", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(editProfileImageButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    let ProfileView : UIImageView = {
        var profileView = UIImageView()
        profileView.layer.cornerRadius = 50
        profileView.clipsToBounds = true
        profileView.layer.masksToBounds = true // 마스크 적용
        if let imageData = UserDefaults.standard.data(forKey: "ProfileImage") {
            if let image = UIImage(data: imageData) {
                // 이미지 뷰에 이미지 설정
                profileView.image = image
            }
        }
        return profileView
    }()
    
    let nickNameLabel : UILabel = {
       let label = UILabel()
        label.text = "닉네임"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let nickNameText : UITextField = {
       let text = UITextField()
        text.placeholder = "입력해주세요."
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 10
        text.addLeftPadding()
        return text
    }()
    
    let birthdayLabel : UILabel = {
        let label = UILabel()
         label.text = "생년월일"
         label.font = UIFont.boldSystemFont(ofSize: 17)
         return label
     }()

     let birthdayText : UITextField = {
        let text = UITextField()
         text.placeholder = "생년월일 6자리 입력해주세요."
         text.backgroundColor = .systemGray6
         text.layer.cornerRadius = 10
         text.addLeftPadding()
         return text
     }()
    
    let me = MyData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        handleEditFunc()
        self.title = "편집"
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
  
}

extension EditMyPageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func editProfileImageButtonTapped(_: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ProfileView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func makeSubView(){
        view.addSubview(ProfileView)
        view.addSubview(editBtn)
        view.addSubview(nickNameLabel)
        view.addSubview(nickNameText)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayText)
        
        saveBtn = setNextBtn(view: self, title: "저장하기")
    }
    
    
    func makeConstraint(){
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameText.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayText.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            ProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            ProfileView.widthAnchor.constraint(equalToConstant: 100),
            ProfileView.heightAnchor.constraint(equalToConstant: 100),
            editBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editBtn.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 5),
            
            nickNameLabel.topAnchor.constraint(equalTo: editBtn.bottomAnchor, constant: 50),
            nickNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nickNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nickNameText.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 7),
            nickNameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nickNameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nickNameText.heightAnchor.constraint(equalToConstant: 45),
            
            birthdayLabel.topAnchor.constraint(equalTo: nickNameText.bottomAnchor, constant: 20),
            birthdayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 30),

            birthdayText.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 7),
            birthdayText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            birthdayText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            birthdayText.heightAnchor.constraint(equalToConstant: 45),
            
        ])
        
    }
    
    func makeAddTarget(){
        saveBtn.addTarget(self, action: #selector(saveMyData(_:)), for: .touchUpInside)
    }
    
    
    @objc func saveMyData(_:UIButton){
        
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        
        var newNickName: String = ""
        var newBirthday: String = ""
        if let nickName = nickNameText.text{
            newNickName = nickName
        }
        if let birthday = birthdayText.text{
            newBirthday = birthday
        }
        me.nickName = newNickName
        me.birthday = newBirthday
        
        if let profileImageData = ProfileView.image?.jpegData(compressionQuality: 1.0) {
                UserDefaults.standard.set(profileImageData, forKey: "ProfileImage")
            }
        
        let editUserData = EditUserData(nickName: me.nickName, birthday: me.birthday)
        
        AF.upload(multipartFormData: { multipartFormData in
            if let editUserJSONData = try? JSONEncoder().encode(editUserData) {
                multipartFormData.append(editUserJSONData, withName: "request", mimeType: "application/json")
            }
            
            if let savedImageData = UserDefaults.standard.data(forKey: "ProfileImage") as? Data,
               let profileImage = UIImage(data: savedImageData),
               let profileImageData = profileImage.jpegData(compressionQuality: 0.9) {
                multipartFormData.append(profileImageData, withName: "profileImage", fileName: "profileImage.jpeg", mimeType: "image/jpeg")
            }
        }, to: URL(string: "http://\(Server.url)/member/update")!, method: .put, headers: ["Authorization": accessToken!])
        .response { response in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    print("HTTP Status Code: \(statusCode)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
