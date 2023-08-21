//
//  GroupMemberVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/20.
//

import UIKit
class GroupMemberVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()
    
    let addGroupView : AddGroupView = AddGroupView()
    var addMemberList: Array<String> = []
    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    let friendData = Friends.shared
    let group = Group.shared
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var bestFriendList: Array<Bool> = []
    
    var checked: Array<Bool> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.handleEditFunc()
        view.backgroundColor = .white
        setNavigationBar()
        self.title = "추가 가능한 사람"
        getData()
        sortData()
        makeSubView()
        makeConstraint()
        
        setTableView()
        addBtn = setNextBtn(view: self, title: "추가하기")
        makeAddTarget()
    }
    
}

extension GroupMemberVC {
    @objc func getData(){
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        var checkedCh: Array<Bool> = []
        for key in friendData.dic.keys{
            if !addMemberList.contains(key){
                var dic = friendData.dic[key]
                nameCh.append(dic!.name)
                numberCh.append(key)
                bestFriendCh.append(dic!.bestFriend)
                if addGroupView.numberList.contains(key)
                {
                    checkedCh.append(true)
                }
                else {
                    checkedCh.append(false)
                }
            }
        }
        nameList = nameCh
        numberList = numberCh
        bestFriendList = bestFriendCh
        checked = checkedCh
        print(nameList)
    }
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(numberList,zip(bestFriendList,checked).map{($0, $1)}).map{($0,$1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        numberList = combinedList.map { $0.1.0 }
        bestFriendList = combinedList.map {$0.1.1.0}
        checked = combinedList.map{$0.1.1.1}
    }
    func makeSubView(){
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요!")
        addBtn = setNextBtn(view: self, title: "추가하기")
    }
    
    func makeConstraint(){
        NSLayoutConstraint.activate([
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            searchFriendBar.heightAnchor.constraint(equalToConstant: 45),
            ])
    }
    
    func makeAddTarget(){
        addBtn.addTarget(self, action: #selector(addBtnFunc(_:)), for: .touchUpInside)
    }
    
    
    @objc func addBtnFunc(_: UIButton){
        setData()
        navigationController?.popViewController(animated: true)
    }
    @objc func setData(){
        var memCh: [String] = []
        var i = 0
        for check in checked{
            if check{
                memCh.append(numberList[i])
              
            }
            i+=1
        }
        group.groupMember = memCh
    }
}
extension GroupMemberVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberBook") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "numberBook")
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        if (checked[indexPath.row]==true) {
            cell.accessoryView = UIImageView(image:selectedImage)
        }
        else if (checked[indexPath.row]==false) {
            cell.accessoryView = UIImageView(image:unSelectedImage)
        }
           
           cell.textLabel?.text = nameList[indexPath.row]
           cell.detailTextLabel?.text = numberList[indexPath.row]
           
           cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
           cell.textLabel?.textColor = UIColor.black
           cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
           cell.detailTextLabel?.textColor = UIColor.systemGray2
           
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let cell = tableView.cellForRow(at: indexPath)
        
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
        }
    }
    
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
    
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
