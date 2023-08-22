//
//  MyPageController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//

import UIKit
class MyPageController : UIViewController{
    //내 페이지
    let scrollView : UIScrollView! = UIScrollView()
    
    let myPage : MyPage = {
        let myPg = MyPage()
        return myPg
    }()
    let myProfilePage : MyProfilePage = {
        let myProfilePg = MyProfilePage()
        return myProfilePg
    }()
    
    let me = MyData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "내 페이지"
        setNavigationBar()
        customNavigationBar()
        handleEditFunc()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setScrollView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myPage.Name.text = me.name
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setScrollView()
        if let imageData = UserDefaults.standard.data(forKey: "ProfileImage") {
            if let image = UIImage(data: imageData) {
                // 이미지 뷰에 이미지 설정
                myPage.ProfileView.image = image
            }
        }
    }
   
}


extension MyPageController {
    func customNavigationBar(){
        let settingBtn : UIBarButtonItem = {
            let settingBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingBtnPressed(_:)))
            return settingBtn
        }()
        navigationItem.rightBarButtonItem = settingBtn
    }
    
    @objc func settingBtnPressed(_: UIBarButtonItem){
        let settingVC = SettingVC()
        settingVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    func makeSubView(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(myPage)
        scrollView.addSubview(myProfilePage)
    }
    
    func makeConstraint(){
        
    }
    
    func makeAddTarget(){
        self.myPage.editBtn.addTarget(self, action: #selector(editBtnFunc(_:)), for: .touchUpInside)
        self.myPage.changeMessageBtn.addTarget(self, action: #selector(changeMessageFunc(_:)), for: .touchUpInside)
    }

    @objc func editBtnFunc(_: UIButton){
        let editMypageVC = EditMyPageVC()
        editMypageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(editMypageVC, animated: true)
    }
    
    @objc func changeMessageFunc(_: UIButton){
        //메세지 뷰 변환 기능
    }
 
    
    func setScrollView(){
        //스크롤 기능 구현
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        myPage.translatesAutoresizingMaskIntoConstraints = false
        myProfilePage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            //scrollView constraint safeArea와 맞추기
            
            myPage.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            myPage.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            myPage.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            myPage.heightAnchor.constraint(equalToConstant: 530),
            myPage.widthAnchor.constraint(equalTo : scrollView.widthAnchor),

            myProfilePage.topAnchor.constraint(equalTo: myPage.bottomAnchor),
            myProfilePage.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            myProfilePage.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            myProfilePage.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            //ContentView(myPage)의 Constraint를 scrollView의 contentLayoutGuide와 맞춤
            
            myProfilePage.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            //scrollview의 width와 contentview의 width 동일시함
        ])
        
        //수직 스크롤을 위해 height 조정
        let contentViewHeight = myProfilePage.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
    
    }
}





    
    
    



