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
    
    var row: [String] = ["Bad Row 1", "Bad Row 2", "Bad Row 3"] // 임시 row 데이터
    
    
    func makeSubView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
        
        // 아래로 스크롤 시 동적으로 행을 추가하기 위한 설정
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0) // 아래로 100pt까지 스크롤 가능하도록 콘텐츠 여백 설정
        tableView.contentInset = contentInset
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let indexPath = tableView.indexPathsForVisibleRows?.last else {
            return
        }
        
        let lastVisibleRow = indexPath.row
        let lastRow = row.count - 1
        
        if lastVisibleRow == lastRow {
            // 마지막 행이 보이는 경우, 새로운 행 추가
            let newRow = "Row \(lastRow + 2)"
            row.append(newRow)
            tableView.insertRows(at: [IndexPath(row: lastRow + 1, section: 0)], with: .automatic)
        }
    }
    
}

extension BadVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = row[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300 // 각 행의 높이 설정, 추후 수정 가능
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let contentOffsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let visibleHeight = scrollView.frame.height
            
            if contentOffsetY + visibleHeight >= contentHeight - 100 {
                // 스크롤이 아래로 도달하여 새로운 행 추가
                let lastRow = row.count
                let newRow = "Bad Row \(lastRow + 1)"
                row.append(newRow)
                tableView.insertRows(at: [IndexPath(row: lastRow, section: 0)], with: .automatic)
            }
        }
    
}


