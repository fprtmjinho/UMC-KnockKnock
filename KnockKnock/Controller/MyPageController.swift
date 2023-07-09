//
//  MyPageController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//

import UIKit
class MyPageController : UINavigationController{
    let scrollView : UIScrollView! = UIScrollView()
    
    let myPage : MyPage = {
        let myPg = MyPage()
        return myPg
    }()
    let myProfilePage : MyProfilePage = {
        let myProfilePg = MyProfilePage()
        return myProfilePg
    }()

    

    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "My Page"
        super.viewDidLoad()
        setNavigationBar()
        self.view.backgroundColor = .white
        self.view.addSubview(myPage)
        self.view.addSubview(scrollView)
        scrollView.addSubview(myProfilePage)
        setScrollView()
        //Scroll 기능 구현
        
    }
    
 
    
    func setScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        myPage.translatesAutoresizingMaskIntoConstraints = false
        myProfilePage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myPage.heightAnchor.constraint(equalToConstant: 450),
            
            
            
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
   
}

extension MyPageController{
    func setNavigationBar(){
        self.navigationController?.navigationBar.topItem?.title = "My Page"
    }
}



    
    
    



