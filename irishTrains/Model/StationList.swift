//
//  StationArrayObject.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct StationList: Decodable {
    let stations: [Station]
    enum CodingKeys: String, CodingKey {
        case stations = "objStation"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            stations = try container.decode([Station].self, forKey: .stations)
        } catch let error {
            print(error)
            stations = []
        }
    }
}
