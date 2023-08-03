//
//  BadVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class BadVC: UIViewController {
    
    var page: Int = 1 // 페이지 번호
    
    var hasNext: Bool? // 다음 페이지가 있는지 여부
    
    let refreshControl = UIRefreshControl()
    
    // 버튼 탭 여부를 저장하는 배열
    var buttonPressedStates: [String:Bool] = ["10대": false, "20대": false, "30대": false, "40대~": false]
    
    var posts: [PostParsing] = []
    
    func fetchData(page: Int) {
        let urlString = "http://43.200.240.251/board/allPosts?boardType=GOOD&page=\(page)&size=5"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                if page == 1 {
                    self.posts = response.posts
                } else {
                    self.posts.append(contentsOf: response.posts)
                }
                
                self.hasNext = response.hasNext
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
    
    // 나이대 버튼 관련: buttonStackView, buttonTitles, createButtons
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonTitles = ["10대", "20대", "30대", "40대~"]
    
    
    
    // 검색창 관련: searchBar
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "검색어나 태그를 입력해주세요 :)"
        searchBar.isTranslucent = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                           for: .search, state: .normal)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    
    // 테이블뷰 관련: tableView
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
}

extension BadVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomCell
        let post = posts[indexPath.row]
        cell.configureCell(with: post)
        cell.makeSubView()
        cell.makeConstraint()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.categoryValue = 0 // 선 게시판
        postVC.post.title = posts[indexPath.row].title
        postVC.post.content = posts[indexPath.row].content
        postVC.post.likes = posts[indexPath.row].likes
        postVC.post.comments = posts[indexPath.row].comments
        postVC.categoryValue = posts[indexPath.row].boardType
        postVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 현재 표시되는 테이블뷰 셀의 인덱스가 마지막 row 인덱스인지 확인
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            if hasNext == false {
                return
            }
            page += 1
            fetchData(page: page)
        }
    }
}

extension BadVC {
    func createButtons() {
        for title in buttonTitles {
            let button = UIButton(type: .custom)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button.layer.cornerRadius = 16
            button.widthAnchor.constraint(equalToConstant: 75).isActive = true
            
            buttonStackView.addArrangedSubview(button)
        }
    }
    func makeSubView() {
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 5
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "PostCell")
        
        if let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? CustomCell {
            postCell.makeSubView()
        }
        
        view.addSubview(buttonStackView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func makeConstraint() {
        let horizontalMargin: CGFloat = 30
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalMargin),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalMargin),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSubView()
        makeConstraint()
        createButtons()
        
        fetchData(page: page)
        
        // Pull-to-refresh 기능을 위한 refreshControl 설정
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            return
        }
        
        if sender.isSelected {
            sender.isSelected = false
            buttonPressedStates[title] = false
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        } else {
            sender.isSelected = true
            buttonPressedStates[title] = true
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        }
        
        print("Button tapped: \(title)")
        print(buttonPressedStates)
        
    }
    
    // Pull-to-refresh를 위한 메서드
    @objc func refreshData() {
        // 데이터를 다시 가져오고 테이블뷰를 새로고침
        page = 1
        fetchData(page: page)
        
        // 새로고침이 완료되면 UIRefreshControl을 종료
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
    
}

