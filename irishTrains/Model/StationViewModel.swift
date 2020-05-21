//
//  StationViewModel.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct StationViewModel {
    let name: String
    let alias: String?
    let stationCode: String
    let id: Int

    init(station: Station) {
        name = station.name
        alias = station.alias
        stationCode = station.stationCode
        id = station.id
    }
}
