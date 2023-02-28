//
//  Button + Ext.swift
//  Surf-Internship
//
//  Created by Алексей Ревякин on 28.02.2023.
//
import UIKit


extension UIButton {
    func createMyButton(name: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#F3F3F5")
        button.setTitle(name, for: .normal)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        return button
    }
}
