//
//  EditMyPageVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/13.
//

import UIKit
class EditMyPageVC : EditProfileVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        saveBtn.addTarget(self, action: #selector(saveMyData(_:)), for: .touchUpInside)
        
    }
    @objc func saveMyData(_:UIButton){
        var newName: String = ""
        var newNickName: String = ""
        if let name = nameText.text{
            newName = name
        }
        if let nickName = nicknameText.text{
            newNickName = nickName
        }
        me.name = newName
        me.nickName = newNickName
        self.navigationController?.popViewController(animated: true)
    }
}
