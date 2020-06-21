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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        //  퍼스트 뷰 컨트롤러를 루트 뷰 컨트롤러로 지정하고 화면에 띄워줍니다
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = FirstViewController()
        
        return true
    }

}

