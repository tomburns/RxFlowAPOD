//
//  PictureDetailCoordinator.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/13/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

import Nuke

class PictureDetailCoordinator {
    private let navigationController: UINavigationController

    private let pictureVC: PictureViewController

    private let photoInteractor = PhotoInteractor()

    let listEvents = PublishRelay<DateListEvent>()

    fileprivate var disposeBag = DisposeBag()

    var rootViewController: UIViewController {
        return navigationController
    }

    init(navController: UINavigationController) {
        guard let pictureVC = navController.viewControllers.first as? PictureViewController else {
            fatalError("Unexpected view arrangement")
        }

        self.navigationController = navController
        self.pictureVC = pictureVC
    }

    func start() {
        let viewModel = PictureViewModel()

        pictureVC.bind(to: viewModel)
        
        listEvents
            .map { event -> Date in
                switch event {
                case .selected(let date):
                    return date
                }
            }
            .flatMap(photoInteractor.image)
            .bind(to: viewModel.currentImage)
            .disposed(by: disposeBag)
    }
}
