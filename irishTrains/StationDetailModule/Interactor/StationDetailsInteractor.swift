//
//  StationDetailsInteractor.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

class StationDetailsInteractor {
    weak var output: StationDetailsInteractorOutput?
    private let webService: StationWebServicesProtocol

     init(webService: StationWebServicesProtocol) {
           self.webService = webService
    }
}

// MARK: - StationDetailsInteractorInteractorInput

extension StationDetailsInteractor: StationDetailsInteractorInput {

    func loadStations(stationDesct: String) {
        webService.getTrainsForStationDesc(stationDesc: stationDesct, completion: { [weak self] result in
            switch result {
            case .success(let details):
                self?.output?.didFetchTrains(trains: details)
            case .failure(let error):
                self?.output?.didLoadDataWithError(error: error)
            }
        })
    }
}

// MARK: - AnalyticsTracker

extension StationDetailsInteractor {
}
