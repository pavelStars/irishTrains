//
//  StationDetail.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct StationDetail: Codable {
    let serverTime: String?
    let trainCode: String?
    let stationfullname: String?
    let stationCode: String?
    let queryTime: String?
    let trainDate: String?
    let origin: String?
    let originTime: String?
    let destination: String?
    let destinationTime: String?
    let status: String?
    let lastLocation: String?
    let dueIn: Int?
    let late: Int?
    let exparrival: String?
    let expdepart: String?
    let scharrival: String?
    let direction: String?
    let trainType: String?
    let locationType: String?

    private enum CodingKeys: String, CodingKey {
        case serverTime = "Servertime"
        case trainCode = "Traincode"
        case stationfullname = "Stationfullname"
        case stationCode = "StationCode"
        case queryTime = "Querytime"
        case trainDate = "Traindate"
        case origin = "Origin"
        case originTime = "Origintime"
        case destination = "Destination"
        case destinationTime = "Destinationtime"
        case status = "Status"
        case lastLocation = "Lastlocation"
        case dueIn = "Duein"
        case late = "Late"
        case exparrival = "Exparrival"
        case expdepart = "Expdepart"
        case scharrival = "Scharrival"
        case direction = "Direction"
        case trainType = "Traintype"
        case locationType = "Locationtype"
    }
}
