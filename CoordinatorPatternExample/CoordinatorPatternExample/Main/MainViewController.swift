//
//  MainViewController.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/30.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func profileEdit()
}

class MainViewController: UIViewController {
    weak var delegate: MainViewControllerDelegate?
    
    private lazy var titleLabel = TitleLabel(text: "MainViewController", textColor: .link)
    
    private lazy var profileEditButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원정보 수정하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(touchprofileEditButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func touchprofileEditButton() {
        delegate?.profileEdit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupViews()
    }
}

extension MainViewController {
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(profileEditButton)
        
        NSLayoutConstraint.activate([
            profileEditButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileEditButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30.0)
        ])
    }
}
