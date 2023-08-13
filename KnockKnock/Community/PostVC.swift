//
//  PostVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/16.
//

import UIKit
import SDWebImage

class PostVC: UIViewController, CustomCommentCellDelegate {
    
    var myPost: Bool = true // 자신 글 여부
    var myComment: Bool = true // 자신 댓글 여부
    
    var categoryValue: Int! // 게시판 종류
    
    // 테이블 뷰 관련: post, comment, tableView
    // post(스트럭트 맨아래 있음)
    var post: Post!
    
    // comment(스트럭트 맨아래 있음)
    var comments: [Comment] = []
    
    
    func fetchComment(postID: Int) {
        
        let urlString = "http://54.180.168.54/post/comment/\(postID)/all"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fetchComments = try decoder.decode([Comment].self, from: data)
                comments = fetchComments
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
            
        }
        
        task.resume()
    }
    
    
    
    
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 댓글 관련: commentContainerView1, commentContainerView2, commentTextField, anonymousImageButton, makeCommentImageButton
    let commentContainerView1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentContainerView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 17
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "댓글을 입력하세요.")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var isAnonymousSelected = false // 댓글 익명 여부
    
    let anonymousImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "check_anony_no"), for: .normal)
        button.addTarget(self, action: #selector(anonymousImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let makeCommentImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "send"), for: .normal)
        button.addTarget(self, action: #selector(makeCommentImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func makeSubView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomPostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(CustomCommentCell.self, forCellReuseIdentifier: "CommentCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        view.addSubview(commentContainerView1)
        commentContainerView1.addSubview(commentContainerView2)
        commentContainerView1.addSubview(makeCommentImageButton)
        commentContainerView2.addSubview(commentTextField)
        commentContainerView2.addSubview(anonymousImageButton)
    }
    
    func makeConstraint() {
        let horizontalMargin: CGFloat = 30
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: commentContainerView1.topAnchor),
            
            commentContainerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentContainerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentContainerView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            commentContainerView1.heightAnchor.constraint(equalToConstant: 65),
            
            commentContainerView2.leadingAnchor.constraint(equalTo: commentContainerView1.leadingAnchor, constant: horizontalMargin),
            commentContainerView2.trailingAnchor.constraint(equalTo: makeCommentImageButton.leadingAnchor, constant: -5),
            commentContainerView2.topAnchor.constraint(equalTo: commentContainerView1.topAnchor, constant: 15),
            commentContainerView2.bottomAnchor.constraint(equalTo: commentContainerView1.bottomAnchor, constant: -15),
            
            commentTextField.leadingAnchor.constraint(equalTo: commentContainerView2.leadingAnchor, constant: 10),
            commentTextField.trailingAnchor.constraint(equalTo: anonymousImageButton.leadingAnchor, constant: -10),
            commentTextField.topAnchor.constraint(equalTo: commentContainerView2.topAnchor, constant: 10),
            commentTextField.bottomAnchor.constraint(equalTo: commentContainerView2.bottomAnchor, constant: -10),
            
            anonymousImageButton.trailingAnchor.constraint(equalTo: commentContainerView2.trailingAnchor, constant: -10),
            anonymousImageButton.centerYAnchor.constraint(equalTo: commentContainerView2.centerYAnchor),
            anonymousImageButton.widthAnchor.constraint(equalToConstant: 45),
            anonymousImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            makeCommentImageButton.trailingAnchor.constraint(equalTo: commentContainerView1.trailingAnchor, constant: -horizontalMargin),
            makeCommentImageButton.centerYAnchor.constraint(equalTo: commentContainerView1.centerYAnchor),
            makeCommentImageButton.widthAnchor.constraint(equalToConstant: 25),
            makeCommentImageButton.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categoryValue == 0 ? "선 게시판" : "악 게시판"
        view.backgroundColor = .white
        var image = UIImage(named: "more_vert")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let rightBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(postShowActionSheet))
        navigationItem.rightBarButtonItem = rightBarButton
        fetchComment(postID: post.postID)
        downloadAndSetImages(for: post.imageURL)
        
        makeSubView()
        makeConstraint()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    func downloadAndSetImages(for imageURLs: [String]) {
        downloadImageSequentially(from: imageURLs, index: 0)
    }
    
    func downloadImageSequentially(from urls: [String], index: Int) {
        guard index < urls.count else {
            return
        }
        
        if let imageURL = URL(string: urls[index]) {
            SDWebImageDownloader.shared.downloadImage(with: imageURL) { (image, _, _, _) in
                if let image = image {
                    self.post.images.append(image)
                    
                    DispatchQueue.main.async {
                        let indexPath = IndexPath(row: 0, section: 0)
                        self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                    
                    // 다음 이미지 다운로드
                    self.downloadImageSequentially(from: urls, index: index + 1)
                }
            }
        }
    }
    
    
    @objc func postShowActionSheet() {
        let actionSheet = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)
        
        if myPost {
            // 자신의 글일 때
            let modifyPost = UIAlertAction(title: "수정", style: .default) { _ in
                // 글 수정 탭시 수행할 동작
                let writeVC = WriteVC()
                writeVC.index = self.categoryValue
                writeVC.modify = true
                writeVC.titleTextField.text = self.post.title
                writeVC.contentTextView.text = self.post.content
                writeVC.contentTextView.textColor = .label
                writeVC.originalImages = self.post.images
                writeVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(writeVC, animated: true)
            }
            let deletePost = UIAlertAction(title: "삭제", style: .default) { _ in
                // 글 삭제 탭시 수행할 동작
                self.navigationController?.popViewController(animated: true)
                
            }
            actionSheet.addAction(modifyPost)
            actionSheet.addAction(deletePost)
        } else {
            // 자신의 글이 아닐 때
            let reportPost = UIAlertAction(title: "신고", style: .default) { _ in
                let reportActionSheet = UIAlertController(title: "신고 사유 선택", message: nil, preferredStyle: .actionSheet)
                
                let report1 = UIAlertAction(title: "게시판 성격에 부적절함", style: .default) { _ in
                    
                }
                
                let report2 = UIAlertAction(title: "음란물/불건전한 만남 및 대화", style: .default) { _ in
                    
                }
                
                let report3 = UIAlertAction(title: "낚시/놀람/도배", style: .default) { _ in
                    
                }
                
                let report4 = UIAlertAction(title: "욕설/비하", style: .default) { _ in
                    
                }
                
                let report5 = UIAlertAction(title: "정당/정치인 비하 및 선거운동", style: .default) { _ in
                    
                }
                
                let report6 = UIAlertAction(title: "상업적 광고 및 판매", style: .default) { _ in
                    
                }
                
                let report7 = UIAlertAction(title: "유출/사칭/사기", style: .default) { _ in
                    
                }
                
                reportActionSheet.addAction(report1)
                reportActionSheet.addAction(report2)
                reportActionSheet.addAction(report3)
                reportActionSheet.addAction(report4)
                reportActionSheet.addAction(report5)
                reportActionSheet.addAction(report6)
                reportActionSheet.addAction(report7)
                
                let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                reportActionSheet.addAction(cancelAction)
                
                self.present(reportActionSheet, animated: true)
            }
            actionSheet.addAction(reportPost)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        actionSheet.addAction(cancelAction)
        
        // On iPad, the action sheet should be presented as a popover.
        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
        }
        
        present(actionSheet, animated: true)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
    @objc func anonymousImageButtonTapped(_ sender: UIButton) {
        isAnonymousSelected.toggle()
        let imageName = isAnonymousSelected ? "check_anony_yes" : "check_anony_no"
        anonymousImageButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func makeCommentImageButtonTapped(_ sender: UIButton) {
        print("댓글 작성 버튼 탭함.")
    }
}

extension PostVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 섹션은 하나 (게시글 + 댓글)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 행 개수 리턴 (댓글 수 + 1(게시글))
        return comments.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // 행의 index가 0일 때는 게시글
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! CustomPostCell
            cell.profileImageView.sd_setImage(with: URL(string: post.profile), placeholderImage: UIImage(named: "anonymous"))
            cell.configureCell(with: post)
            print(post.imageURL)
            if post.images.count != 0 {
                cell.makeSubView1()
                cell.makeConstraint1()
            } else {
                cell.makeSubView2()
                cell.makeConstraint2()
            }
            cell.selectionStyle = .none
            return cell
        } else {
            // 나머지 index일 때는 댓글
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CustomCommentCell
            let comment = comments[indexPath.row - 1] // 댓글[행 인덱스 - 1] -> 해당 댓글
            cell.delegate = self
            cell.profileImageView.sd_setImage(with: URL(string: comment.profileImageUrl), placeholderImage: UIImage(named: "anonymous"))
            cell.configureCell(with: comment)
            cell.makeSubView()
            cell.makeConstraint()
            cell.selectionStyle = .none
            return cell
        }
    }
    
    @objc func commentShowActionSheet(cell: CustomCommentCell) {
        let actionSheet = UIAlertController(title: "댓글 메뉴", message: nil, preferredStyle: .actionSheet)
        
        if myComment {
            // 자신의 댓글일 때
            let modifyPost = UIAlertAction(title: "수정", style: .default) { _ in
                // 댓글 수정 탭시 수행할 동작
                self.commentTextField.text = cell.commentLabel.text
            }
            let deletePost = UIAlertAction(title: "삭제", style: .default) { _ in
                // 댓글 삭제 탭시 수행할 동작
            }
            actionSheet.addAction(modifyPost)
            actionSheet.addAction(deletePost)
        } else {
            // 자신의 댓글이 아닐 때
            let reportPost = UIAlertAction(title: "신고", style: .default) { _ in
                let reportActionSheet = UIAlertController(title: "신고 사유 선택", message: nil, preferredStyle: .actionSheet)
                
                let report1 = UIAlertAction(title: "게시판 성격에 부적절함", style: .default) { _ in
                    
                }
                
                let report2 = UIAlertAction(title: "음란물/불건전한 만남 및 대화", style: .default) { _ in
                    
                }
                
                let report3 = UIAlertAction(title: "낚시/놀람/도배", style: .default) { _ in
                    
                }
                
                let report4 = UIAlertAction(title: "욕설/비하", style: .default) { _ in
                    
                }
                
                let report5 = UIAlertAction(title: "정당/정치인 비하 및 선거운동", style: .default) { _ in
                    
                }
                
                let report6 = UIAlertAction(title: "상업적 광고 및 판매", style: .default) { _ in
                    
                }
                
                let report7 = UIAlertAction(title: "유출/사칭/사기", style: .default) { _ in
                    
                }
                
                reportActionSheet.addAction(report1)
                reportActionSheet.addAction(report2)
                reportActionSheet.addAction(report3)
                reportActionSheet.addAction(report4)
                reportActionSheet.addAction(report5)
                reportActionSheet.addAction(report6)
                reportActionSheet.addAction(report7)
                
                let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                reportActionSheet.addAction(cancelAction)
                
                self.present(reportActionSheet, animated: true)
            }
            actionSheet.addAction(reportPost)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        actionSheet.addAction(cancelAction)
        
        // On iPad, the action sheet should be presented as a popover.
        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
        }
        
        present(actionSheet, animated: true)
    }
}

