//
//  CustomPostCell.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/21.
//

import UIKit

class CustomPostCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { // 게시글 커스텀
    
    var postImages: [UIImage?] = []
    
    let imagesPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
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
    
    let timeLabel: UILabel = { // 시간
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likesView: UIImageView = { // 좋아요 이미지
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "like_ff0060")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    
    func makeSubView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        imagesCollectionView.collectionViewLayout = layout
        
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        imagesCollectionView.isUserInteractionEnabled = true
        imagesCollectionView.isScrollEnabled = true

        
        addSubview(imagesCollectionView)
        addSubview(imagesPageControl)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(timeLabel)
        addSubview(likesView)
        addSubview(likesLabel)
        addSubview(commentsView)
        addSubview(commentsLabel)
        addSubview(shareButton)
        
    }
    
    func makeConstraint() {
        
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
            
            imagesCollectionView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: verticalMargin),
            imagesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imagesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imagesCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            imagesPageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagesPageControl.bottomAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 5),
            
            
            
            likesView.topAnchor.constraint(equalTo: imagesPageControl.bottomAnchor, constant: verticalMargin),
            likesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalMargin),
            likesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            likesView.widthAnchor.constraint(equalToConstant: 20),
            likesView.heightAnchor.constraint(equalToConstant: 20),
            
            likesLabel.topAnchor.constraint(equalTo: imagesPageControl.bottomAnchor, constant: verticalMargin),
            likesLabel.leadingAnchor.constraint(equalTo: likesView.trailingAnchor, constant: 10),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            commentsView.topAnchor.constraint(equalTo: imagesPageControl.bottomAnchor, constant: verticalMargin),
            commentsView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            commentsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            commentsView.widthAnchor.constraint(equalToConstant: 20),
            commentsView.heightAnchor.constraint(equalToConstant: 20),
            
            commentsLabel.topAnchor.constraint(equalTo: imagesPageControl.bottomAnchor, constant: verticalMargin),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: 10),
            commentsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            shareButton.topAnchor.constraint(equalTo: imagesPageControl.bottomAnchor, constant: verticalMargin),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalMargin),
            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    func configureCell(with post: Post) {
        profileImageView.image = post.profile
        nameLabel.text = post.name
        titleLabel.text = post.title
        contentLabel.text = post.content
        timeLabel.text = post.time
        likesLabel.text = "\(post.likes)"
        commentsLabel.text = "\(post.comments)"
        
        postImages = post.images.compactMap { $0 }
        imagesCollectionView.reloadData()
        
        imagesPageControl.numberOfPages = postImages.count
        imagesCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    
    // 이미지 셀 간의 간격을 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        if indexPath.item < postImages.count {
            cell.imageView.image = postImages[indexPath.item]
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        imagesPageControl.currentPage = currentPage
    }
    
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


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

