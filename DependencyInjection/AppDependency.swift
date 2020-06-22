//
//  AppDependency.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/21.
//  Copyright © 2020 jko. All rights reserved.
//

struct AppDependency {
    let firstViewControllerDependency: FirstViewController.Dependency
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let secondDependency: SecondViewController.Dependency = .init(
            generator: { HelloUserGenerator(user: "nadarm") }
        )
        
        let firstDependency: FirstViewController.Dependency = .init(
            generator: HelloWorldGenerator.init,
            secondViewControllerDependency: secondDependency
        )
        
        return AppDependency(
            firstViewControllerDependency: firstDependency
        )
    }
}

extension FirstViewController {
    struct Dependency {
        let generator: () -> StrGenerator
        let secondViewControllerDependency: SecondViewController.Dependency
    }
}

extension SecondViewController {
    struct Dependency {
        let generator: () -> StrGenerator
    }
}
