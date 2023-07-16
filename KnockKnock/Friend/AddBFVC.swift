//
//  AddBFVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddBFVC : UIViewController {

    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()


    private func makeSubView(){
        addBtn = setNextBtn(view: self, title: "추가하기")
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요!")
    }
    private func makeConstraint(){
        NSLayoutConstraint.activate([
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            searchFriendBar.heightAnchor.constraint(equalToConstant: 45),
        ])

    }
    private func makeAddTarget(){
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }

    @objc func addBtnFunc(_: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "찐친 추가하기"

        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
}
