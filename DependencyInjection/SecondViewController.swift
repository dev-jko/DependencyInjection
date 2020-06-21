//
//  SecondViewController.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/21.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //  화면에 보여줄 텍스트를 생성해줍니다
    private let generator: HelloWorldGenerator = HelloWorldGenerator()
    
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
