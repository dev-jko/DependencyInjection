//
//  AppDelegate.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/20.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDependency: AppDependency = AppDependency.resolve()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        //  퍼스트 뷰 컨트롤러를 루트 뷰 컨트롤러로 지정하고 화면에 띄워줍니다
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        //  퍼스트 뷰컨에 의존성 주입을 해주기 위해 앱 델리게이트에도 의존성이 생겨버렸습니다???
        let firstDependency = appDependency.firstViewControllerDependency
        window?.rootViewController = FirstViewController(
            strGenerator: firstDependency.generator(),
            secondViewControllerDependency: firstDependency.secondViewControllerDependency
        )
        
        return true
    }

}

