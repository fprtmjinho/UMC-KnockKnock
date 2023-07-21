//
//  GoodVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GoodVC: UIViewController {
    
    // 게시글 모음
    var post: [PostCategory] = [
        PostCategory(profile: UIImage(named: "karim")!, title: "샌프란시스코에 휴가 왔어요!", content: "여기 날도 정말 맑고 덥지도 않네요. 여행 오시는거 꼭 추천합니다~~", image: UIImage(named: "sanfrancisco"),likes: 15, comments: 3),
        PostCategory(profile: UIImage(named: "karim")!, title: "휴가 시작!", content: "휴가 시작 와#@!#@!$!@#$#!@#!@#!@#!@#!@#!#!@#!@#!@#!@#!@#!#!@#!#@!#!@#!#@!#!#@!#!@#!#!@#!@#!#!@#!#@!#!@#!@#!@#@!#!@#!@#!#@!#@#!@#!@#!@#@!#@!#!", image: nil, likes: 7, comments: 3),
        PostCategory(profile: UIImage(named: "mesut")!, title: "성수동 카페 추천", content: "@#@!#!@#!#@!#!@#@!#!@#!#!#@#!@#!@#!#!@#!#!@#!@#!@#!#!#@!#!#!@#!@#!@#!#!#!@#!#", image: UIImage(named: "seongsu"),likes: 10, comments: 3),
        PostCategory(profile: UIImage(named: "toni")!, title: "강남역 놀거리 추천합니다", content: "@#@!#!@#!#@!#!@#@!#!@#!#!#@#!@#!@#!#!@#!#!@#!@#!@#!#!#@!#!#!@#!@#!@#!#!#!@#!#", image: UIImage(named: "gangnam"),likes: 8, comments: 3),
        PostCategory(profile: UIImage(named: "sergio")!, title: "파리에 왔어요", content: "파리에 여행왔어요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@#@!#!@#!#@!#!@#@!#!@#!#!#@#!@#!@#!#!@#!#!@#!@#!@#!#!#@!#!#!@#!@#!@#!#!#!@#!#", image: UIImage(named: "paris"),likes: 4, comments: 3),
    ]
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
}

extension GoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomCell
        let post = post[indexPath.row]
        cell.configureCell(with: post)
        cell.makeSubView()
        cell.makeConstraint()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if post[indexPath.row].image == nil { // 게시글에 사진이 없을 때
            return 135
        } else { // 게시글에 사진이 있을 때
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.categoryValue = 0 // 선 게시판
        postVC.post.profile = post[indexPath.row].profile
        postVC.post.title = post[indexPath.row].title
        postVC.post.content = post[indexPath.row].content
        postVC.post.likes = post[indexPath.row].likes
        postVC.post.likes = post[indexPath.row].likes
        postVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(postVC, animated: true)
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
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            return
        }
        
        if sender.isSelected {
            sender.isSelected = false
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        } else {
            sender.isSelected = true
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        }
        
        print("Button tapped: \(title)")
        
    }
    
}

<<<<<<< HEAD
=======
extension GoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomCell
        let post = post[indexPath.row]
        cell.configureCell(with: post)
        cell.makeSubView()
        cell.makeConstraint()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if post[indexPath.row].image == nil { // 게시글에 사진이 없을 때
            return 135
        } else { // 게시글에 사진이 있을 때
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        postVC.categoryValue = 0 // 선 게시판
        postVC.post.profile = post[indexPath.row].profile
        postVC.post.title = post[indexPath.row].title
        postVC.post.content = post[indexPath.row].content
        postVC.post.likes = post[indexPath.row].likes
        postVC.post.likes = post[indexPath.row].likes
        postVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(postVC, animated: true)
    }
}

class CustomCell: UITableViewCell { // 게시글 커스텀
    
    let profileImageView: UIImageView = { // 프로필 사진
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = { // 글 제목
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let contentContainerView: UIView = { // 글 내용을 담는 컨테이너
        let view = UIView()
        return view
    }()
    
    let contentLabel: UILabel = { // 글 내용
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 4
        return label
    }()
    
    let imagesView: UIImageView = { // 글 이미지
        let imageView = UIImageView()
        return imageView
    }()
    
    let likesView: UIImageView = { // 좋아요 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "like_ff0060")
        return imageView
    }()
    
    let likesLabel: UILabel = { // 좋아요 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let commentsView: UIImageView = { // 댓글 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chat_bubble_c2c2c2")
        return imageView
    }()
    
    let commentsLabel: UILabel = { // 댓글 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let shareButton: UIButton = { // 공유 버튼
        let button = UIButton()
        button.setImage(UIImage(named: "share_333333"), for: .normal)
        button.addTarget(CustomCell.self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func shareButtonTapped() { // 공유 버튼 눌렀을 때 하는 동작
        print("공유 버튼 탭하였음")
    }
    
    func makeSubView() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentContainerView)
        contentContainerView.addSubview(contentLabel)
        contentView.addSubview(imagesView)
        contentView.addSubview(likesView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(commentsView)
        contentView.addSubview(commentsLabel)
        contentView.addSubview(shareButton)
    }
    
    func makeConstraint() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        likesView.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        commentsView.translatesAutoresizingMaskIntoConstraints = false
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            contentContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            contentContainerView.bottomAnchor.constraint(equalTo: imagesView.topAnchor, constant: 4),
            contentContainerView.heightAnchor.constraint(equalToConstant: 90),
            
            contentLabel.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            
            imagesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            imagesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            imagesView.heightAnchor.constraint(equalToConstant: 90),
            
            likesView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            likesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            likesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            likesView.widthAnchor.constraint(equalToConstant: 20),
            likesView.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            likesLabel.leadingAnchor.constraint(equalTo: likesView.trailingAnchor, constant: 10),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            commentsView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 10),
            commentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            shareButton.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureCell(with post: PostCategory) {
        profileImageView.image = post.profile
        titleLabel.text = post.title
        contentLabel.text = post.content
        imagesView.image = post.image
        likesLabel.text = "\(post.likes)"
        commentsLabel.text = "\(post.comments)"
    }
    
}
>>>>>>> CommunityUICustom4
