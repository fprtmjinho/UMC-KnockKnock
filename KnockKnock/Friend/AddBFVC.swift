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
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var bestFriend: Array<Bool> = []
    var alramList: Array<Bool> = []
    var timeList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "찐친 추가하기"
        view.backgroundColor = .white

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
        var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
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
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let cell = tableView.cellForRow(at: indexPath)
        
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
            //friendData.bestFriend[indexList[indexPath.row]] = true
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
            //friendData.bestFriend[indexList[indexPath.row]] = false
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
                var formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                var info: Info = Info(
                    name: nameList[i],
                    nickName: nickNameList[i],
                    bestFriend: true,
                    alram: true,
                    time:formatter.string(from: Date()))
                friendData.dic[numberList[i]] = info
            }
            i+=1
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func getData(){
        for key in friendData.dic.keys{
            let dic = friendData.dic[key]
            if dic?.bestFriend == false{
                nameList.append(dic!.name)
                numberList.append(key)
                nickNameList.append(dic!.nickName)
                bestFriend.append(dic!.bestFriend)
                checked.append(false)
                alramList.append(dic!.alram)
                timeList.append(dic!.time)
            }
        }
    }

}
