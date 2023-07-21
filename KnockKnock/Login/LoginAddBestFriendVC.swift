//
//  LoginAddBestFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class LoginAddBestFriendVC : AllowApproachVC {
    //이전 VC 상속
    
    var searchFriendBar : UISearchBar = UISearchBar()
    
    override func makeSubView(){
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요")
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    override func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            searchFriendBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
    }
    
   override func makeAddTarget(){
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        self.nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    
    @objc func nextView(_: UIButton){
        setFriendData()
        let loginSuccessVC = LoginSuccessVC()
        self.navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    @objc override func skipBtnFunc(_: UIBarButtonItem){
        setEmptyChecked()
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }
    @objc func setEmptyChecked(){
        var i=0;
        for n in nameList{
            checked[0]=false
            i+=1
        }
        friendData.bestFriend = checked
    }
    
    @objc func setLabel(){
        titleLabel.text = "정말 친한 친구,\n'찐친'을 골라주세요!"
        subtitleLabel.text = "자신과 정말 친한 찐친들의 연락처를 골라주세요.\n\n2개월에 한 번씩 알림을 보내드릴게요.\n연락 주기는 추후에 변경이 가능합니다!"
    }
    //일부 글씨만 두껍게 수정해야 함
    let friendData = Friends.shared
    
    var checked: Array<Bool> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var date: Array<String> = []
    var tableView = UITableView(frame: .zero, style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        getData()
        
        setTableView()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
        setLabel()
    }
    @objc func getData(){
        nameList = friendData.name
        numberList = friendData.number
        date = friendData.time
    }
    @objc func setFriendData(){
        let fre = Friends.shared
        fre.bestFriend = checked
        var i=0
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        for check in checked{
            if (check==true){
                date[i]=formatter.string(from: Date())
            }
            i=i+1
        }
        fre.time = date
    }
    
}
extension LoginAddBestFriendVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "friendList")
            var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
            cell.accessoryView = UIImageView(image:image)
            cell.textLabel?.text = nameList[indexPath.row]
            cell.detailTextLabel?.text = numberList[indexPath.row]
            
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.detailTextLabel?.textColor = UIColor.systemGray2
            checked.append(false)
            
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
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
