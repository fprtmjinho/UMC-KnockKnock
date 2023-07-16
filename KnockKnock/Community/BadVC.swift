//
//  BadVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class BadVC: UIViewController {
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    let buttonTitles = ["10대", "20대", "30대", "40대~"]
    
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "검색어나 태그를 입력해주세요 :)"
        searchBar.isTranslucent = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                           for: .search, state: .normal)
        
        return searchBar
    }()
    
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var row: [(profile: UIImage?, title: String, text: String, image: UIImage?, like: Int, chat: Int)] = [(UIImage(named: "karim"), "혼자 방콕여행 어떻게 생각해?", "긴 문장 테스트: 성수는 기독교에서 중요한 예식인 세례를 위해 성별되도록 성직자가 축복한 물이다. 원래 초기 보편교회 시절에는 세례수만을 의미했지만 현재는 동방교회와 서방교회에서", #imageLiteral(resourceName: "beach"), 17, 7), (UIImage(named: "toni"), "혼자 미국여행 어떻게 생각해?", "짧은 문장 테스트", #imageLiteral(resourceName: "beach"), 10, 5), (UIImage(named: "sergio"), "긴 제목 테스트: 혼자 일본여행 어떻게 생각해?", "성수는 기독교에서 중요한 예식인 세례를 위해 성별되도록 성직자가 축복한 물이다. 원래 초기 보편교회 시절에는 세례수만을 의미했지만 현재는 동방교회와 서방교회에서", #imageLiteral(resourceName: "beach"), 13, 2)]
    
    
    func makeSubView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(buttonStackView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func makeConstraint() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
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
        createButtons()
        tableView.contentInset = contentInset
    }
    
    func createButtons() {
        for title in buttonTitles {
            let button = UIButton(type: .custom)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
            button.layer.cornerRadius = 16
            button.widthAnchor.constraint(equalToConstant: 75).isActive = true
            
            buttonStackView.addArrangedSubview(button)
        }
        
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 5
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {
            return
        }
        
        if sender.isSelected {
            sender.isSelected = false
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        } else {
            sender.isSelected = true
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        }
        
        print("Button tapped: \(title)")
        
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
