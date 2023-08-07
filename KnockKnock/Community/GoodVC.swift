//
//  GoodVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit
import SDWebImage

class GoodVC: UIViewController {
    
    let refreshControl = UIRefreshControl()
    
    var page: Int = 1 // 페이지 번호
    
    var hasNext: Bool? // 다음 페이지가 있는지 여부
    
    // 버튼 탭 여부를 저장하는 배열
    var buttonPressedStates: [String:Bool] = ["10대": false, "20대": false, "30대": false, "40대~": false]
    
    var posts: [PostParsing] = []
    
    func fetchData(page: Int) {
        let urlString = "http://54.180.168.54/board/allPosts?boardType=GOOD&page=\(page)&size=5"
        
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

extension GoodVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomCell
        let post = posts[indexPath.row]
        
        cell.resetCell()
        
        cell.profileImageView.sd_setImage(with: URL(string: post.profileImageUrl), placeholderImage: UIImage(named: "karim"))
        cell.imagesView.image = nil
        
        if post.imageUrl.count != 0 {
            cell.imagesView.sd_setImage(with: URL(string: post.imageUrl[0]), placeholderImage: UIImage(named: "beach"))
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - tableView.bounds.size.height - 100) {
            if hasNext == true {
                page += 1
                fetchData(page: page)
            }
        }
    }
    
}

extension GoodVC {
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
        setupRefreshControl() // 새로고침
        fetchData(page: page) // 첫 화면: page = 1
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshPostsData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshPostsData(_ sender: Any) {
        page = 1
        fetchData(page: page)
        refreshControl.endRefreshing()
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
    
}
