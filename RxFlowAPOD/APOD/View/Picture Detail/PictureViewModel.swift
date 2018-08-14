//
//  PictureViewModel.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/13/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import RxSwift
import RxCocoa

import Nuke
import RxNuke

class PictureViewModel {
    let currentImage = PublishRelay<PhotoResponse>()

    let viewState: Driver<PictureViewState>

    init() {
        let titles = currentImage.map { PictureViewEvent.titleReceived($0.title) }

        let images = currentImage.flatMapLatest {
            return ImagePipeline.shared.rx.loadImage(with: $0.url)
                .map { PictureViewEvent.imageReceived($0.image) }
                .catchErrorJustReturn(PictureViewEvent.imageReceived(nil))

        }

        let initialState = PictureViewState(imageTitle: nil,
                                            loading: false,
                                            image: nil)

        viewState = Observable.merge(titles, images)
            .asDriver(onErrorDriveWith: .never())
            .scan(initialState) { state, event in
                var newState = state

                switch event {
                case .imageReceived(let image):
                    newState.image = image
                    newState.loading = false
                case .titleReceived(let title):
                    newState.imageTitle = title
                    newState.image = nil
                    newState.loading = true

                }

                return newState
        }
    }
}

struct PictureViewState {
    var imageTitle: String?
    var loading: Bool = false
    var image: UIImage?
}

enum PictureViewEvent {
    case titleReceived(String)
    case imageReceived(UIImage?)
}
