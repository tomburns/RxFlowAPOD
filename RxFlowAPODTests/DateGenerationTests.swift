//
//  DateGenerationTests.swift
//  RxFlowAPODTests
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import XCTest

import RxSwift
import RxTest

@testable import RxFlowAPOD

class DateGenerationTests: XCTestCase {
    var testScheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    func testDateGeneration() {
        let date = Date.init(timeIntervalSince1970: 0)

        let components = DateComponents(day: 1)

        let results: TestableObserver<[Date]> = testScheduler.start {
            return Observable.just(date)
                .mapToSequentialDates(byAdding: components, desiredCount: 30)
        }

        XCTAssertEqual(results.events.count, 2)

        guard let event = results.events.first?.value,
            case let .next(resultingDates) = event else {
                XCTFail("Dates not generated")
                return
        }

        XCTAssertEqual(resultingDates.count, 30)
        XCTAssertEqual(resultingDates.last?.timeIntervalSince1970, 2505600.0)
    }
}
