//
//  MentTemplateVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
import Tabman
import Pageboy

class TextGuideVC : TabmanViewController {
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "멘트 템플릿"
        setNavigationBar()
        
        
        
        // TabmanViewController 설정
        self.dataSource = self
        
        // TabmanBar 설정
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.layout.contentInset = UIEdgeInsets(top: 10.0, left: 30.0, bottom: 0.0, right: 30.0)
        bar.backgroundView.style = .custom(view: barView)
        bar.buttons.customize { (button) in
            // 버튼 커스텀
            button.layer.cornerRadius = 20
            button.font = UIFont.boldSystemFont(ofSize: 15)
            button.selectedTintColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
            
            if(button.isSelected == true){
                button.backgroundColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
                //여기가 적용이 안댐 ㅜㅜ
            }
            else{
                button.backgroundColor = .systemGray6
                button.tintColor = .black
            }
        }
        bar.indicator.tintColor = .white
        bar.indicator.weight = .custom(value: 1.0)
        addBar(bar, dataSource: self, at: .top)
    }

}

extension TextGuideVC : PageboyViewControllerDataSource{
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return 4
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        switch index {
        case 0:
            return SayHelloTextGuideVC()
        case 1:
            return BirthTextGuideVC()
        case 2:
            return WeddingTextGuideVC()
        case 3:
            return AppointmentTextGuideVC()
        default:
            return nil
        }
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    
}

extension TextGuideVC : TMBarDataSource {
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "안부인사")
        }
        if index == 1 {
            return TMBarItem(title: "생일축하")
        }
        if index == 2 {
            return TMBarItem(title: "결혼식")
        }
        else {
            return TMBarItem(title: "약속잡기")
        }
    }
    
    
}
