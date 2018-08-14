//
//  DateListViewModel.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import RxSwift
import RxCocoa

class DateListViewModel {
    let dateList: Driver<[Date]>

    let selection = BehaviorRelay<IndexPath?>(value: nil)

    let events: Signal<DateListEvent>


    init(startDate: Observable<Date>) {
        let comps = DateComponents(day: -1)

        let dateList = startDate
            .mapToSequentialDates(byAdding: comps, desiredCount: 90)
            .asDriver(onErrorJustReturn: [])

        self.dateList = dateList

        events = selection
            .filter { $0 != nil }
            .withLatestFrom(dateList) { return ($0!, $1) }
            .map { pair in
                return pair.1[pair.0.row]
            }
            .asSignal(onErrorSignalWith: .never())
            .map { return .selected($0) }
    }
}

enum DateListEvent {
    case selected(Date)
}
