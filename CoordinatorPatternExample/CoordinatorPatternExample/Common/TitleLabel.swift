//
//  TitleLabel.swift
//  CoordinatorPatternExample
//
//  Created by Jaewoong Lee on 2023/10/01.
//

import UIKit

class TitleLabel: UILabel {
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 32.0, weight: .bold)
        
        self.textColor = textColor
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
