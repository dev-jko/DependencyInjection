//
//  StrGenerator.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/21.
//  Copyright © 2020 jko. All rights reserved.
//

protocol StrGenerator {
    func generate() -> String
}

//  그냥 "hello world!" 스트링을 생성해주는 클래스입니다
class HelloWorldGenerator: StrGenerator {
    func generate() -> String {
        return "hello world!"
    }
}

//  유저를 받고 "헬로 유저" 스트링을 생성해주는 클래스입니다
class HelloUserGenerator: StrGenerator {
    private let user: String
    
    init(user: String) {
        self.user = user
    }
    
    func generate() -> String {
        return "hello \(user)!"
    }
}
