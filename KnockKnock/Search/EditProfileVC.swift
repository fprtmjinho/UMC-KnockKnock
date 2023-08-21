//
//  EditProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
import CoreData
import Alamofire
class EditProfileVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    let editBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 사진 편집", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
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
        nametext.text = fre.dic1[fre.choiceIndex!]!.name
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
         text.text = fre.dic1[fre.choiceIndex!]!.nickName
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
        text.text = fre.dic1[fre.choiceIndex!]?.number
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
        setLabel()
    }
}

extension EditProfileVC {
    func makeSubView(){
        view.addSubview(ProfileView)
        view.addSubview(editBtn)
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
        editBtn.translatesAutoresizingMaskIntoConstraints = false
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
            editBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editBtn.topAnchor.constraint(equalTo: ProfileView.bottomAnchor, constant: 5),
            
            nameLabel.topAnchor.constraint(equalTo: editBtn.bottomAnchor, constant: 50),
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
        editBtn.addTarget(self, action: #selector(enrollAlertEvent(_:)), for: .touchUpInside)
    }
    @objc func setLabel(){

        nameText.text = fre.dic1[fre.choiceIndex!]!.name
        nicknameText.text = fre.dic1[fre.choiceIndex!]!.nickName
        numberText.text = fre.dic1[fre.choiceIndex!]!.number
        ProfileView.layer.cornerRadius = ProfileView.frame.width/2
        ProfileView.image = fre.dic1[fre.choiceIndex!]!.image
        ProfileView.clipsToBounds = true
    }
    @objc func saveFriendData(_:UIButton){
        var newName: String = ""
        var newNickName: String = ""
        var newNumber: String = ""
        var png: UIImage?
        if let name = nameText.text{
            newName = name
        }
        if newName == ""{
            newName = fre.dic1[fre.choiceIndex!]!.name
        }
        if let nickName = nicknameText.text{
            newNickName = nickName
        }
        if newNickName == ""{
            newNickName = fre.dic1[fre.choiceIndex!]!.nickName
        }
        if let number = numberText.text{
            newNumber = number
        }
        if newNumber == ""{
            newNumber = fre.dic1[fre.choiceIndex!]!.number
        }
//        var info: Info = Info(
//            name: newName,
//            nickName: newNickName,
//            bestFriend: fre.dic1[fre.choiceIndex!]!.bestFriend,
//            image: ""
//        )
        var info: Info2 = Info2(
            name: newName,
            nickName: newNickName,
            number: newNumber,
            bestFriend: fre.dic1[fre.choiceIndex!]!.bestFriend,
            imageURL: ""
        )
        friendEditRequest(info:info)
        fre.dic1[fre.choiceIndex!] = info
        self.navigationController?.popViewController(animated: true)
    }
    func friendEditRequest(info:Info2){
        let friendURLString = "http://\(Server.url)/friends/\(fre.choiceIndex!)/edit"
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        let friendData = PostFriendRequest(
            friendName: info.name,
            nickName: info.nickName,
            phoneNumber: info.number
        )
        AF.upload(multipartFormData: { multipartFormData in
            if let friendsJSONData = try? JSONEncoder().encode(friendData) {
                multipartFormData.append(friendsJSONData, withName: "friendRequestDto", mimeType: "application/json")
            }
            if let profileImageData = self.ProfileView.image!.jpegData(compressionQuality: 0.8) {
                multipartFormData.append(profileImageData, withName: "profileImage", fileName: "profileImage.jpeg", mimeType: "image/jpeg")
            }
        }, to: friendURLString, method: .patch, headers: ["Authorization": accessToken!])
        .response { response in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    print("HTTP Status Code: \(statusCode)")

                    if let responseData = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let friendsResponse = try decoder.decode(PostFriendResponse.self, from: responseData)
                            print("Sign Up Response: \(friendsResponse)")
                        } catch {
                            print("JSON Decoding Error: \(error)")
                        }
                    }

                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
//        print("friendURLString : \(friendURLString)")
//        let friendData = PostFriendRequest(
//            friendName: info.name,
//            nickName: info.nickName,
//            phoneNumber: info.number
//        )
//        guard let url = URL(string: friendURLString) else {
//            print("서버 URL을 만들 수 없습니다.")
//            return
//        }
//        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": accessToken!]
//
//        do {
//            let jsonData = try JSONEncoder().encode(friendData)
//            request.httpBody = jsonData
//        } catch {
//            print("JSON 인코딩에 실패하였습니다.")
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("네트워크 에러: \(error)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("올바른 HTTP 응답이 아닙니다.")
//                return
//            }
//
//            let statusCode = httpResponse.statusCode
//            print("HTTP 상태 코드: \(statusCode)")
//        }.resume()
//
        
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
