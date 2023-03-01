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
    private var enterButton = -1
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
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
        label.textColor = .black
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
    private let pythonButton: UIButton = {
        let button = UIButton().createMyButton(name: "Python")
        return button
    }()
    private let javaButton: UIButton = {
        let button = UIButton().createMyButton(name: "Java")
        return button
    }()
    private let kotlinButton: UIButton = {
        let button = UIButton().createMyButton(name: "Kotlin")
        return button
    }()
    private let cButton: UIButton = {
        let button = UIButton().createMyButton(name: "C++")
        return button
    }()
    private lazy var horizontalButtons: [UIButton] = [iosButton, androidButton, designButton, flutterButton, qaButton, pmButton, pythonButton, javaButton, kotlinButton, cButton]
    private let suggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 0
        return label
    }()
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(hexString: "#96959B")
        return label
    }()
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(send), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        layout()
        
    }
    
    private func configuration() {
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 1.4)
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(horiontalScroll)
        var countSymbol = 0
        for index in 0..<horizontalButtons.count {
            let button = horizontalButtons[index]
            horiontalScroll.addSubview(button)
            button.addTarget(self, action: #selector(enterButton(sender:)), for: .touchUpInside)
            button.tag = index
            countSymbol += (button.titleLabel?.text?.count)!
        }
        let widthContentSize = countSymbol * 8 + horizontalButtons.count * 48 + (horizontalButtons.count - 1) * 12 + 10
        horiontalScroll.contentSize = CGSize(width: widthContentSize, height: 44)
        backgroundView.addSubview(suggestionLabel)
        view.addSubview(questionLabel)
        view.addSubview(sendButton)
    }
    
    private func layout() {
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(view.bounds.height * 0.85)
            make.top.equalToSuperview()
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.bounds.height * 0.5)
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
        layoutButtons()
        suggestionLabel.snp.makeConstraints { make in
            make.top.equalTo(horiontalScroll.snp.bottom).offset(24)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-20)
        }
        questionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-78)
        }
        sendButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.left.equalTo(questionLabel.snp.right).offset(24)
            make.centerY.equalTo(questionLabel)
        }
        sendButton.titleLabel?.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(44)
            make.right.equalToSuperview().offset(-44)
        }
        
    }
    
    private func layoutButtons() {
        for index in 0..<horizontalButtons.count {
            let button = horizontalButtons[index]
            button.titleLabel?.snp.remakeConstraints({ make in
                make.left.equalToSuperview().offset(24)
                make.right.equalToSuperview().offset(-24)
            })
            if index == 0 {
                button.snp.remakeConstraints { make in
                    make.left.top.equalToSuperview()
                    make.height.equalTo(43)
                }
                continue
            }
            let beforeButton = horizontalButtons[index-1]
            button.snp.remakeConstraints { make in
                make.left.equalTo(beforeButton.snp.right).offset(12)
                make.top.equalToSuperview()
                make.height.equalTo(43)
            }
        }
    }
}

@objc extension MainController {
    private func enterButton(sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [self] in
            for index in 0..<self.horizontalButtons.count {
                let button = self.horizontalButtons[index]
                button.backgroundColor = UIColor(hexString: "#F3F3F5")
                button.setTitleColor(.black, for: .normal)
                button.tag = index
            }
            
            
            if sender.tag != self.enterButton{
                sender.backgroundColor = .black
                sender.setTitleColor(.white, for: .normal)
                self.enterButton = sender.tag
            }else {
                self.enterButton = -1
            }
        }
    }
    
    private func send() {
        guard enterButton >= 0 else {
            let alert = UIAlertController(title: "Выберете пожалуйста направление", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "Закрыть", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        let direction = (horizontalButtons[enterButton].titleLabel?.text)!
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена! Направление \(direction)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
