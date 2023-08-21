//
//  AddBFVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class AddBFVC : UIViewController{

    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()


    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    let friendData = Friends.shared
    
    var checked: Array<Bool> = []
    
    var keyList: Array<Int> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "찐친 추가하기"
        view.backgroundColor = .white
        handleEditFunc()
        makeSubView()
        makeConstraint()
        getData()
        setTableView()
        addBtn = setNextBtn(view: self, title: "추가하기")
        makeAddTarget()
    }
    
 
}
extension AddBFVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberBook") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "numberBook")
        var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        cell.accessoryView = UIImageView(image:image)
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
        //아래는 추가버튼 보이면 없앨 예정
        
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
    
}

extension AddBFVC {
    func makeSubView(){
        addBtn = setNextBtn(view: self, title: "추가하기")
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요")
    }
    private func makeConstraint(){
        NSLayoutConstraint.activate([
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            searchFriendBar.heightAnchor.constraint(equalToConstant: 45),
        ])

    }
    
    func makeAddTarget(){
        self.addBtn.addTarget(self, action: #selector(addBtnFunc(_:)) , for: .touchUpInside)
    }

    @objc func addBtnFunc(_: UIButton){
        var i=0
        for check in checked{
            if check == true{
                bestFriendRequest(index:keyList[i])
            }
            i+=1
        }
        self.navigationController?.popViewController(animated: true)
    }
    @objc func bestFriendRequest(index:Int) {
        let bestFriendURLString = "http://\(Server.url)/friends/\(index)/bestFriend"
        guard let url = URL(string: bestFriendURLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": accessToken!]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("네트워크 에러: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
        }.resume()
    }
    
    @objc func getData(){
        var keyCh: [Int] = []
        var nameCh: [String] = []
        var numberCh: [String] = []
        var checkedCh: [Bool] = []
        for key in friendData.dic1.keys{
            var dic = friendData.dic1[key]
            if dic?.bestFriend == false{
                keyCh.append(key)
                nameCh.append(dic!.name)
                numberCh.append(dic!.number)
                checkedCh.append(false)
            }
        }
        keyList = keyCh
        nameList = nameCh
        numberList = numberCh
        checked = checkedCh
    }
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(keyList,zip(numberList,checked).map{($0, $1)}).map{($0, $1)}).map{($0, $1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        keyList = combinedList.map { $0.1.0}
        numberList = combinedList.map { $0.1.1.0 }
        checked = combinedList.map { $0.1.1.1 }
        
    }
    @objc func getServerData(){
        let friendURLString = "http://\(Server.url)/friends"
        guard let friendURL = URL(string: friendURLString) else {
            print("친구 정보를 가져올 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var friendRequest = URLRequest(url: friendURL)
        friendRequest.httpMethod = "GET"
        friendRequest.addValue(accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: friendRequest) { data, response, error in
            guard let data = data else {
                print("친구 정보를 받아오지 못했습니다.")
                return
            }
            do {
                let user = try JSONDecoder().decode(FriendDataGet.self, from: data)
//                print("친구 정보: \(user)")
                let fre = Friends.shared
                let data = user.data
                for datas in data{
                    let freData: Info2 = Info2(
                        name: datas.friendName,
                        nickName: "",
                        number: datas.phoneNumber,
                        bestFriend: datas.bestFriend,
                        imageURL: datas.profileImageURL
                    )
                    fre.dic1[datas.friendId] = freData
                }
            } catch {
                print("친구 정보 디코딩에 실패하였습니다.")
            }
            DispatchQueue.main.async {
                self.getData()
                self.sortData()
                self.tableView.reloadData()
            }
        }.resume()
    }
    

}
