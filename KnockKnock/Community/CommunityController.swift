//
//  InformationController.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit
import Tabman
import Pageboy

class CommunityController: TabmanViewController {
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    
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
        bar.backgroundView.style = .custom(view: barView)
        bar.buttons.customize { (button) in
            // 버튼 커스텀
            button.selectedTintColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
            button.backgroundColor = .white
        }
        
        bar.indicator.tintColor = .clear
        bar.tintColor = .white
        bar.backgroundColor = .white
        bar.indicator.weight = .custom(value: 1.0)
        addBar(bar, dataSource: self, at: .top)
    }
}

extension CommunityController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        if index == 0 {
            return GoodVC() // 좌측
        } else {
            return BadVC() // 우측
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

extension CommunityController: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "선 게시판")
        } else {
            return TMBarItem(title: "악 게시판")
        }
    }
}
