//
//  FriendListVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//
import UIKit

class FriendListVC: UIViewController {
    var addFriendBtn : UIButton = UIButton()
    

    var tableView = UITableView(frame: .zero, style: .plain)
    
    let friendData = Friends.shared
    
    var best: Array<Bool> = []
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var bestFriendList: Array<Bool> = []
    var alramList: Array<Bool> = []
    var timeList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraint()

        getData()
        setTableView()
        makeSubView()
        makeAddTarget()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getData()
        sortData()
        tableView.reloadData()
        setTableView()
        makeSubView()
        makeAddTarget()
    }
   
}
extension FriendListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestFriendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "BestFriendList")
        cell.backgroundColor = .systemGray6

        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.black
        cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel!.textColor = UIColor.systemGray2
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        nextView(index:indexPath)
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        
    }
    
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "friendList")
        
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
    
    //ui extension
    func makeSubView() {
        addFriendBtn = setNextBtn(view: self, title: "찐친 추가하기")
    }
    
    func makeConstraint() {
        
    }
    func makeAddTarget(){
          self.addFriendBtn.addTarget(self, action: #selector(addFriendFunc(_:)), for: .touchUpInside)
      }

      @objc func addFriendFunc(_: UIButton){
          let addBFVC = AddBFVC()
          //찐친 추가하기
          addBFVC.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(addBFVC, animated: true)
      }
    @objc func nextView(index:IndexPath) {
        let nextView = FriendProfileVC()
        friendData.choiceNumber = numberList[index.row]
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @objc func sortData(){

        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(nickNameList,zip(numberList, zip(bestFriendList,zip(alramList,timeList).map{($0,$1)}).map{($0, $1)}).map{($0, $1)}).map{($0, $1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        nickNameList = combinedList.map {$0.1.0}
        numberList = combinedList.map { $0.1.1.0 }
        bestFriendList = combinedList.map { $0.1.1.1.0 }
        alramList = combinedList.map {$0.1.1.1.1.0}
        timeList = combinedList.map{$0.1.1.1.1.1}
    }
    @objc func getData(){
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var nickNameCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        var alramCh: Array<Bool> = []
        var timeCh: Array<String> = []
        for key in friendData.dic.keys{
            let dic = friendData.dic[key]
            if dic?.bestFriend == true{
                nameCh.append(dic!.name)
                numberCh.append(key)
                nickNameCh.append(dic!.nickName)
                bestFriendCh.append(dic!.bestFriend)
                alramCh.append(dic!.alram)
                timeCh.append(dic!.time)
            }
        }
        nameList = nameCh
        numberList = numberCh
        nickNameList = nickNameCh
        bestFriendList = bestFriendCh
        alramList = alramCh
        timeList = timeCh
    }
    @objc func checkDouble(phoneNumber:String) -> Bool{
        let fre = Friends.shared
        let numberList = numberList
        for check in numberList{
            if check == phoneNumber{
                return true;
            }
        }
        return false;
    }
}
