//
//  AppDependency.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/21.
//  Copyright © 2020 jko. All rights reserved.
//

//  앱 전체의 의존성을 여기서 관리합니다
extension AppDependency {
    static func resolve() -> AppDependency {
        
        //  세컨드 뷰컨의 의존성
        let secondDependency: SecondViewController.Dependency = .init(
            generator: { HelloUserGenerator(user: "nadarm") }
        )
        
        //  퍼스트 뷰컨의 의존성
        let firstDependency: FirstViewController.Dependency = .init(
            generator: HelloWorldGenerator.init,
            secondViewControllerDependency: secondDependency
        )
        
        //  앱 델리게이트의 의존성
        return AppDependency(
            firstViewControllerDependency: firstDependency
        )
    }
}

//  앱 델리게이트의 의존성
struct AppDependency {
    let firstViewControllerDependency: FirstViewController.Dependency
}

//  퍼스트 뷰컨의 의존성
extension FirstViewController {
    struct Dependency {
        //  클로저를 사용해 게으른 생성이 가능합니다
        let generator: () -> StrGenerator
        
        //  게으른 생성이 필요 없으면 바로 넣어줘도 됩니다
        //  퍼스트 뷰컨에서 세컨드 뷰컨로 이어지기 때문에 세컨드 뷰컨의 의존성도 같이 넣어줍니다
        let secondViewControllerDependency: SecondViewController.Dependency
    }
}

//  세컨드 뷰컨의 의존성
extension SecondViewController {
    struct Dependency {
        let generator: () -> StrGenerator
    }
}
