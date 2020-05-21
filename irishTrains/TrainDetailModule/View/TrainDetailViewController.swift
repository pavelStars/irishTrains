//
//  TrainDetailViewController.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class TrainDetailViewController: UIViewController {
    var output: TrainDetailViewOutput?
    private var trainStationSection: TrainSectionStation<TrainStationViewModel> = .empty

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var trainNameLabel: UILabel!

    @IBOutlet weak var emptyTrainsLabel: UILabel!
    @IBOutlet weak var trainList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.getInitialValues()
        configureTableView()

        output?.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.loadTrainStation()
    }

    private func reloadTrains(newSection: TrainSectionStation<TrainStationViewModel>) {
        trainStationSection = newSection
        var sectionIsEmpty: Bool
        switch trainStationSection {
        case .empty:
            sectionIsEmpty = true
        case .viewModels:
            sectionIsEmpty = false
        }
        hideShowEmptyState(isEmpty: sectionIsEmpty)
        trainList.reloadData()
    }

    private func hideShowEmptyState(isEmpty: Bool) {
        emptyTrainsLabel.isHidden = !isEmpty
        trainList.isHidden = isEmpty
    }

    private func configureTableView() {
        trainList.dataSource = self
        trainList.delegate = self
        trainList.register(UINib(nibName: "TrainStationTableViewCell", bundle: nil), forCellReuseIdentifier: "TrainStationTableViewCell")
        trainList.separatorStyle = .none
        trainList.estimatedRowHeight = 100
        trainList.rowHeight = UITableView.automaticDimension
    }
}

extension TrainDetailViewController: TrainDetailViewInput {
    func display(trainSection: TrainSectionStation<TrainStationViewModel>) {
        reloadTrains(newSection: trainSection)
    }

    func displayInfo(name: String, date: String) {
        dateLabel.text = date
        trainNameLabel.text = name
    }

    private func configure(cell: TrainStationTableViewCell, forRowAt indexPath: IndexPath) {
          switch trainStationSection {
          case .empty:
              return
          case .viewModels(let viewModels):
              let viewModel = viewModels[indexPath.row]
              cell.configure(trainStationViewModel: viewModel)
          }
      }
}

extension TrainDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch trainStationSection {
        case .empty:
            return 0
        case .viewModels(let viewModels):
            return viewModels.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrainStationTableViewCell") as? TrainStationTableViewCell else {
               return UITableViewCell()
           }
           configure(cell: cell, forRowAt: indexPath)
           return cell
    }
}
