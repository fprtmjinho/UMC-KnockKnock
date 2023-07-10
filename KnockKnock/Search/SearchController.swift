//
//  SearchController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//
import UIKit
class SearchController : UIViewController{
    //친구 찾기 페이지
    
   
 

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view.backgroundColor = .white
        customNavigationBar()
        
    }
    

}

extension SearchController {
    func customNavigationBar(){
        //친구 추가
        let navigationBar = navigationController!.navigationBar
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtn(_:)))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        
        //navigation title로 할지 따로 label로 만들지
        /*
        navigationItem.title = "Name님,\n연락하고 싶은 분이 생겼나요?"
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 25)]
         */
        
        
    }
    
    @objc func addBtn(_: UIButton){
        let addFriendVC = AddFriendVC()
        addFriendVC.hidesBottomBarWhenPushed = true
        //push할 때 tabBar 숨김처리
        navigationController?.pushViewController(addFriendVC, animated: true)
        //연락처 추가 뷰로 넘어감
    }
    
    
}
