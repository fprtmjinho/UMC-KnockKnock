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
    
    func makeSubView(){
        self.view.addSubview(myPage)
        self.view.addSubview(scrollView)
        scrollView.addSubview(myProfilePage)
    }
    
    func makeConstraint(){
        
    }
    
    func makeAddTarget(){
        
    }
    
 
    
    func setScrollView(){
        //스크롤 기능 구현
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        myPage.translatesAutoresizingMaskIntoConstraints = false
        myProfilePage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myPage.heightAnchor.constraint(equalToConstant: 420),
            
            
            
            scrollView.topAnchor.constraint(equalTo: myPage.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            //scrollView constraint safeArea와 맞추기
            
            myProfilePage.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "내 페이지"
        setNavigationBar()
        customNavigationBar()
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setScrollView()
       
        
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
        navigationController?.pushViewController(settingVC, animated: true)
    }
}





    
    
    



