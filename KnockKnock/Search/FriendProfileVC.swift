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
    
    var names: String = ""
    var number: String = ""
    var nickNames: String = ""
    var best: Bool?
    var alrams: Bool?
    var times: String = ""
    var images: Data?

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Name"
        //title은 cell 따라 변경 필요
        //임의 지정
        setNavigationBar()
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
            friendprofileView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
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
        var info: Info = Info (
                name:names,
                nickName:nickNames,
                bestFriend:best!,
                alram:alrams!,
                time:times,
                image:images!
            )
        friendData.dic[number] = info
        print(friendData.dic[number])
    }
    @objc func setLabel(){

        friendprofileView.Number.text = number
        self.title = names

        if (best!){
            friendprofileView.BfSwitch.isOn = true
        }else{
            friendprofileView.BfSwitch.isOn = false
        }
        if images != nil{
            friendprofileView.ProfileView.layer.cornerRadius = friendprofileView.ProfileView.frame.width/2
            friendprofileView.ProfileView.image = UIImage(data: images!)
            friendprofileView.ProfileView.clipsToBounds = true
        }
    }
    @objc func getData(){
        number = friendData.choiceNumber!
        var dic = friendData.dic[number]
        names = dic!.name
        nickNames = dic!.nickName
        best = dic!.bestFriend
        alrams = dic!.alram
        times = dic!.time
        images = dic!.image
    }
    
}


