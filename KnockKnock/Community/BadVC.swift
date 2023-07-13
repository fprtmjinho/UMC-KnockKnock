//
//  BadVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class BadVC: UIViewController {
    
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
            //            let newRowText = "Row \(lastRow + 2)"
            //            let newRowImage = UIImage(named: "placeholder")
            //            row.append((text: newRowText, image: newRowImage))
            //            tableView.insertRows(at: [IndexPath(row: lastRow + 1, section: 0)], with: .automatic)
        }
    }
    
}

extension BadVC: UITableViewDelegate, UITableViewDataSource {
    
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
