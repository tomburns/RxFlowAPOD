//
//  ViewController.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/8/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

import RxSwift

extension ObservableType where E == Date {
    func mapToSequentialDates(byAdding components: DateComponents,
                              desiredCount: Int,
                              on calendar: Calendar = .current) -> Observable<[Date]> {

        return map { startDate in
            var dates: [Date] = [startDate]

            while dates.count < desiredCount,
                let nextDate = calendar.date(byAdding: components, to: dates.last!) {
                    dates.append(nextDate)
            }

            return dates
        }
    }
}
