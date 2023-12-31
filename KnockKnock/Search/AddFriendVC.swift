//
//  AddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
import Alamofire
class AddFriendVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    let searchController: SearchController = SearchController()
    
    let ProfileView : UIImageView = {
       var profileView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [.systemGray5])
        profileView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        profileView.layer.cornerRadius = 40
        
        return profileView
    }()
    
    let Name : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 사진 편집", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
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
    
    var imagePickerController = UIImagePickerController()
    let alertController = UIAlertController(title: "올릴 방식을 선택하세요", message: "사진 찍기 또는 앨범에서 선택", preferredStyle: .actionSheet)
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "연락처 추가"
        handleEditFunc()
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
        Name.addTarget(self, action: #selector(enrollAlertEvent(_:)), for: .touchUpInside)
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
        if let number = numberText.text{
            var addInfo: Info2?
            if number != ""{
                print("number1")
                addInfo = Info2(
                    name:names,
                    nickName: nickNames,
                    number: number,
                    bestFriend: false,
                    imageURL:""
                )
            }else{
                print("number2")
                for key in fre.dic1.keys{
                    var dic = fre.dic1[key]
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
                                addInfo = Info2(
                                    name:names,
                                    nickName: nickNames,
                                    number: nkey,
                                    bestFriend: false,
                                    imageURL:""
                                )
                                print("number7")
                                break
                            }
                        }
                    }
                }
                if fre.dic[names] == nil{
                    print("number8")
                    addInfo = Info2(
                        name:names,
                        nickName: nickNames,
                        number: names + String(1),
                        bestFriend: false,
                        imageURL:""
                    )
                }
            }
            addFriendData(info:addInfo!)
        }
    }
    func addFriendData(info:Info2){
        let friendURLString = "http://\(Server.url)/friends/create"
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        print("friendURLString : \(friendURLString)")
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
        }, to: friendURLString, headers: ["Authorization": accessToken!])
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
//        guard let url = URL(string: friendURLString) else {
//            print("서버 URL을 만들 수 없습니다.")
//            return
//        }
//        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
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
    }
}
extension AddFriendVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
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
