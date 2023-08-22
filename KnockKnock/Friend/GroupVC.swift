//
//  GroupVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GroupVC: UIViewController {
    
    var addGroupBtn : UIButton = UIButton()

    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    var keyList: Array<Int> = []
    var nameList: Array<String> = []
    
    let group = Group.shared
    let fre = Friends.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGroup()
        setTableView()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    override func viewDidAppear(_ animated: Bool) {
        getGroup()
    }
}


 
 extension GroupVC : UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return nameList.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "groupList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "groupList")
         cell.backgroundColor = .systemGray6

         cell.accessoryType = .disclosureIndicator
         
         cell.textLabel?.text = nameList[indexPath.row]
//         cell.detailTextLabel?.text = timeList[indexPath.row]//memberList로 그룹원 이름들 보여주는것도 낫벧
         cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
         cell.textLabel!.textColor = UIColor.black
//         cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 12)
//         cell.detailTextLabel!.textColor = UIColor.systemGray2
         return cell
     }
  
     func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
         return 60
         //row 두께 설정
     }
     
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             deleteGroup()
             group.dic[keyList[indexPath.row]] = nil
             nameList.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
             //remove 확인용 alarm 필요
         }
         //화이팅!
     }
     
     func deleteGroup() {
         let URLString = "http://\(Server.url)/gathering/\(UserDefaults.standard.integer(forKey: "index"))"
         
         print(URLString)
         
         guard let url = URL(string: URLString) else {
             print("서버 URL을 만들 수 없습니다.")
             return
         }
         
         var request = URLRequest(url: url)
         request.httpMethod = "DELETE"
         let accessToken = UserDefaults.standard.string(forKey: "Authorization")
         request.allHTTPHeaderFields = ["Authorization": accessToken!]
         URLSession.shared.dataTask(with: request) { data, response, error in
             guard let httpResponse = response as? HTTPURLResponse else {
                 print("올바른 HTTP 응답이 아닙니다.")
                 return
             }
             let statusCode = httpResponse.statusCode
             print("HTTP 상태 코드: \(statusCode)")
         }.resume()
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath)
         nextView(index:indexPath)
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

 
extension GroupVC {
    private func makeSubView() {
        view.addSubview(tableView)
        addGroupBtn = setNextBtn(view: self, title: "그룹 추가하기")
    }
    
    private func makeConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
    }
    
    private func makeAddTarget(){
           self.addGroupBtn.addTarget(self, action: #selector(addGroupFunc(_:)), for: .touchUpInside)
    }
    
    @objc func nextView(index:IndexPath) {
            let nextView = GroupProfileVC()
             group.choiceIndex = keyList[index.row]
             UserDefaults.standard.set(keyList[index.row], forKey: "index")
            nextView.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(nextView, animated: true)
        }

    @objc func addGroupFunc(_: UIButton){
        let addGroupVC = AddGroupVC()
        //찐친 추가하기
        addGroupVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addGroupVC, animated: true)
    }
    @objc func getData(){
        var keyCh: Array<Int> = []
        var nameCh: Array<String> = []
        for key in group.dic.keys{
            var dic = group.dic[key]
            keyCh.append(key)
            nameCh.append(dic!.name)
        }
        keyList = keyCh
        nameList = nameCh
    }
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList,keyList).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        keyList = combinedList.map{$0.1}
        nameList = combinedList.map { $0.0 }
    }
//    @objc func groupSelect(index:IndexPath) {
//        let groupSelect = FriendProfileVC()// 여기를 그룹 수정 뷰 or 그룹 정보 뷰로 넘어가게 해야함
//        group.choiceTime = timeList[index.row]
////        friendData.choiceIndex = index.row
//        groupSelect.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(groupSelect, animated: true)
//    }
    func getGroup(){
        let groupURLString = "http://\(Server.url)/gathering"
        guard let groupURL = URL(string: groupURLString) else {
            print("찐친 정보를 가져올 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var groupRequest = URLRequest(url: groupURL)
        groupRequest.httpMethod = "GET"
        groupRequest.addValue(accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: groupRequest) { data, response, error in
            guard let data = data else {
                print("찐친 정보를 받아오지 못했습니다.")
                return
            }
            do {
                let user = try JSONDecoder().decode(GroupDataGet.self, from: data)
//                print("친구 정보: \(user)")
                var keyCh: [Int] = []
                var nameCh: [String] = []
                for datas in user.data{
                    keyCh.append(datas.gatheringId)
                    nameCh.append(datas.title)
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
                print(self.keyList)
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
