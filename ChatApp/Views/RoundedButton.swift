//
//  RoundedButton.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//

import UIKit
class RoundedButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
    }
}
