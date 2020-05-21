//
//  StationDetailsList.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation
struct StationDetailList: Decodable {
    let details: [StationDetail]
    enum CodingKeys: String, CodingKey {
        case details = "objStationData" // should be changed
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            details = try container.decode([StationDetail].self, forKey: .details)
        } catch let error {
            print(error)
            details = []
        }
    }
}
