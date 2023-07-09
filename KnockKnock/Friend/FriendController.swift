//
//  FriendController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//

import UIKit
class FriendController : UIViewController{
    //찐친관리 페이지


    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.navigationController?.navigationBar.topItem?.title = "내 찐친"
        self.view.backgroundColor = .white
        
    }
 
}
