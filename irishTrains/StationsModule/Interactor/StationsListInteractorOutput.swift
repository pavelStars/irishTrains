//
//  StationsListInteractorOutput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol StationsListInteractorOutput: class {
    func didFetchStations(stations: [Station])
    func didLoadDataWithError(error: Error)
}
