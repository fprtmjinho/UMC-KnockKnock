//
//  CustomCommentCell.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/22.
//

import UIKit

class CustomCommentCell: UITableViewCell { // 댓글 커스텀
    
    weak var delegate: CustomCommentCellDelegate?
    
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
    
    let moreButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "more_vert"), for: .normal)
        button.addTarget(self, action: #selector(commentShowActionSheet(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func makeSubView() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(commentLabel)
        addSubview(timeLabel)
        addSubview(moreButton)
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
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalMargin),
            
            moreButton.topAnchor.constraint(equalTo: topAnchor, constant: verticalMargin),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            moreButton.widthAnchor.constraint(equalToConstant: 17),
            moreButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        
    }
    
    @objc func commentShowActionSheet(_ sender: UIButton) {
        delegate?.commentShowActionSheet(cell: self)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = moreButton.hitTest(convert(point, to: moreButton), with: event) {
            return view
        }
        
        return super.hitTest(point, with: event)
    }
    
    func configureCell(with comment: Comment) {
        profileImageView.image = UIImage(named: "sergio")
        nameLabel.text = comment.nickName
        commentLabel.text = comment.content
        timeLabel.text = comment.createdAt
    }
    
}

protocol CustomCommentCellDelegate: AnyObject {
    func commentShowActionSheet(cell: CustomCommentCell)
}
