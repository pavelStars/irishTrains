//
//  StationsWebService.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 18.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation
import XMLParsing

private enum Constants {
    static let getAllStationsURL = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML"
    static let getAllTrainsForStation = "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByNameXML?StationDesc="
    static let getAllStatitionsForTrain = "http://api.irishrail.ie/realtime/realtime.asmx/getTrainMovementsXML?TrainId="
}

protocol StationWebServicesProtocol {
    func getStationWebServices(completion: @escaping (Result<[Station], Error>) -> Void)
    func getTrainsForStationDesc(stationDesc: String,
                                 completion: @escaping (Result<[StationDetail], Error>) -> Void)
    func getStationsForTrainName(trainName: String,
                                 date: String,
                                 completion: @escaping (Result<[Train], Error>) -> Void)
}

class StationWebService: NSObject, StationWebServicesProtocol {
    func getStationWebServices(completion: @escaping (Result<[Station], Error>) -> Void) {
        guard let url = URL(string: Constants.getAllStationsURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(_, let data):
                var stations: [Station] = []
                guard let stationList = try? XMLDecoder().decode(StationList.self, from: data) else {
                    return
                }
                stations = stationList.stations
                let result: Result = .wrapWebServiceResult(success: true,
                                                           result: stations,
                                                           error: nil)

                DispatchQueue.main.async {
                    completion(result)
                }

            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }.resume()
    }

    func getTrainsForStationDesc(stationDesc: String, completion: @escaping (Result<[StationDetail], Error>) -> Void) {
        let finalURL = Constants.getAllTrainsForStation + stationDesc
        guard let url = URL(string: finalURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(_, let data):
                var details: [StationDetail] = []
                guard let detailList = try? XMLDecoder().decode(StationDetailList.self, from: data) else {
                    return
                }
                details = detailList.details
                let result: Result = .wrapWebServiceResult(success: true,
                                                           result: details,
                                                           error: nil)

                DispatchQueue.main.async {
                    completion(result)
                }

            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }.resume()
    }

    func getStationsForTrainName(trainName: String,
                                 date: String,
                                 completion: @escaping (Result<[Train], Error>) -> Void) {
        let finalURL = Constants.getAllStatitionsForTrain + trainName + "&TrainDate=" + date
        guard let url = URL(string: finalURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(_, let data):
                var trains: [Train] = []
                guard let trainList = try? XMLDecoder().decode(TrainMovementList.self, from: data) else {
                    return
                }
                trains = trainList.trains
                let result: Result = .wrapWebServiceResult(success: true,
                                                           result: trains,
                                                           error: nil)

                DispatchQueue.main.async {
                    completion(result)
                }

            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }.resume()
    }
}

extension URLSession {
    func dataTask(with url: URL,
                  result: @escaping (Result<(URLResponse, Data),
                      Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { data, response, error in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
