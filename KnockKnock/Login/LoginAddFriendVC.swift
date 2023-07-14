//
//  LoginAddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
import Contacts
class LoginAddFriendVC : AllowApproachVC {


    let searchFriendBar : UISearchBar = {
        let searchFriendBar = UISearchBar()
        
        searchFriendBar.placeholder = "친구를 검색해주세요!"
        searchFriendBar.backgroundColor = .systemGray6
        searchFriendBar.isTranslucent = false
        
        searchFriendBar.searchTextField.backgroundColor = .systemGray6
        searchFriendBar.layer.cornerRadius = 25
        searchFriendBar.clipsToBounds = true
        searchFriendBar.searchBarStyle = .default
        searchFriendBar.barTintColor = .systemGray6
        
        
        searchFriendBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                                 for: .search, state: .normal)
        
        return searchFriendBar
    }()
    
   override func makeSubView(){
       view.addSubview(titleLabel)
       view.addSubview(subtitleLabel)
       view.addSubview(searchFriendBar)
       
    }
    
    override func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchFriendBar.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            searchFriendBar.topAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.bottomAnchor),
            searchFriendBar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        
        ])
    }
    
   override func makeAddTarget(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
     
    }
    
    
    @objc func nextView(_: UIButton){
        let loginAddBFVC = LoginAddBestFriendVC()
        self.navigationController?.pushViewController(loginAddBFVC, animated: true)
    }
    @objc override func skipBtnFunc(_: UIBarButtonItem){
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }
    
    func setLabel(){
        titleLabel.text = "연락할 친구를\n추가하세요!"
        subtitleLabel.text = "시기와 상관없이 언젠가 연락할 사람의 연락처를\n추가해주세요.\n\n6개월에 한 번씩 알림을 보내드릴게요.\n연락 주기는 추후에 변경이 가능합니다!"
    }
    //일부 글씨만 두껍게 수정해야 함
    
    
    
    
    //tableView
    var tableView = UITableView(frame: .zero, style: .plain)
    
    //numberArray
    var contacts: NSMutableArray = NSMutableArray()
    
    
    var test : Array = ["가나다", "나다라", "다라마", "라마바", "마바사", "바사아", "사아자", "아자차 ", "자차카", "차카타", "김 안드레아", "황인호", "최지웅"]
    //test용 array
    // -> titleLabel.text랑 test.count 변경 필요
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        downloadNumberBook()
        
        setTableView()
        nextBtn = setNextBtn(view: self, title: "다음")
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
        setLabel()
       
    }
}


extension LoginAddFriendVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Address")
        
        
        
        /*
        // 셀 구성
        if let contact = contacts[indexPath.row] as? CNContact {
            cell?.textLabel?.text = CNContactFormatter.string(from: contact, style: .fullName)
            if let phoneNumber = contact.phoneNumbers.first?.value {
                cell?.detailTextLabel?.text = phoneNumber.stringValue
            } else {
                cell?.detailTextLabel?.text = ""
            }
        } else {
            cell?.textLabel?.text = ""
            cell?.detailTextLabel?.text = ""
        }
        
        */
         
        
        var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        cell?.accessoryView = UIImageView(image:image)
        //touch event 어떻게 처리할건지 고민해야 함
        //touch되면 SelectedCheckCircle로 이미지 변경
        // 그냥 sf-symbol로 버튼 구현 후 tintcolor 변경해도 괜찮을듯
        //상의 후 결정
        
        
        
        cell?.textLabel?.text = test[indexPath.row]
        
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell?.textLabel?.textColor = UIColor.black
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell?.detailTextLabel?.textColor = UIColor.gray
        
        return cell!
    }
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
    
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Address")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 3),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}




extension LoginAddFriendVC {
    //주소록 읽어오기

        private func readContacts() {
            let store = CNContactStore()
            
            // Permission 획득
            store.requestAccess(for: .contacts) { (granted, error) in
                guard granted else {
                    return;
                }
                // Request 생성
                let request: CNContactFetchRequest = self.getCNContactFetchRequest()
                
                // 주소록 읽을 때 정렬해서 읽어오도록 설정
                request.sortOrder = CNContactSortOrder.userDefault
                
                // Contacts 읽기
                // 주소록이 1개씩 읽혀서 usingBlock으로 들어온다.
                try! store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                    
                    // Phone No가 없을때 return
                    if contact.phoneNumbers.isEmpty {
                        return
                    }
                    
                    // NSMutableArray Add contact
                    // 읽어온 주소록을 NSMutableArray에 저장
                    self.contacts.add(contact)
                })
                self.saveContact()
            }
        }
    private func saveContact() {
            
            let store = CNContactStore()
            
            // Permission 획득
            store.requestAccess(for: .contacts) { (granted, error) in
                guard granted else {
                    return;
                }
                
                let contact:CNMutableContact = self.getNewContact()
                
                let request = CNSaveRequest()
                request.add(contact, toContainerWithIdentifier:nil)
                
                // 저장
                try! store.execute(request)
            }
        }
        
        // 새로 등록할 주소록 생성
        private func getNewContact() -> CNMutableContact {
            let contact = CNMutableContact()
            contact.givenName = "name"
            contact.familyName = "familyName"
            
            let phone = CNLabeledValue(label:CNLabelPhoneNumberMobile,
                                       value:CNPhoneNumber(stringValue:"010-0000-0000"))
            let tel = CNLabeledValue(label:CNLabelPhoneNumberMain,
                                     value:CNPhoneNumber(stringValue:"02-0000-0000"))
            contact.phoneNumbers = [phone, tel]
            
            let email: NSString = "bizCard@gmail.com"
            contact.emailAddresses = [CNLabeledValue(label:CNLabelWork, value:email)]
            
            return contact
        }
        

        // Request 생성
        private func getCNContactFetchRequest() -> CNContactFetchRequest {
            // 주소록에서 읽어올 key 설정
            let keys: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                                           CNContactPhoneNumbersKey,
                                           CNContactEmailAddressesKey,
                                           CNContactJobTitleKey,
                                           CNContactPostalAddressesKey] as! [CNKeyDescriptor]
            
            return CNContactFetchRequest(keysToFetch: keys)
        }
    
    @objc func downloadNumberBook(){
        readContacts()
    }
}
