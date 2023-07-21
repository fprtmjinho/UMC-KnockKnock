//
//  MyProfilePage.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/07.
//

import UIKit
class MyProfilePage : UIView {
    let profileInformation : UILabel = {
       let profileinfo = UILabel()
        profileinfo.text = "내가 쓴 글"
        profileinfo.font = UIFont.boldSystemFont(ofSize: 18)
        return profileinfo
    }()
    
    let GuideLine : UIView = {
        let guide = UIView()
        guide.backgroundColor = .systemGray6
        return guide
    }()
    
    let editBtn : UIButton = {
       let editbtn = UIButton()
        editbtn.setTitle("편집", for: .normal)
        editbtn.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        editbtn.tintColor = .systemGray
        editbtn.backgroundColor = .clear
        return editbtn
    }()
    

     override init(frame: CGRect) {
         super.init(frame: frame)
         makeSubView()
         makeConstraint()
         
       
     }
     
     required init?(coder _: NSCoder) {
         fatalError("Error")
     }
    
}

extension MyProfilePage {
    func makeConstraint(){
        GuideLine.translatesAutoresizingMaskIntoConstraints = false
        profileInformation.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            GuideLine.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
        GuideLine.heightAnchor.constraint(equalToConstant: 1),
        GuideLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        GuideLine.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        profileInformation.topAnchor.constraint(equalTo: GuideLine.bottomAnchor, constant: 25),
        profileInformation.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
        profileInformation.widthAnchor.constraint(equalToConstant: 90),
        editBtn.topAnchor.constraint(equalTo: GuideLine.bottomAnchor, constant: 20),
        editBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
        editBtn.heightAnchor.constraint(equalToConstant: 20),
        editBtn.leadingAnchor.constraint(equalTo: profileInformation.trailingAnchor, constant: 150)
        
        ])
    }
    
    func makeSubView(){
        self.addSubview(GuideLine)
        self.addSubview(profileInformation)
        self.addSubview(editBtn)
    }
}
