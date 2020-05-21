//
//  StationsListInteractor.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

class StationsListInteractor {
    weak var output: StationsListInteractorOutput?
    private let webService: StationWebServicesProtocol


    init(webService: StationWebServicesProtocol) {
        self.webService = webService
    }
}

// MARK: - StationsListInteractorInteractorInput

extension StationsListInteractor: StationsListInteractorInput {

    func loadStations() {
        webService.getStationWebServices(completion: { [weak self] result in
            switch result {
            case .success(let stations):
                self?.output?.didFetchStations(stations: stations)
            case .failure(let error):
                self?.output?.didLoadDataWithError(error: error)
            }

        })
    }

}

// MARK: - AnalyticsTracker

extension StationsListInteractor {
}
