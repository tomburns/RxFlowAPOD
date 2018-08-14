//
//  APODCoordinator.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

import RxSwift

class APODCoordinator {

    private let splitViewController: UISplitViewController

    private lazy var dateListCoordinator: DateListCoordinator = {
        guard let navVC = R.storyboard.apoD.dateListNavController(),
            navVC.viewControllers.first is DateListViewController else {
                fatalError("unexpected view hierarchy")
        }

        return DateListCoordinator(navController: navVC)

    }()

    private lazy var pictureDetailCoordinator: PictureDetailCoordinator = {
        guard let navVC = R.storyboard.apoD.pictureDetailNavController(),
            navVC.viewControllers.first is DateListViewController else {
                fatalError("unexpected view hierarchy")
        }

        return PictureDetailCoordinator(navController: navVC)
    }()


    private var disposeBag = DisposeBag()

    init(splitVC: UISplitViewController) {
        splitViewController = splitVC
        splitVC.delegate = self

        splitVC.preferredDisplayMode = .allVisible

        guard let listNav = splitViewController.viewControllers.first as? UINavigationController else {
            fatalError("unexpected view hierarchy")
        }
        
        dateListCoordinator = DateListCoordinator(navController: listNav)

        if splitViewController.viewControllers.count > 1 {
            // if the split view is extended at init the detail hierarchy
            // is already present and we can attach here; otherwise it will
            // be lazily initialized when needed
            guard let detailNav = splitViewController.viewControllers[1] as? UINavigationController else {
                fatalError("unexpected view hierarchy")
            }

            pictureDetailCoordinator = PictureDetailCoordinator.init(navController: detailNav)
        }
    }

    func start() {
        dateListCoordinator.start()
            .do(onNext: { [splitViewController, pictureDetailCoordinator] _ in
                splitViewController
                    .showDetailViewController(
                        pictureDetailCoordinator.rootViewController,
                        sender: nil
                )
            })
            .emit(to: pictureDetailCoordinator.listEvents)
            .disposed(by: disposeBag)

        pictureDetailCoordinator.start()
    }
}


extension APODCoordinator: UISplitViewControllerDelegate {
}
