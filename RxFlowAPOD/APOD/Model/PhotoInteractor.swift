//
//  PhotoInteractor.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/13/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import RxSwift
import RxCocoa
import Nuke
import RxNuke

class PhotoInteractor {
    private let APIKey = "Zc6OmlKmmu85kWwfFQK9GpxLkvSTGgHrHT7C5Waa"

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        return dateFormatter
    }()

    func image(for date: Date) -> Observable<PhotoResponse> {
        return URLSession.shared.rx.data(request: URLRequest(url: url(for: date)))
            .map { try JSONDecoder().decode(PhotoResponse.self, from: $0) }
    }
    
    fileprivate func url(for date: Date) -> URL {
        var components = URLComponents(string: "https://api.nasa.gov")!

        components.path = "/planetary/apod"

        components.queryItems = [.init(name:"api_key", value: APIKey),
                                 .init(name: "date", value: dateFormatter.string(from: date))]
        return components.url!
    }
}

struct PhotoResponse: Codable {
    let title: String
    let url: URL
}
