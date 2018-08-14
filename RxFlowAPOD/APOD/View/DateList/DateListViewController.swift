//
//  DateListViewController.swift
//  RxFlowAPOD
//
//  Created by Tom Burns on 8/9/18.
//  Copyright © 2018 ActiveCampaign. All rights reserved.
//

import UIKit

import RxSwift

class DateListViewController: UITableViewController {
    fileprivate var viewModel: DateListViewModel!
    fileprivate var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil

    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        self.clearsSelectionOnViewWillAppear = self.splitViewController?.isCollapsed ?? true
    }

    func bind(to viewModel: DateListViewModel) {
        disposeBag = DisposeBag()

        self.viewModel = viewModel

        viewModel.dateList.drive(tableView.rx.items) { tv, row, date in
            let cell = tv.dequeueReusableCell(withIdentifier: R.reuseIdentifier.dateCell,
                                              for: IndexPath(row: row, section: 0))!

            cell.textLabel?.text = date.description

            return cell
            }
            .disposed(by: disposeBag)

        tableView.rx.itemSelected
            .bind(to: viewModel.selection)
            .disposed(by: disposeBag)
    }
}
