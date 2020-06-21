//
//  FirstViewController.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/20.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
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

    //  세컨드 뷰 컨트롤러로 연결할 버튼입니다
    private let btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to second", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.backgroundColor = .lightGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        
        label.text = generator.generate()
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }

    private func setLayout() {
        view.addSubview(label)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 100),
            
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.widthAnchor.constraint(equalToConstant: 200),
            btn.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc
    private func btnClicked(_ sender: UIButton) {
        let vc = SecondViewController()
        present(vc, animated: true, completion: nil)
    }

}

