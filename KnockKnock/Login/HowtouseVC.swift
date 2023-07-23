//
//  HowtouseVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class HowtouseVC : GuideVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       makeAddtarget()
    }
  
}

extension HowtouseVC {
    func makeAddtarget(){
       
    }
    @objc func nextViewfunc(_: UIButton){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
}
