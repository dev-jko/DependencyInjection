//
//  SecondViewController.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/21.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //  헬로월드 제네레이터 대신 스트링 제네레이터로 바꿔줍니다
    private let generator: StrGenerator
    
    //  생성된 텍스트를 화면에 띄워줍니다
    private let label: UILabel = {
        let lb = UILabel()
        lb.textColor = .blue
        lb.font = .systemFont(ofSize: 30)
        lb.textAlignment = .center
        lb.layer.borderWidth = 1
        lb.layer.borderColor = UIColor.black.cgColor
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    //  생성자 주입
    init(strGenerator: StrGenerator) {
        self.generator = strGenerator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setLayout()
        
        label.text = generator.generate()
    }
    
    private func setLayout() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
