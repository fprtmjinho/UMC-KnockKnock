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
    
    var keyList: Array<Int> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var bestFriendList: Array<Bool> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraint()
        getBestFriend()
//        getData()
        setTableView()
        makeSubView()
        makeAddTarget()
    }
    override func viewDidAppear(_ animated: Bool) {
        getBestFriend()
    }
   
}
extension FriendListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestFriendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "BestFriendList")
        let BFimage = UIImage(named: "BF")?.resizeImageTo(size: CGSize(width: 65, height: 25))
        cell.backgroundColor = .systemGray6
        cell.accessoryView = UIImageView(image: BFimage)
        
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.black
        cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel!.textColor = UIColor.systemGray2
        return cell
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            friendData.dic[friendData.choiceNumber!] = nil
//            nameList.remove(at: indexPath.row)
//            nickNameList.remove(at: indexPath.row)
//            numberList.remove(at: indexPath.row)
//            bestFriendList.remove(at: indexPath.row)
//            alramList.remove(at: indexPath.row)
//            timeList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            //remove 확인용 alarm 필요
//        }
//        //화이팅!
//    }
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
//        friendData.choiceNumber = keyList[index.row]
        friendData.choiceIndex = keyList[index.row]
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @objc func sortData(){

        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(keyList,numberList).map{($0, $1)}).map{($0, $1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        keyList = combinedList.map{$0.1.0}
        numberList = combinedList.map { $0.1.1 }
//        keyList = combinedList.map{$0.1.1.1.1.1.1}
    }
//    @objc func getData(){
//        var keyCh: Array<Int> = []
//        var nameCh: Array<String> = []
//        var numberCh: Array<String> = []
//        var bestFriendCh: Array<Bool> = []
//        for key in friendData.dic1.keys{
//            let dic = friendData.dic1[key]
//            if dic?.bestFriend == true{
//                keyCh.append(key)
//                nameCh.append(dic!.name)
//                numberCh.append(dic!.number)
//                bestFriendCh.append(dic!.bestFriend)
//            }
//        }
//        keyList = keyCh
//        nameList = nameCh
//        numberList = numberCh
//        bestFriendList = bestFriendCh
//    }
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
    func getBestFriend(){
        let friendURLString = "http://54.180.168.54/bestfriend"
//        let friendURLString = "http://43.200.240.251/bestfriend"
        guard let friendURL = URL(string: friendURLString) else {
            print("찐친 정보를 가져올 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var friendRequest = URLRequest(url: friendURL)
        friendRequest.httpMethod = "GET"
        friendRequest.addValue(accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: friendRequest) { data, response, error in
            guard let data = data else {
                print("찐친 정보를 받아오지 못했습니다.")
                return
            }
            do {
                let user = try JSONDecoder().decode([BestFriendData].self, from: data)
//                print("친구 정보: \(user)")
                var keyCh: [Int] = []
                var nameCh: [String] = []
                var numberCh: [String] = []
                for datas in user{
                    keyCh.append(datas.friendId)
                    nameCh.append(datas.friendName)
                    numberCh.append(datas.phoneNumber)
//                    let freData: Info2 = Info2(
//                        name: datas.friendName,
//                        nickName: "",
//                        number: datas.phoneNumber,
//                        bestFriend: datas.bestFriend,
//                        image: datas.profileImageURL
//                    )
//                    fre.dic1[datas.friendId] = freData
                }
                self.keyList = keyCh
                self.nameList = nameCh
                self.numberList = numberCh
            } catch {
                print("친구 정보 디코딩에 실패하였습니다.")
            }
            DispatchQueue.main.async {
//                self.getData()
                self.sortData()
                self.tableView.reloadData()
            }
        }.resume()
    }
}
