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
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(hexString: "#96959B")
        label.numberOfLines = 0
        return label
    }()
    private let horiontalScroll: UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .blue
        return scroll
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
    }
}