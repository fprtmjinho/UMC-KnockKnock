//
//  tabBarController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit
class TabBarController : UITabBarController {
    override func viewDidLoad() {
    let SearchVC = UINavigationController(rootViewController: SearchController())
      let FriendVC = UINavigationController(rootViewController: FriendController())
      let CommunityVC = UINavigationController(rootViewController: CommunityController())
      let MyPageVC = UINavigationController(rootViewController: MyPageController())
      
      self.viewControllers = [SearchVC, FriendVC, CommunityVC, MyPageVC]
        
        
        if let items = self.tabBar.items{
            items[0].image = UIImage(named: "SearchUnselected")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[1].image = UIImage(named: "FriendUnselected")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[2].image = UIImage(named: "CommunityUnselected")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            items[3].image = UIImage(named: "MyPageUnselected")?.resizeImageTo(size: CGSize(width: 35, height: 35))
            //items[1].image = UIImage(systemName: "person.2")
            //items[2].image = UIImage(systemName: "list.clipboard")
            //items[3].image = UIImage(systemName: "person.crop.square")
            
            items[0].title = "친구찾기"
            items[1].title = "찐친관리"
            items[2].title = "게시판"
            items[3].title = "내페이지"
        }
        
        self.tabBar.unselectedItemTintColor = .systemGray4
        self.tabBar.tintColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        //tabBar 색을 선택 유무에 따라 바꾸기 때문에
        //아이콘 색 필요X
        
    }
    
}
