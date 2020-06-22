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
    
    //  앱 델리게이트의 의존성을 받습니다
    let appDependency: AppDependency = .resolve()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        //  퍼스트 뷰 컨트롤러를 루트 뷰 컨트롤러로 지정하고 화면에 띄워줍니다
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        //  앱 디펜던시에 있는 퍼스트 뷰컨의 의존성을 받아서 생성자 주입을 해줍니다
        //  secondViewControllerDependency는 세컨드 뷰컨의 의존성을 받기 위해 만들어준 프로퍼티에요
        let firstDependency = appDependency.firstViewControllerDependency
        window?.rootViewController = FirstViewController(
            strGenerator: firstDependency.generator(),
            secondViewControllerDependency: firstDependency.secondViewControllerDependency
        )
        
        return true
    }

}

