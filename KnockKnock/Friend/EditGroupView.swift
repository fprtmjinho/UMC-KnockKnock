//
//  EditGroupView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/05.
//

import UIKit
class EditGroupView : UIView {
    
    let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 이름"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nametext : UITextField = {
       let text = UITextField()
        text.placeholder = "이름을 입력해주세요"
        text.addLeftPadding()
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 5
        return text
    }()
    
    let memberLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 구성원"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    //구성원에 대한 tableView
    let memberTableview = UITableView(frame: .zero, style: .plain)
    
    let addmemberBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("+ 추가하기", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.systemGray4.cgColor
        //layer의 색을 변경할 때는 cgColor 사용해야 함
        return btn
    }()
    
    let placeLabel : UILabel = {
       let label = UILabel()
        label.text = "만나는 위치"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let placetext : UITextField = {
       let text = UITextField()
        text.placeholder = "만나는 위치를 입력해주세요"
        text.addLeftPadding()
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 5
        return text
    }()
    
}

extension EditGroupView {
    
}
