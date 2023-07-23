//
//  CustomCommentCell.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/22.
//

import UIKit

class CustomCommentCell: UITableViewCell { // 댓글 커스텀
    
    let profileImageView: UIImageView = { // 프로필 사진
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = { // 이름
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentLabel: UILabel = { // 댓글 내용
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = { // 시간
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func makeSubView() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(commentLabel)
        addSubview(timeLabel)
    }
    
    func makeConstraint() {
        
        let horizontalMargin: CGFloat = 30
        let verticalMargin: CGFloat = 8
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: verticalMargin),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            profileImageView.widthAnchor.constraint(equalToConstant: 35),
            profileImageView.heightAnchor.constraint(equalToConstant: 35),
            
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            commentLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: verticalMargin),
            commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            commentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            
            timeLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalMargin)
        ])
        
    }
    
    func configureCell(with comment: Comment) {
        profileImageView.image = comment.profile
        nameLabel.text = comment.name
        commentLabel.text = comment.text
        timeLabel.text = comment.time
    }
    
}
