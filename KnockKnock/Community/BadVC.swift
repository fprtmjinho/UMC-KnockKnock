//
//  BadVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit
import SDWebImage

class BadVC: UIViewController
{
    
    let refreshControl = UIRefreshControl()
    
    var keyword = "" // 검색 키워드
    var count = 0 // 키워드 검색 상태에서 새로고침을 했는지를 인식하기 위한 변수
    
    var age: Int = 0 // 나이대
    
    var page: Int = 1 // 페이지 번호
    
    var hasNext: Bool? // 다음 페이지가 있는지 여부
    
    var posts: [PostParsing] = []
    
    func fetchData(page: Int) {
        var urlString: String = ""
        
        switch age
        {
        case 0: // 전체 나이대
            urlString = "http://\(Server.url)/board/allPosts?boardType=EVIL&page=\(page)&size=5"
        case 1:
            if let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                urlString = "http://\(Server.url)/board/search?boardType=EVIL&searchType=TITLE_AND_CONTENT&keyword=\(encodedKeyword)&page=\(page)&size=5"
            }

        default: // 선택한 나이대
            urlString = "http://\(Server.url)/board/filter?boardType=EVIL&ageGroup=\(age)&page=\(page)&size=5"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                
                if page == 1 {
                    self.posts = response.posts
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    let newPosts = response.posts
                    let currentPostsCount = self.posts.count
                    let (start, end) = (currentPostsCount, newPosts.count + currentPostsCount)
                    let indexPaths = (start..<end).map { IndexPath(row: $0, section: 0) }
                    
                    DispatchQueue.main.async {
                        self.posts.append(contentsOf: newPosts)
                        self.tableView.insertRows(at: indexPaths, with: .automatic)
                    }
                }
                
                self.hasNext = response.hasNext
                
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
    
    
    // 나이대 버튼 관련: buttonStackView, button1,2,3,4
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let button1: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("10대", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(button1Pressed(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return button
    }()
    let button2: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("20대", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(button2Pressed(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return button
    }()
    let button3: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("30대", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(button3Pressed(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return button
    }()
    let button4: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("40대~", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(button4Pressed(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return button
    }()
    
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

extension BadVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomCell
        let post = posts[indexPath.row]
        cell.resetCell()
        cell.profileImageView.sd_setImage(with: URL(string: post.profileImageUrl), placeholderImage: UIImage(named: "anonymous"))
        cell.imagesView.image = nil
        
        if post.imageUrl.count != 0 {
            if let imageUrl = URL(string: post.imageUrl[0]) {
                        SDImageCache.shared.removeImage(forKey: imageUrl.absoluteString)
                    }
            cell.imagesView.sd_setImage(with: URL(string: post.imageUrl[0]), placeholderImage: UIImage(named: "imageLoading"))
            cell.makeSubView1()
            cell.makeConstraint1()
        } else {
            cell.makeSubView2()
            cell.makeConstraint2()
        }
        
        cell.configureCell(with: post)
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.categoryValue = posts[indexPath.row].boardType
        postVC.post = Post(postID: posts[indexPath.row].postID, profile: posts[indexPath.row].profileImageUrl, name: posts[indexPath.row].name, title: posts[indexPath.row].title, content: posts[indexPath.row].content, imageURL: posts[indexPath.row].imageUrl, images: [], time: posts[indexPath.row].createdAt, likes: posts[indexPath.row].likes, comments: posts[indexPath.row].comments)
        postVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = tableView.contentSize.height
        let tableViewHeight = tableView.bounds.size.height
        
        if position >= (contentHeight - tableViewHeight - 100) && hasNext == true {
            // 다음 페이지 불러오기
            page += 1
            fetchData(page: page)
        }
    }
    
}

extension BadVC {

    func makeSubView() {
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 5
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "PostCell")
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        buttonStackView.addArrangedSubview(button4)
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
        setupRefreshControl() // 새로고침
        fetchData(page: page) // 첫 화면: page = 1
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshPostsData(_:)), for: .valueChanged)
    }
    
    @objc func refreshPostsData(_ sender: Any) {
        if age == 1 {
            if count == 0 {
                count += 1
            }
            else {
                age = 0
                count = 0
                keyword = ""
                searchBar.text = ""
                button1.isEnabled = true
                button2.isEnabled = true
                button3.isEnabled = true
                button4.isEnabled = true
            }
        }
        page = 1
        fetchData(page: page)
        refreshControl.endRefreshing()
    }
    
    @objc func button1Pressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            sender.setTitleColor(.black, for: .normal)
            age = 0
            refreshPostsData(self)
        } else {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            button2.isSelected = false
            button2.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button2.setTitleColor(.black, for: .normal)
            button3.isSelected = false
            button3.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button3.setTitleColor(.black, for: .normal)
            button4.isSelected = false
            button4.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button4.setTitleColor(.black, for: .normal)
            age = 10
            refreshPostsData(self)
        }
    }
    
    @objc func button2Pressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            sender.setTitleColor(.black, for: .normal)
            age = 0
            refreshPostsData(self)
        } else {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            button1.isSelected = false
            button1.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button1.setTitleColor(.black, for: .normal)
            button3.isSelected = false
            button3.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button3.setTitleColor(.black, for: .normal)
            button4.isSelected = false
            button4.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button4.setTitleColor(.black, for: .normal)
            age = 20
            refreshPostsData(self)
        }
    }
    
    @objc func button3Pressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            sender.setTitleColor(.black, for: .normal)
            age = 0
            refreshPostsData(self)
        } else {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            button1.isSelected = false
            button1.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button1.setTitleColor(.black, for: .normal)
            button2.isSelected = false
            button2.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button2.setTitleColor(.black, for: .normal)
            button4.isSelected = false
            button4.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button4.setTitleColor(.black, for: .normal)
            age = 30
            refreshPostsData(self)
        }
    }
    
    @objc func button4Pressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            sender.setTitleColor(.black, for: .normal)
            age = 0
            refreshPostsData(self)
        } else {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            button1.isSelected = false
            button1.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button1.setTitleColor(.black, for: .normal)
            button2.isSelected = false
            button2.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button2.setTitleColor(.black, for: .normal)
            button3.isSelected = false
            button3.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button3.setTitleColor(.black, for: .normal)
            age = 40
            refreshPostsData(self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshPostsData(self)
    }

    
}

extension BadVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        age = 1
        count = 0
        keyword = searchBar.text!
        button1.isSelected = false
        button1.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button1.setTitleColor(.black, for: .normal)
        button2.isSelected = false
        button2.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button2.setTitleColor(.black, for: .normal)
        button3.isSelected = false
        button3.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button3.setTitleColor(.black, for: .normal)
        button4.isSelected = false
        button4.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        button4.setTitleColor(.black, for: .normal)
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        refreshPostsData(self)
    }
}
