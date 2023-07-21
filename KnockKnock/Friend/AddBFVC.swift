//
//  AddBFVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddBFVC : UIViewController{
   
    var addBtn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "찐친 추가하기"
    
        makeAddTarget()
    }
}

extension AddBFVC {
    func makeSubView(){
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    
    func makeAddTarget(){
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }

    @objc func addBtnFunc(_: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
