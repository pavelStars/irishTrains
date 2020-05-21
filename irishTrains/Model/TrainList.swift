//
//  TrainList.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation
struct TrainList: Decodable {
    let trains: [Train]
    enum CodingKeys: String, CodingKey {
        case trains = "objTrainPositions" // should be changed
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            trains = try container.decode([Train].self, forKey: .trains)
        } catch let error {
            print(error)
            trains = []
        }
    }
}
