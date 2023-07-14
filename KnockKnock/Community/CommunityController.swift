//
//  InformationController.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit
import Tabman
import Pageboy

class CommunityController: TabmanViewController {
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let topLine: UIView = {
        let topLine = UIView()
        topLine.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        return topLine
    }()
    
    let bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        return bottomLine
    }()
    
    // Floating Button
    private lazy var floatingButton: UIButton = {
            let button = UIButton()
            var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
            config.cornerStyle = .capsule
            config.image = UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
            button.configuration = config
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 0.3
            button.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
            return button
        }()
        private let writeButton: UIButton = {
            let button = UIButton()
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
            config.cornerStyle = .capsule
            config.image = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
            button.configuration = config
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 0.3
            button.alpha = 0.0
            return button
        }()
        private var isActive: Bool = false {
            didSet {
                showActionButtons()
            }
        }
        private var animation: UIViewPropertyAnimator?
    
    func makeSubView() {
        barView.addSubview(topLine)
        barView.addSubview(bottomLine)
    }
    
    func makeConstraint() {
        topLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: barView.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: barView.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: barView.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 1.0),
            bottomLine.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: barView.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: barView.trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1.0),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        self.view.backgroundColor = .white
        
        // TabmanViewController 설정
        self.dataSource = self
        
        // TabmanBar 설정
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.backgroundView.style = .custom(view: barView)
        bar.buttons.customize { (button) in
            // 버튼 커스텀
            button.tintColor = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
            button.selectedTintColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
        }
        bar.indicator.tintColor = .clear
        bar.indicator.weight = .custom(value: 1.0)
        addBar(bar, dataSource: self, at: .top)
        
        makeSubView()
        makeConstraint()
        setUI() // Floating Button 세팅
        
    }
    
    // Floating Button
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 8 - 90, width: 60, height: 60)
            writeButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 80 - 8 - 80, width: 60, height: 60)
        }
        
        private func setUI() {
            view.backgroundColor = .systemBackground
            view.addSubview(floatingButton)
            view.addSubview(writeButton)
        }
        
        
        @objc private func didTapFloatingButton() {
            isActive.toggle()
        }
        
        private func showActionButtons() {
            popButtons()
            rotateFloatingButton()
        }
        
        private func popButtons() {
            if isActive {
                writeButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
                UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
                    guard let self = self else { return }
                    self.writeButton.layer.transform = CATransform3DIdentity
                    self.writeButton.alpha = 1.0
                })
            } else {
                UIView.animate(withDuration: 0.15, delay: 0.2, options: []) { [weak self] in
                    guard let self = self else { return }
                    self.writeButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.1)
                    self.writeButton.alpha = 0.0
                }
            }
        }
        
        private func rotateFloatingButton() {
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            let fromValue = isActive ? 0 : CGFloat.pi / 4
            let toValue = isActive ? CGFloat.pi / 4 : 0
            animation.fromValue = fromValue
            animation.toValue = toValue
            animation.duration = 0.3
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            floatingButton.layer.add(animation, forKey: nil)
        }
}

extension CommunityController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        switch index {
        case 0:
            return GoodVC()
        case 1:
            return BadVC()
        default:
            return nil
        }
        
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

extension CommunityController: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "선 게시판")
        } else {
            return TMBarItem(title: "악 게시판")
        }
    }
}
