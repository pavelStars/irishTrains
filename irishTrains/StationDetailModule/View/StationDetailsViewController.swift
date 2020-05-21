//
//  StationDetailsViewController.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class StationDetailsViewController: UIViewController {
    var output: StationDetailsViewOutput?

    @IBOutlet weak var noTrainsLabel: UILabel!
    @IBOutlet weak var trainsListView: UITableView!

    private var trainSection: TrainSection<TrainViewModel> = .empty

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "List Trains"
        output?.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.loadStationDetails()
    }

    private func configureTableView() {
        trainsListView.dataSource = self
        trainsListView.delegate = self
        trainsListView.register(UINib(nibName: "TrainDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "TrainDetailTableViewCell")
        trainsListView.estimatedRowHeight = 100
        trainsListView.separatorStyle = .none
        trainsListView.rowHeight = UITableView.automaticDimension
    }

    private func configure(cell: TrainDetailTableViewCell, forRowAt indexPath: IndexPath) {
        switch trainSection {
        case .empty:
            return
        case .viewModels(let viewModels):
            let viewModel = viewModels[indexPath.row]
            cell.configure(trainViewModel: viewModel)
        }
    }

    private func reloadTrains(newSection: TrainSection<TrainViewModel>) {
        trainSection = newSection
        var sectionIsEmpty: Bool
        switch trainSection {
        case .empty:
            sectionIsEmpty = true
        case .viewModels:
            sectionIsEmpty = false
        }
        hideShowEmptyState(isEmpty: sectionIsEmpty)
        trainsListView.reloadData()
    }

    private func hideShowEmptyState(isEmpty: Bool) {
        noTrainsLabel.isHidden = !isEmpty
        trainsListView.isHidden = isEmpty
    }
    
}

extension StationDetailsViewController: StationDetailsViewInput {
    func display(trainSection: TrainSection<TrainViewModel>) {
        reloadTrains(newSection: trainSection)
    }
}

extension StationDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch trainSection {
        case .empty:
            return 0
        case .viewModels(let viewModels):
            return viewModels.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrainDetailTableViewCell") as? TrainDetailTableViewCell else {
            return UITableViewCell()
        }
        configure(cell: cell, forRowAt: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if case .viewModels(let viewModels) = trainSection {
            let viewModel = viewModels[indexPath.row]
            output?.didTap(trainViewModel: viewModel)
        }
    }
}
