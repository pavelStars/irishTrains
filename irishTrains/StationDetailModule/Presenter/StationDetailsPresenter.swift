//
//  StationDetailsPresenter.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

enum TrainSection<T> {
    case empty
    case viewModels([T])
}

class StationDetailsPresenter {
    private var stationDesct: String!
    unowned var view: StationDetailsViewInput
    var interactor: StationDetailsInteractorInput
    var errorHandler: ErrorHandler?
    var completionHandler: StationDetailsCompletionHandler?
    private var trainSection: TrainSection<TrainViewModel> = .empty

    private var allTrains: [StationDetail] = [] {
           didSet {
            let viewModels = allTrains.map({ TrainViewModel(trainDetail: $0) })
               if viewModels.count > 0 {
                   trainSection = .viewModels(viewModels)
               }
               view.display(trainSection: trainSection)
           }
       }

    init(view: StationDetailsViewInput,
         interactor: StationDetailsInteractorInput,
         errorHandler: ErrorHandler?,
         completionHandler: StationDetailsCompletionHandler?,
         stationDesct: String) {
        self.view = view
        self.interactor = interactor
        self.errorHandler = errorHandler
        self.completionHandler = completionHandler
        self.stationDesct = stationDesct
    }

    private func sendRequestForStationDetails() {
        view.startActivityIndicator()
        interactor.loadStations(stationDesct: stationDesct)
    }
}

// MARK: - StationDetailsPresenterViewOutput

extension StationDetailsPresenter: StationDetailsViewOutput {
    func viewIsReady() {
    }

    func loadStationDetails() {
        sendRequestForStationDetails()
    }

    func didTap(trainViewModel: TrainViewModel) {
         completionHandler?(.trainDetails(trainViewModel))
    }
}

// MARK: - StationDetailsPresenterInteractorOutput

extension StationDetailsPresenter: StationDetailsInteractorOutput {
    func didFetchTrains(trains: [StationDetail]) {
        view.stopActivityIndicator()
        allTrains = trains
    }

    func didLoadDataWithError(error: Error) {
        view.stopActivityIndicator()
        errorHandler?.handleError(error)
    }

}
