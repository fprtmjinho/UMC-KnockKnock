//
//  GoodVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GoodVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var row: [(profile: UIImage?, title: String, text: String, image: UIImage?, like: Int, chat: Int)] = [(#imageLiteral(resourceName: "kb9"), "혼자 방콕여행 어떻게 생각해?", "긴 문장 테스트: 성수는 기독교에서 중요한 예식인 세례를 위해 성별되도록 성직자가 축복한 물이다. 원래 초기 보편교회 시절에는 세례수만을 의미했지만 현재는 동방교회와 서방교회에서", #imageLiteral(resourceName: "beach"), 17, 7), (#imageLiteral(resourceName: "kb9"), "혼자 미국여행 어떻게 생각해?", "짧은 문장 테스트", #imageLiteral(resourceName: "beach"), 10, 5), (#imageLiteral(resourceName: "kb9"), "긴 제목 테스트: 혼자 일본여행 어떻게 생각해?", "성수는 기독교에서 중요한 예식인 세례를 위해 성별되도록 성직자가 축복한 물이다. 원래 초기 보편교회 시절에는 세례수만을 의미했지만 현재는 동방교회와 서방교회에서", #imageLiteral(resourceName: "beach"), 13, 2)] // Updated row data
    
    
    func makeSubView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func makeConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSubView()
        makeConstraint()
        
        // Scroll dynamically to add new rows when scrolling down
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0) // Content inset to allow scrolling down by 100pt
        tableView.contentInset = contentInset
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let indexPath = tableView.indexPathsForVisibleRows?.last else {
            return
        }
        
        let lastVisibleRow = indexPath.row
        let lastRow = row.count - 1
        
        if lastVisibleRow == lastRow {
//            마지막 행에 도달했을 때 하는 동작
//            아래는 예시
//            let newRowText = "Row \(lastRow + 2)"
//            let newRowImage = UIImage(named: "placeholder")
//            row.append((text: newRowText, image: newRowImage))
//            tableView.insertRows(at: [IndexPath(row: lastRow + 1, section: 0)], with: .automatic)
        }
    }
    
}

extension GoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        let rowData = row[indexPath.row]
        
        cell.configureCell(profile: rowData.profile, title: rowData.title, text: rowData.text, image: rowData.image, likeNum: rowData.like, chatNum: rowData.chat)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300 // Set the height of each row, can be modified as needed
    }
    
}

class CustomCell: UITableViewCell {
    
    let customProfileView: UIImageView = { // 프로필 사진
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let customTitleLabel: UILabel = { // 글 제목
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let customTextContainerView: UIView = { // 글 내용을 담는 컨테이너
        let view = UIView()
        return view
    }()
    
    let customTextLabel: UILabel = { // 글 내용
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 4
        return label
    }()
    
    let customImageView: UIImageView = { // 글 이미지
        let imageView = UIImageView()
        return imageView
    }()
    
    let customLikeView: UIImageView = { // 좋아요 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "like_ff0060")
        return imageView
    }()
    
    let customLikeNumLabel: UILabel = { // 좋아요 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let customChatView: UIImageView = { // 댓글 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chat_bubble_c2c2c2")
        return imageView
    }()
    
    let customChatNumLabel: UILabel = { // 댓글 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let shareButton: UIButton = { // 공유 버튼
        let button = UIButton()
        button.setImage(UIImage(named: "share_333333"), for: .normal)
        return button
    }()
    
    func makeSubView() {
        contentView.addSubview(customProfileView)
        contentView.addSubview(customTitleLabel)
        contentView.addSubview(customTextContainerView)
        customTextContainerView.addSubview(customTextLabel)
        contentView.addSubview(customImageView)
        contentView.addSubview(customLikeView)
        contentView.addSubview(customLikeNumLabel)
        contentView.addSubview(customChatView)
        contentView.addSubview(customChatNumLabel)
        contentView.addSubview(shareButton)
        
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    func makeConstraint() {
        customProfileView.translatesAutoresizingMaskIntoConstraints = false
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        customTextLabel.translatesAutoresizingMaskIntoConstraints = false
        customTextContainerView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customLikeView.translatesAutoresizingMaskIntoConstraints = false
        customLikeNumLabel.translatesAutoresizingMaskIntoConstraints = false
        customChatView.translatesAutoresizingMaskIntoConstraints = false
        customChatNumLabel.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            customProfileView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customProfileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            customProfileView.widthAnchor.constraint(equalToConstant: 45),
            customProfileView.heightAnchor.constraint(equalToConstant: 45),
            
            customTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            customTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            customTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            customTextContainerView.topAnchor.constraint(equalTo: customTitleLabel.bottomAnchor, constant: 4),
            customTextContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            customTextContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            customTextContainerView.bottomAnchor.constraint(equalTo: customImageView.topAnchor, constant: 4),
            customTextContainerView.heightAnchor.constraint(equalToConstant: 90),
            
            customTextLabel.topAnchor.constraint(equalTo: customTextContainerView.topAnchor),
            customTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            customTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            customImageView.heightAnchor.constraint(equalToConstant: 90),
            
            customLikeView.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 4),
            customLikeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            customLikeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            customLikeView.widthAnchor.constraint(equalToConstant: 20),
            customLikeView.heightAnchor.constraint(equalToConstant: 20),
            
            customLikeNumLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 4),
            customLikeNumLabel.leadingAnchor.constraint(equalTo: customLikeView.trailingAnchor, constant: 10),
            customLikeNumLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            customChatView.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 4),
            customChatView.leadingAnchor.constraint(equalTo: customLikeNumLabel.trailingAnchor, constant: 20),
            customChatView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            customChatView.widthAnchor.constraint(equalToConstant: 20),
            customChatView.heightAnchor.constraint(equalToConstant: 20),
            
            customChatNumLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 4),
            customChatNumLabel.leadingAnchor.constraint(equalTo: customChatView.trailingAnchor, constant: 10),
            customChatNumLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            shareButton.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 4),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureCell(profile: UIImage?, title: String, text: String, image: UIImage?, likeNum: Int, chatNum: Int) {
        customProfileView.image = profile
        customTitleLabel.text = title
        customTextLabel.text = text
        customImageView.image = image
        customLikeNumLabel.text = "\(likeNum)"
        customChatNumLabel.text = "\(chatNum)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeSubView()
        makeConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func shareButtonTapped() { // 공유 버튼 눌렀을 때 하는 동작
        print("버튼 눌렀음")
    }
    
}
