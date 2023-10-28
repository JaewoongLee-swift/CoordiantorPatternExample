//
//  StartViewController.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/25.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func startApp()
}

class StartViewController: UIViewController {
    weak var delegate: StartViewControllerDelegate?
    
    private lazy var titleLabel = TitleLabel(text: "StartViewController", textColor: .blue)
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("앱 시작하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(touchStartButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func touchStartButton() {
        delegate?.startApp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupViews()
    }
}

extension StartViewController {
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30.0)
        ])
    }
}
