//
//  LoginViewController.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/09/30.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func login()
}

class LoginViewController: UIViewController {
    weak var delegate: LoginViewControllerDelegate?
    
    private lazy var titleLabel = TitleLabel(text: "LoginViewController", textColor: .lightGray)
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(touchLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func touchLoginButton() {
        delegate?.login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupViews()
    }
}

extension LoginViewController {
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30.0)
        ])
    }
}
