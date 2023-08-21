//
//  FriendProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class FriendProfileVC : UIViewController {
    
    let friendprofileView : FriendProfileView = {
        let view = FriendProfileView()
        return view
    }()
    
    let scrollView : UIScrollView = UIScrollView()
    let friendData = Friends.shared
    
    var key: Int?
    var names: String = ""
    var number: String = ""
    var nickNames: String = ""
    var best: Bool?
    var imagesURL: String = ""
    var images: Data?

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Name"
        setNavigationBar()
        handleEditFunc()
        getData()
        makeScrollView()
        makeConstraint()
        makeAddTarget()
        setLabel()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeConstraint()
        getData()
        makeAddTarget()
        setLabel()
    }
    
}

extension FriendProfileVC {
    
    func makeScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func makeConstraint(){
        scrollView.addSubview(friendprofileView)
        friendprofileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendprofileView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            friendprofileView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -100),
            friendprofileView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            friendprofileView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            friendprofileView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        //수직 스크롤을 위해 height 조정
        let contentViewHeight = friendprofileView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
    }
    
    func makeAddTarget(){
        friendprofileView.editBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
        friendprofileView.addAlarmBtn.addTarget(self, action: #selector(addAlarmFunc(_:)), for: .touchUpInside)
        friendprofileView.textGuideBtn.addTarget(self, action: #selector(textGuideFunc(_:)), for: .touchUpInside)
        friendprofileView.BfSwitch.addTarget(self, action: #selector(switchChange(Switch: )), for: .valueChanged)
        friendprofileView.copyBtn.addTarget(self, action: #selector(pasteText(_:)), for: .touchUpInside)
    }
    @objc func pasteText(_ sender: Any) {
        UIPasteboard.general.string = friendprofileView.myText.text
         }
    
    @objc func editBtnFunc(_: UIButton){
            let editProfileVC = EditProfileVC()
            editProfileVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(editProfileVC, animated: true)
        }
    
    @objc func addAlarmFunc(_:UIButton){
        let addAlarmVC = AddAlarmVC()
        addAlarmVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addAlarmVC, animated: true)
    }
    @objc func textGuideFunc(_: UIButton){
        let textGuideVC = TextGuideVC()
        textGuideVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(textGuideVC, animated: true)
    }
    @objc func switchChange(Switch:UISwitch){
        print("switch")
        if (friendprofileView.BfSwitch.isOn){
            friendprofileView.BfSwitch.isOn = true
            best = true
        }else{
            friendprofileView.BfSwitch.isOn = false
            best = false
        }
        var dic = friendData.dic[number]
        var info: Info2 = Info2 (
                name:names,
                nickName:nickNames,
                number: number,
                bestFriend:best!,
                imageURL:imagesURL
            )
//        var info: Info = Info (
//                name:names,
//                nickName:nickNames,
//                bestFriend:best!,
//                image:images
//            )
        friendData.dic1[key!] = info
        bestFriendRequest()
        print(friendData.dic1[key!])
    }
    @objc func bestFriendRequest() {
        let bestFriendURLString = "http://\(Server.url)/friends/\(friendData.choiceIndex!)/bestFriend"
        guard let url = URL(string: bestFriendURLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": accessToken!]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("네트워크 에러: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
        }.resume()
    }
    @objc func setLabel(){

        friendprofileView.Number.text = number
        self.title = names

        if (best!){
            friendprofileView.BfSwitch.isOn = true
        }else{
            friendprofileView.BfSwitch.isOn = false
        }
        friendprofileView.ProfileView.image = friendData.dic1[friendData.choiceIndex!]!.image
        friendprofileView.ProfileView.layer.cornerRadius = friendprofileView.ProfileView.frame.width / 2
        friendprofileView.ProfileView.clipsToBounds = true
    }
    @objc func getData(){
        key = friendData.choiceIndex
        var dic = friendData.dic1[friendData.choiceIndex!]
        names = dic!.name
        nickNames = dic!.nickName
        number = dic!.number
        best = dic!.bestFriend
        imagesURL = dic!.imageURL
    }
    
}


