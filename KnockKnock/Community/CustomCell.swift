//
//  CustomCell.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/21.
//

import UIKit
import SDWebImage

class CustomCell: UITableViewCell { // 게시글 커스텀
    
    var postId: Int!
    
    let profileImageView: UIImageView = { // 프로필 사진
        let imageView = UIImageView()
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
    
    let imagesView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let likesView: UIImageView = { // 좋아요 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "like_ff0060")
        return imageView
    }()
    
    let likesLabel: UILabel = { // 좋아요 개수
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let commentsView: UIImageView = { // 댓글 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "chat_bubble_c2c2c2")
        return imageView
    }()
    
    let commentsLabel: UILabel = { // 댓글 개수
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let shareButton: UIButton = { // 공유 버튼
        let button = UIButton()
        button.setImage(UIImage(named: "share_333333"), for: .normal)
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func shareButtonTapped() { // 공유 버튼 눌렀을 때 하는 동작
        let URLString = "http://\(Server.url)/post/\(postId!)/share"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            guard let data = data else {
                return
            }
            
            if let stringData = String(data: data, encoding: .utf8) {
                print(stringData)
            } else {
                print("데이터를 문자열로 변환할 수 없습니다.")
            }
            
        }.resume()
    }

    
    
}

extension CustomCell {
    func makeSubView1() { // 이미지 있는 경우
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
    
    func makeSubView2() { // 이미지 없는 경우
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentContainerView)
        contentContainerView.addSubview(contentLabel)
        contentView.addSubview(likesView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(commentsView)
        contentView.addSubview(commentsLabel)
        contentView.addSubview(shareButton)
    }
    
    func makeConstraint1() {
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
        
        var constraints = [
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
            contentContainerView.heightAnchor.constraint(equalToConstant: 90),
            
            contentLabel.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            imagesView.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            imagesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            imagesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            imagesView.heightAnchor.constraint(equalToConstant: 120),
            
            likesView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            likesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            likesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            likesView.widthAnchor.constraint(equalToConstant: 20),
            likesView.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            likesLabel.leadingAnchor.constraint(equalTo: likesView.trailingAnchor, constant: 5),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            commentsView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 5),
            commentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            shareButton.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 4),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func makeConstraint2() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        likesView.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        commentsView.translatesAutoresizingMaskIntoConstraints = false
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [
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
            contentContainerView.heightAnchor.constraint(equalToConstant: 90),
            
            contentLabel.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            likesView.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            likesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            likesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            likesView.widthAnchor.constraint(equalToConstant: 20),
            likesView.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            likesLabel.leadingAnchor.constraint(equalTo: likesView.trailingAnchor, constant: 10),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            commentsView.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 10),
            commentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            shareButton.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: 4),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = shareButton.hitTest(convert(point, to: shareButton), with: event) {
            return view
        }
        
        return super.hitTest(point, with: event)
    }
    
    func resetCell() {
        self.contentView.subviews.forEach({ $0.removeFromSuperview() })
    }
     
    func configureCell(with post: PostParsing) {
        postId = post.postID
        titleLabel.text = post.title
        contentLabel.text = post.content
        likesLabel.text = "\(post.likes)"
        commentsLabel.text = "\(post.comments)"
    }
    
}
