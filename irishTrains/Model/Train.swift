//
//  Train.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct Train: Codable {
    let trainCode: String?
    let trainDate: String?
    let trainStatus: String?
    let publicMessage: String?
    let direction: String?
    let locationOrder: String?
    let scheduledDeparture: String?
    let locationFullName: String?

    private enum CodingKeys: String, CodingKey {
        case trainCode = "TrainCode"
        case trainDate = "TrainDate"
        case trainStatus = "TrainStatus"
        case publicMessage = "PublicMessage"
        case direction = "Direction"
        case locationOrder = "LocationOrder"
        case scheduledDeparture = "ScheduledDeparture"
        case locationFullName = "LocationFullName"
    }
}
