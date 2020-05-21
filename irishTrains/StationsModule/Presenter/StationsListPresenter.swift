//
//  StationsListPresenter.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

enum StationSection<T> {
    case empty
    case viewModels([T])
}

class StationsListPresenter {
    unowned var view: StationsListViewInput
    var interactor: StationsListInteractorInput
    var errorHandler: ErrorHandler?
    var completionHandler: StationsListCompletionHandler?
    private var stationSection: StationSection<StationViewModel> = .empty

    private var filteredStations: [Station] = [] {
        didSet {
            let viewModels = filteredStations.map({ StationViewModel(station: $0) })
            if viewModels.count > 0 {
                stationSection = .viewModels(viewModels)
            }
            view.display(stationSection: stationSection)
        }
    }

    private var allStations: [Station] = [] {
        didSet {
            let viewModels = allStations.map({ StationViewModel(station: $0) })
            if viewModels.count > 0 {
                stationSection = .viewModels(viewModels)
            }
            view.display(stationSection: stationSection)
        }
    }

    init(view: StationsListViewInput,
         interactor: StationsListInteractorInput,
         errorHandler: ErrorHandler?,
         completionHandler: StationsListCompletionHandler?) {
        self.view = view
        self.interactor = interactor
        self.errorHandler = errorHandler
        self.completionHandler = completionHandler
    }

    private func sendRequestForAllStations() {
        view.startActivityIndicator()
        interactor.loadStations()
    }
}

// MARK: - StationsListPresenterViewOutput

extension StationsListPresenter: StationsListViewOutput {
    func viewIsReady() {
    }

    func loadStations() {
        sendRequestForAllStations()
    }

    func didMakeSearchWithString(string: String, isFiltering: Bool) {
        guard isFiltering else {
            filteredStations = allStations
            return
        }
        filteredStations = allStations.filter({ $0.name.contains(string) })
    }

    func didTap(stationViewModel: StationViewModel) {
        completionHandler?(.detailStation(stationViewModel))
    }
}

// MARK: - StationsListPresenterInteractorOutput

extension StationsListPresenter: StationsListInteractorOutput {
    func didFetchStations(stations: [Station]) {
        view.stopActivityIndicator()
        allStations = stations
    }

    func didLoadDataWithError(error: Error) {
        view.stopActivityIndicator()
    }
}
