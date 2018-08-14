//
//  AppCoordinator.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

class AppCoordinator {

    let tabBarController: UITabBarController

    let apodCoordinator: APODCoordinator
    let settingsCoordinator: SettingsCoordinator

    init(window: UIWindow?) {
        guard let tabVC = window?.rootViewController as? UITabBarController,
        let apodSplitVC = tabVC.viewControllers?[.apod] as? UISplitViewController,
        let settingsNav = tabVC.viewControllers?[.settings] as? UINavigationController else {
            fatalError("encountered unexpected hierarchy")
        }

        tabBarController = tabVC
        apodCoordinator = APODCoordinator(splitVC: apodSplitVC)
        settingsCoordinator = SettingsCoordinator(navVC: settingsNav)
    }

    func start() {
        apodCoordinator.start()
        settingsCoordinator.start()
    }
}

enum MainTab: Int {
    case apod = 0
    case settings
}

extension Collection where Index == Int {
    subscript(_ tab: MainTab) -> Element {
        return self[tab.rawValue]
    }
}
