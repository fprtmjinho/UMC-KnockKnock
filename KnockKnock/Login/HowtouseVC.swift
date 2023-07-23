//
//  HowtouseVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class HowtouseVC : GuideVC {
    
    var startBtn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
        startBtn = setNextBtn(view: self, title: "시작하기")
       makeAddtarget()
    }
  
}

extension HowtouseVC {
    func makeAddtarget(){
        startBtn.addTarget(self, action: #selector(nextViewfunc(_:)), for: .touchUpInside)
    }
    @objc func nextViewfunc(_: UIButton){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
}
