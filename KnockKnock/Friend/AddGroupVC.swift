//
//  AddGroupVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddGroupVC : UIViewController {
    //스크롤뷰
    let scrollView : UIScrollView! = UIScrollView()
    
    var addBtn : UIButton = UIButton()
    let addGroupView : AddGroupView = {
        let view = AddGroupView()
       return view
    }()
    
    let group = Group.shared
    
    var groupName: String = ""
    var groupMember: [String] = []
    var groupPlace: String = ""
    var groupTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 추가하기"
        setScrollView()
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "모임 추가하기"
        setScrollView()
        
        AddGroupView().memberTableview.reloadData()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
  
    
}

extension AddGroupVC {
    private func setScrollView(){
        //scrollView 설정
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
     
    }

    private func makeSubView(){
        scrollView.addSubview(addGroupView)
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    private func makeConstraint(){
        addGroupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addGroupView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            addGroupView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            addGroupView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            addGroupView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            addGroupView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        //수직 스크롤을 위해 height 조정
        let contentViewHeight = addGroupView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
      
    }
    
    private func makeAddTarget(){
        self.addGroupView.addmemberBtn.addTarget(self, action: #selector(addmemberFunc(_:)), for: .touchUpInside)
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }
    @objc func addmemberFunc(_: UIButton){
        //그룹 구성원 추가하기
        let memberVC = GroupMemberVC()
        navigationController?.pushViewController(memberVC, animated: true)
    }

    @objc func addBtnFunc(_: UIButton){
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        groupTime = formatter.string(from: Date())
        if let name = addGroupView.nametext.text{
            groupName = name
        }
//        for number in addGroupView.numberList{
//            groupMember.append(number)
//        }
//        if let gPlace = addGroupView.placetext.text{
//            groupPlace = gPlace
//        }
        if groupName == ""{
            // 팝업이나 표시
            return
        }
//        if groupMember.count == 0{
//            // 팝업이나 표시
//            return
//        }
//        if groupPlace == ""{
//            //팝업이나 표시
//            return
//        }
        setGroupData()
        self.navigationController?.popViewController(animated: true)
    }
    func setGroupData(){
        let groupInfo: GroupInfo = GroupInfo(
            name: groupName,
            user: [],
            place: "",
            alram: true,
            time: groupTime
        )
        group.dic[groupTime] = groupInfo
    }
}
