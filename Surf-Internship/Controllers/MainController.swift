//
//  MainController.swift
//  Surf-Internship
//
//  Created by Алексей Ревякин on 27.02.2023.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    
    //MARK: - Variables
    private let enterButton: Int?
    private let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false
        return scroll
    }()
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Resources.Image.backgroundImage
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private let backgroundView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 0
        return label
    }()
    private let horiontalScroll: UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    private let iosButton: UIButton = {
        let button = UIButton().createMyButton(name: "IOS")
       return button
    }()
    private let androidButton: UIButton = {
        let button = UIButton().createMyButton(name: "Android")
       return button
    }()
    private let designButton: UIButton = {
        let button = UIButton().createMyButton(name: "Design")
       return button
    }()
    private let flutterButton: UIButton = {
        let button = UIButton().createMyButton(name: "Flutter")
       return button
    }()
    private let qaButton: UIButton = {
        let button = UIButton().createMyButton(name: "QA")
       return button
    }()
    private let pmButton: UIButton = {
        let button = UIButton().createMyButton(name: "PM")
       return button
    }()
    private lazy var horizontalButtons: [UIButton] = [iosButton, androidButton, designButton, flutterButton, qaButton, pmButton]
    private let suggestionLabel: UILabel = {
       let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        layout()
        
    }
    
    private func configuration() {
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 1.6)
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundImageView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(descriptionLabel)
        horiontalScroll.contentSize = CGSize(width: view.bounds.width * 2, height: 44)
        backgroundView.addSubview(horiontalScroll)
        for index in 0..<horizontalButtons.count {
            let button = horizontalButtons[index]
            horiontalScroll.addSubview(button)
            button.addTarget(self, action: #selector(enterButton(sender:)), for: .touchUpInside)
            button.tag = index
        }
        backgroundView.addSubview(suggestionLabel)
    }
    
    private func layout() {
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.height.equalTo(view.bounds.height * 0.85)
            make.top.equalToSuperview()
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(-view.bounds.height * 0.15)
            make.width.left.equalToSuperview()
            make.height.equalTo(view.bounds.height * 0.9)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(24)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-20)
        }
        horiontalScroll.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.left.equalTo(descriptionLabel)
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        for index in 0..<horizontalButtons.count {
            let button = horizontalButtons[index]
            button.titleLabel?.snp.makeConstraints({ make in
                make.left.equalToSuperview().offset(24)
                make.right.equalToSuperview().offset(-24)
            })
            if index == 0 {
                button.snp.makeConstraints { make in
                    make.left.top.equalToSuperview()
                    make.height.equalTo(44)
                }
                continue
            }
            let beforeButton = horizontalButtons[index-1]
            button.snp.makeConstraints { make in
                make.left.equalTo(beforeButton.snp.right).offset(12)
                make.top.equalToSuperview()
                make.height.equalTo(44)
            }
        }
        suggestionLabel.snp.makeConstraints { make in
            make.top.equalTo(horiontalScroll.snp.bottom).offset(24)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-20)
        }
    }
}

extension MainController {
    @objc private func enterButton(sender: UIButton) {
        for button in horizontalButtons {
            button.backgroundColor = UIColor(hexString: "#F3F3F5")
            button.setTitleColor(.black, for: .normal)
        }
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        enterButton = sender.tag
    }
}
