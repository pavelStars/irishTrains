//
//  Station.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 18.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct Station: Codable {
    let name: String
    let alias: String?
    let stationCode: String
    let id: Int

    var displayName: String {
        return alias ?? name
    }

    private enum CodingKeys: String, CodingKey {
        case name = "StationDesc"
        case alias = "StationAlias"
        case stationCode = "StationCode"
        case id = "StationId"
    }
}
