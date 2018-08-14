//
//  DateListCoordinator.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/13/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class DateListCoordinator {
    private let navigationController: UINavigationController

    private let listVC: DateListViewController

    fileprivate var disposeBag = DisposeBag()

    var rootViewController: UIViewController {
        return navigationController
    }

    init(navController: UINavigationController) {

        guard let listVC = navController.viewControllers.first as? DateListViewController else {
            fatalError("Unexpected view arrangement")
        }

        navigationController = navController
        self.listVC = listVC
    }

    func start() -> Signal<DateListEvent> {
        let listVM = DateListViewModel(startDate: .just(Date()))
        listVC.bind(to: listVM)

        return listVM.events
    }
}

