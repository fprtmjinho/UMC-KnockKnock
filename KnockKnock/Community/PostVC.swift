//
//  PostVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/16.
//

import UIKit
import SDWebImage

class PostVC: UIViewController, CustomCommentCellDelegate {
    
    var myPost: Bool = false // 자신 글 여부
    var myComment: Bool = false // 자신 댓글 여부(기본값)
    var isAnonymousSelected = false // // 익명 체크표시 상태 (댓글)
    var categoryValue: Int! // 게시판 종류
    var modifyCommentValue: Bool = false
    var modifyCommentId: Int?
    
    
    // 테이블 뷰 관련: post, comment, tableView
    // post(스트럭트 맨아래 있음)
    var post: Post!
    
    // comment(스트럭트 맨아래 있음)
    var comments: [Comment] = []
    
    var commentDetails: CommentDetails = CommentDetails(likeCount: 0, commentCount: 0)
    
    
    func fetchComment(postID: Int) {
        
        let urlString = "http://\(Server.url)/post/\(postID)/comments"
        
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
    
    func fetchDetails(postID: Int) {
        
        let urlString = "http://\(Server.url)/post/\(postID)/details"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let commentDetails = try decoder.decode(CommentDetails.self, from: data)
                self.commentDetails = commentDetails
                print(self.commentDetails)
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
        fetchDetails(postID: post.postID)
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
            // 이미지 다운로드가 모두 완료되었을 때 셀 업데이트를 수행
            DispatchQueue.main.async {
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            return
        }
        
        if let imageURL = URL(string: urls[index]) {
            SDWebImageDownloader.shared.downloadImage(with: imageURL) { (image, _, _, _) in
                if let image = image {
                    self.post.images.append(image)
                    
                    // 다음 이미지 다운로드
                    self.downloadImageSequentially(from: urls, index: index + 1)
                }
            }
        }
    }
    
    
    
    @objc func postShowActionSheet() {
        let actionSheet = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)
        
        let URLString = "http://\(Server.url)/post/\(post.postID)/verification"
        
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
                let postVerification = try JSONDecoder().decode(Verification.self, from: data)
                print("\(postVerification)")
                if postVerification.message == "작성자와 일치합니다." {
                    self.myPost = true
                }
                
                DispatchQueue.main.async {
                            let actionSheet = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)

                            if self.myPost {
                                // 자신의 글일 때
                                let modifyPost = UIAlertAction(title: "수정", style: .default) { _ in
                                    // 글 수정 탭시 수행할 동작
                                    let writeVC = WriteVC()
                                    writeVC.index = self.categoryValue
                                    writeVC.postID = self.post.postID
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
                                    self.deletePost(postId: self.post.postID)
                                }
                                actionSheet.addAction(modifyPost)
                                actionSheet.addAction(deletePost)
                            } else {
                                // 자신의 글이 아닐 때
                                let reportPost = UIAlertAction(title: "신고", style: .default) { _ in
                                    let reportActionSheet = UIAlertController(title: "신고 사유 선택", message: nil, preferredStyle: .actionSheet)
                                    
                                    let report1 = UIAlertAction(title: "게시판 성격에 부적절함", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "INAPPROPRIATE_FOR_BOARD")
                                    }
                                    
                                    let report2 = UIAlertAction(title: "음란물/불건전한 만남 및 대화", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "OBSCENE_CONTENT")
                                    }
                                    
                                    let report3 = UIAlertAction(title: "낚시/놀람/도배", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "CLICKBAIT_SPAM")
                                    }
                                    
                                    let report4 = UIAlertAction(title: "욕설/비하", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "PROFANITY_AND_HATE")
                                    }
                                    
                                    let report5 = UIAlertAction(title: "정당/정치인 비하 및 선거운동", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "POLITICAL_REMARKS")
                                    }
                                    
                                    let report6 = UIAlertAction(title: "상업적 광고 및 판매", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "COMMERCIAL_ADVERTISING")
                                    }
                                    
                                    let report7 = UIAlertAction(title: "유출/사칭/사기", style: .default) { _ in
                                        self.reportPost(postId: self.post.postID, reason: "LEAK_IMPERSONATION_FRAUD")
                                    }
                                    
                                    reportActionSheet.addAction(report1)
                                    reportActionSheet.addAction(report2)
                                    reportActionSheet.addAction(report3)
                                    reportActionSheet.addAction(report4)
                                    reportActionSheet.addAction(report5)
                                    reportActionSheet.addAction(report6)
                                    reportActionSheet.addAction(report7)
                                    
                                    self.present(reportActionSheet, animated: true)
                                }
                                actionSheet.addAction(reportPost)
                            }

                            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                            actionSheet.addAction(cancelAction)

                            if let popoverController = actionSheet.popoverPresentationController {
                                popoverController.barButtonItem = self.navigationItem.rightBarButtonItem
                            }

                            self.present(actionSheet, animated: true)
                        }
                
            } catch {
                print("디코딩에 실패하였습니다.")
            }
            
        }.resume()
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
        
        if modifyCommentValue == true { // 댓글 수정이면
            modifyComment(commentId: modifyCommentId!, content: commentTextField.text!)
            modifyCommentValue = false
            modifyCommentId = nil
            return
        }
        
        let commentURLString = "http://\(Server.url)/post/\(post.postID)/comment/register"
        
        guard let url = URL(string: commentURLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        
        let commentRequestBody = MakeComment(content: commentTextField.text!, isAnonymous: isAnonymousSelected)
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": accessToken!]
        
        do {
            let jsonData = try JSONEncoder().encode(commentRequestBody)
            request.httpBody = jsonData
        } catch {
            print("JSON 인코딩에 실패하였습니다.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("네트워크 에러: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            // 서버 응답을 받은 후에 테이블 뷰 업데이트
            DispatchQueue.main.async {
                self.commentTextField.text = ""
                self.fetchDetails(postID: self.post.postID)
                self.fetchComment(postID: self.post.postID)
                self.tableView.reloadData()
            }
            
        }.resume()
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
            cell.likesLabel.text = "\(commentDetails.likeCount)"
            cell.commentsLabel.text = "\(commentDetails.commentCount)"
            cell.profileImageView.sd_setImage(with: URL(string: post.profile), placeholderImage: UIImage(named: "anonymous"))
            cell.configureCell(with: post)
            print(post.imageURL)
            if post.images.count != 0 {
                cell.imagesView.image = post.images[0]
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
        
        let URLString = "http://\(Server.url)/comment/\(cell.commentId)/verification"
        
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
                let commentVerification = try JSONDecoder().decode(Verification.self, from: data)
                print("\(commentVerification)")
                if commentVerification.message == "작성자와 일치합니다." {
                    self.myComment = true
                }
                
                DispatchQueue.main.async {
                            let actionSheet = UIAlertController(title: "댓글 메뉴", message: nil, preferredStyle: .actionSheet)

                            if self.myComment {
                                // 자신의 댓글일 때
                                let modifyPost = UIAlertAction(title: "수정", style: .default) { _ in
                                    // 댓글 수정 탭시 수행할 동작
                                    self.commentTextField.text = cell.commentLabel.text
                                    self.modifyCommentValue = true
                                    self.modifyCommentId = cell.commentId
                                }
                                let deletePost = UIAlertAction(title: "삭제", style: .default) { _ in
                                    // 댓글 삭제 탭시 수행할 동작
                                    self.deleteComment(commentId: cell.commentId)
                                }
                                actionSheet.addAction(modifyPost)
                                actionSheet.addAction(deletePost)
                            } else {
                                // 자신의 댓글이 아닐 때
                                let reportPost = UIAlertAction(title: "신고", style: .default) { _ in
                                    let reportActionSheet = UIAlertController(title: "신고 사유 선택", message: nil, preferredStyle: .actionSheet)
                                    
                                    let report1 = UIAlertAction(title: "게시판 성격에 부적절함", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "INAPPROPRIATE_FOR_BOARD")
                                    }
                                    
                                    let report2 = UIAlertAction(title: "음란물/불건전한 만남 및 대화", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "OBSCENE_CONTENT")
                                    }
                                    
                                    let report3 = UIAlertAction(title: "낚시/놀람/도배", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "CLICKBAIT_SPAM")
                                    }
                                    
                                    let report4 = UIAlertAction(title: "욕설/비하", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "PROFANITY_AND_HATE")
                                    }
                                    
                                    let report5 = UIAlertAction(title: "정당/정치인 비하 및 선거운동", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "POLITICAL_REMARKS")
                                    }
                                    
                                    let report6 = UIAlertAction(title: "상업적 광고 및 판매", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "COMMERCIAL_ADVERTISING")
                                    }
                                    
                                    let report7 = UIAlertAction(title: "유출/사칭/사기", style: .default) { _ in
                                        self.reportComment(commentId: cell.commentId, reason: "LEAK_IMPERSONATION_FRAUD")
                                    }
                                    
                                    reportActionSheet.addAction(report1)
                                    reportActionSheet.addAction(report2)
                                    reportActionSheet.addAction(report3)
                                    reportActionSheet.addAction(report4)
                                    reportActionSheet.addAction(report5)
                                    reportActionSheet.addAction(report6)
                                    reportActionSheet.addAction(report7)
                                    
                                    self.present(reportActionSheet, animated: true)
                                }
                                actionSheet.addAction(reportPost)
                            }

                            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                            actionSheet.addAction(cancelAction)

                            if let popoverController = actionSheet.popoverPresentationController {
                                popoverController.barButtonItem = self.navigationItem.rightBarButtonItem
                            }

                            self.present(actionSheet, animated: true)
                        }
                
            } catch {
                print("디코딩에 실패하였습니다.")
            }
            
        }.resume()
    }
    
    func deletePost(postId: Int) {
        
        let URLString = "http://\(Server.url)/post/\(postId)"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        }.resume()
        
    }
    
    func reportPost(postId: Int, reason: String) {
        
        let URLString = "http://\(Server.url)/post/\(postId)/report"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(UserDefaults.standard.string(forKey: "Authorization")!, forHTTPHeaderField: "Authorization")
        
        do { request.httpBody = try JSONEncoder().encode(Report(reportType: reason)) }
        catch {
            print("JSON 인코딩에 실패하였음.")
            return
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
        }.resume()
        
    }
    
    func reportComment(commentId: Int, reason: String) {
        
        let URLString = "http://\(Server.url)/post/\(commentId)/report"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(UserDefaults.standard.string(forKey: "Authorization")!, forHTTPHeaderField: "Authorization")
        
        do { request.httpBody = try JSONEncoder().encode(Report(reportType: reason)) }
        catch {
            print("JSON 인코딩에 실패하였음.")
            return
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
        }.resume()
        
    }
    
    func modifyComment(commentId: Int, content: String) {
        
        let modifyCommentBody = ModifyComment(content: content)
        
        let URLString = "http://\(Server.url)/comment/\(commentId)"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do { request.httpBody = try JSONEncoder().encode(modifyCommentBody)
        } catch {
            print("JSON 인코딩에 실패하였음.")
            return
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            // 서버 응답을 받은 후에 테이블 뷰 업데이트
            DispatchQueue.main.async {
                self.commentTextField.text = ""
                self.fetchDetails(postID: self.post.postID)
                self.fetchComment(postID: self.post.postID)
                self.tableView.reloadData()
            }
            
        }.resume()
        
    }
    
    func deleteComment(commentId: Int) {
        
        let URLString = "http://\(Server.url)/comment/\(commentId)"
        
        guard let URL = URL(string: URLString) else {
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            // 서버 응답을 받은 후에 테이블 뷰 업데이트
            DispatchQueue.main.async {
                self.fetchDetails(postID: self.post.postID)
                self.fetchComment(postID: self.post.postID)
                self.tableView.reloadData()
            }
            
        }.resume()
        
    }
}
