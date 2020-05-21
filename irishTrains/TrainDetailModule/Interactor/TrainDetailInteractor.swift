//
//  TrainDetailInteractor.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

class TrainDetailInteractor {
    weak var output: TrainDetailInteractorOutput?
    private let webService: StationWebServicesProtocol

    init(webService: StationWebServicesProtocol) {
        self.webService = webService
    }
}

// MARK: - TrainDetailInteractorInteractorInput

extension TrainDetailInteractor: TrainDetailInteractorInput {
    func loadStation(trainName: String, date: String) {
        webService.getStationsForTrainName(trainName: trainName,
                                           date: date,
                                           completion: { [weak self] result in
                                               switch result {
                                               case .success(let trainsStation):
                                                self?.output?.didFetchTrainStations(trainStrations: trainsStation)
                                               case .failure(let error):
                                                  self?.output?.didLoadDataWithError(error: error)
                                               }

        })
    }
}
