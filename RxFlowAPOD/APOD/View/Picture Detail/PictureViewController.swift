//
//  PictureViewController.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class PictureViewController: UIViewController {
    fileprivate var disposeBag = DisposeBag()

    fileprivate var viewModel: PictureViewModel!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    }

    func bind(to viewModel: PictureViewModel) {

        loadViewIfNeeded()
        disposeBag = DisposeBag()

        self.viewModel = viewModel

        viewModel.viewState
            .drive(stateListener)
            .disposed(by: disposeBag)
    }

    lazy private(set) var stateListener = {
        return Binder<PictureViewState>.init(self) { vc, state in
            vc.navigationItem.title = state.imageTitle
            vc.imageView.image = state.image

            state.loading ? vc.spinner.startAnimating() : vc.spinner.stopAnimating()
        }
    }()
}
