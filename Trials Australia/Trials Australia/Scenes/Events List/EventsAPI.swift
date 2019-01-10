//
//  EventsAPI.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation
import Alamofire

class EventsAPI {
    static func getEventsList(url: URL, completion: @escaping ((_ data: EventListResponse?, _ error: TrialsError?) -> Void)) {
        Alamofire.request(url).response { response in
            if nil != response.error {
                completion(nil, TrialsError.dataError)
                return
            }

            guard let httpResponse = response.response, httpResponse.statusCode >= 200, httpResponse.statusCode < 400 else {
                completion(nil, TrialsError.networkError)
                return
            }

            guard let data = response.data else {
                completion(nil, TrialsError.dataError)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(EventListResponse.self, from: data)
                completion(response, nil)
            } catch {
                completion(nil, TrialsError.dataError)
            }
        }
    }

    static func getEventsDetail(url: URL, completion: @escaping ((_ data: EventDetailResponse?, _ error: TrialsError?) -> Void)) {
        Alamofire.request(url).response { response in

            if nil != response.error {
                completion(nil, TrialsError.dataError)
                return
            }

            guard let httpResponse = response.response, httpResponse.statusCode >= 200, httpResponse.statusCode < 400 else {
                completion(nil, TrialsError.networkError)
                return
            }

            guard let data = response.data else {
                completion(nil, TrialsError.dataError)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(EventDetailResponse.self, from: data)
                completion(response, nil)
            } catch let error {
                completion(nil, TrialsError.dataError)
            }
        }
    }

}
