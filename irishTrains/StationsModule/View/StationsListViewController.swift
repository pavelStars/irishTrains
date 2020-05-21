//
//  StationsListViewController.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class StationsListViewController: UIViewController {
    var output: StationsListViewOutput?
    private var stationSection: StationSection<StationViewModel> = .empty
    private var isFiltering: Bool = false

    @IBOutlet private weak var stationList: UITableView!
    @IBOutlet private weak var noStations: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchController()
        title = "List Stations"
        output?.viewIsReady()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.loadStations()
    }

    private func configureTableView() {
        stationList.dataSource = self
        stationList.delegate = self
        stationList.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: "StationTableViewCell")
        stationList.separatorStyle = .none
        stationList.estimatedRowHeight = 100
        stationList.rowHeight = UITableView.automaticDimension
    }

    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Station"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func reloadStations(newSection: StationSection<StationViewModel>) {
        stationSection = newSection
        var sectionIsEmpty: Bool
        switch stationSection {
        case .empty:
            sectionIsEmpty = true
        case .viewModels:
            sectionIsEmpty = false
        }
        hideShowEmptyState(isEmpty: sectionIsEmpty)
        stationList.reloadData()
    }

    private func hideShowEmptyState(isEmpty: Bool) {
        noStations.isHidden = !isEmpty
        stationList.isHidden = isEmpty
    }

    private func configure(cell: StationTableViewCell, forRowAt indexPath: IndexPath) {
        switch stationSection {
        case .empty:
            return
        case .viewModels(let viewModels):
            let viewModel = viewModels[indexPath.row]
            cell.configure(stationViewModel: viewModel)
        }
    }
}

extension StationsListViewController: StationsListViewInput {
    func display(stationSection: StationSection<StationViewModel>) {
        reloadStations(newSection: stationSection)
    }
}

extension StationsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch stationSection {
        case .empty:
            return 0
        case .viewModels(let viewModels):
            return viewModels.count
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell") as? StationTableViewCell else {
            return UITableViewCell()
        }
        configure(cell: cell, forRowAt: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if case .viewModels(let viewModels) = stationSection {
            let viewModel = viewModels[indexPath.row]
            output?.didTap(stationViewModel: viewModel)
        }
    }
}

extension StationsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchText = searchBar.text else {
            isFiltering = false
            return
        }
        isFiltering = searchController.isActive && !(searchController.searchBar.text?.isEmpty ?? true)
        output?.didMakeSearchWithString(string: searchText, isFiltering: isFiltering)
    }
}
