//
//  CommunityVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit
import Tabman
import Pageboy

class CommunityVC: TabmanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        self.view.backgroundColor = .white
        
        // TabmanViewController 설정
        self.dataSource = self
        
        // TabmanBar 설정
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            // 버튼 스타일 및 설정을 커스터마이즈할 수 있습니다.
        }
        addBar(bar, dataSource: self, at: .top)
    }
}

// MARK: - PageboyViewControllerDataSource

extension CommunityVC: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2 // GoodVC와 BadVC, 총 2개의 뷰 컨트롤러가 있습니다.
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        if index == 0 {
            return GoodVC() // 좌측에는 GoodVC를 반환합니다.
        } else {
            return BadVC() // 우측에는 BadVC를 반환합니다.
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil // 초기 페이지를 설정하려면 해당 페이지의 인덱스를 반환하거나, nil을 반환하여 기본 동작을 사용할 수 있습니다.
    }
}

// MARK: - TMBarDataSource

extension CommunityVC: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "Good") // 좌측 탭의 제목을 "Good"으로 설정합니다.
        } else {
            return TMBarItem(title: "Bad") // 우측 탭의 제목을 "Bad"로 설정합니다.
        }
    }
}

