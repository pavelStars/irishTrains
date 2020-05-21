//
//  StationsListViewOutput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol StationsListViewOutput {
    func viewIsReady()
    func loadStations()
    func didMakeSearchWithString(string: String, isFiltering: Bool)
    func didTap(stationViewModel: StationViewModel)
}
