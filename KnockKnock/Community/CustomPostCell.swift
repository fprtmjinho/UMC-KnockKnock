//
//  CustomPostCell.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/22.
//

import UIKit

class CustomPostCell: UITableViewCell { // 게시글 커스텀
    
    weak var delegate: CustomPostCellDelegate?
    
    var post: Post?
    var postId: Int!
    
    let prevImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "prev"), for: .normal)
        button.addTarget(self, action: #selector(prevImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "next"), for: .normal)
        button.addTarget(self, action: #selector(nextImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let profileImageView: UIImageView = { // 프로필 사진
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = { // 이름
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = { // 제목
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel: UILabel = { // 내용
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imagesView: UIImageView = { // 이미지
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timeLabel: UILabel = { // 시간
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likesButton: UIButton = { // 좋아요 버튼
        let button = UIButton()
        button.setImage(UIImage(named: "like_fill_ff0060"), for: .normal)
        button.addTarget(self, action: #selector(likesButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likesLabel: UILabel = { // 좋아요 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentsView: UIImageView = { // 댓글 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chat_bubble_c2c2c2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let commentsLabel: UILabel = { // 댓글 개수
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shareButton: UIButton = { // 공유 버튼
        let button = UIButton()
        button.setImage(UIImage(named: "share_333333"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func makeSubView1() { // 사진이 있는 경우
        imagesView.addSubview(prevImageButton)
        imagesView.addSubview(nextImageButton)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(imagesView)
        addSubview(timeLabel)
        addSubview(likesButton)
        addSubview(likesLabel)
        addSubview(commentsView)
        addSubview(commentsLabel)
        addSubview(shareButton)
    }
    func makeSubView2() { // 사진이 없는 경우
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(timeLabel)
        addSubview(likesButton)
        addSubview(likesLabel)
        addSubview(commentsView)
        addSubview(commentsLabel)
        addSubview(shareButton)
    }
    
    func makeConstraint1() { // 사진이 있는 경우
        
        let horizontalMargin: CGFloat = 30
        let verticalMargin: CGFloat = 10
        
        NSLayoutConstraint.activate([
            prevImageButton.leadingAnchor.constraint(equalTo: imagesView.leadingAnchor, constant: 8),
            prevImageButton.centerYAnchor.constraint(equalTo: imagesView.centerYAnchor),
            prevImageButton.widthAnchor.constraint(equalToConstant: 30),
            prevImageButton.heightAnchor.constraint(equalToConstant: 30),
            
            nextImageButton.trailingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: -8),
            nextImageButton.centerYAnchor.constraint(equalTo: imagesView.centerYAnchor),
            nextImageButton.widthAnchor.constraint(equalToConstant: 30),
            nextImageButton.heightAnchor.constraint(equalToConstant: 30),
            
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            timeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: verticalMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalMargin),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            imagesView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            imagesView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagesView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagesView.heightAnchor.constraint(equalToConstant: 200),
            
            likesButton.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: verticalMargin),
            likesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            likesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            likesButton.widthAnchor.constraint(equalToConstant: 20),
            likesButton.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: verticalMargin),
            likesLabel.leadingAnchor.constraint(equalTo: likesButton.trailingAnchor, constant: 10),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            commentsView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: verticalMargin),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: verticalMargin),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 10),
            commentsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            shareButton.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: verticalMargin),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    func makeConstraint2() { // 사진이 없는 경우
        
        let horizontalMargin: CGFloat = 30
        let verticalMargin: CGFloat = 10
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            timeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: verticalMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalMargin),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            likesButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            likesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            likesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            likesButton.widthAnchor.constraint(equalToConstant: 20),
            likesButton.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            likesLabel.leadingAnchor.constraint(equalTo: likesButton.trailingAnchor, constant: 10),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            commentsView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 10),
            commentsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            shareButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    @objc func prevImageButtonTapped(_ sender: UIButton) {
        guard let images = post?.images, !images.isEmpty else { return }
        if let currentImageIndex = images.firstIndex(of: imagesView.image!) {
            let prevIndex = (currentImageIndex - 1 + images.count) % images.count
            imagesView.image = images[prevIndex]
        }
    }
    
    @objc func nextImageButtonTapped(_ sender: UIButton) {
        guard let images = post?.images, !images.isEmpty else { return }
        if let currentImageIndex = images.firstIndex(of: imagesView.image!) {
            let nextIndex = (currentImageIndex + 1) % images.count
            imagesView.image = images[nextIndex]
        }
    }
    
    @objc func likesButtonTapped(_ sender: UIButton) {
        let URLString = "http://\(Server.url)/post/\(postId!)/like"
        print(URLString)
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        request.addValue(UserDefaults.standard.string(forKey: "Authorization")!, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Verification.self, from: data)
                print(decodedData)
                if decodedData.message == "좋아요를 눌렀습니다." {
                    print("좋아요를 눌렀습니다.")
                }
                else {
                    print("좋아요를 취소했습니다.")
                }
                DispatchQueue.main.async {
                    self.delegate?.reload()
                }
            }
            catch {
                print("디코딩 실패")
            }
            
        }.resume()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
    
    // (매우 중요)테이블뷰 셀의 터치 이벤트를 해당 버튼으로 전달
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = prevImageButton.hitTest(convert(point, to: prevImageButton), with: event) {
            return view
        }
        
        if let view = nextImageButton.hitTest(convert(point, to: nextImageButton), with: event) {
            return view
        }
        
        if let view = likesButton.hitTest(convert(point, to: likesButton), with: event) {
            return view
        }
        
        return super.hitTest(point, with: event)
    }
    
    func configureCell(with post: Post) {
        self.post = post
        
        postId = post.postID
        nameLabel.text = post.name
        titleLabel.text = post.title
        contentLabel.text = post.content
        timeLabel.text = post.time
    }
    
}

protocol CustomPostCellDelegate: AnyObject {
    func reload()
}
