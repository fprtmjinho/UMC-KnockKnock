//
//  AddBFVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddBFVC : GetInformationVC{
    //주소록 불러오기 VC 상속
    //인데 하면 안됨
    //수정 필요

 
    override func makeAddTarget(){
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }

    @objc func addBtnFunc(_: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "찐친 추가하기"
    
        makeAddTarget()
    }
}
