//
//  MetroNetRouter.swift
//  LA-Metro
//
//  Created by Francis Breidenbach on 10/25/23.
//

import Foundation
import Alamofire

enum MetroNetRouter: URLRequestConvertible {
  
  case getRoutes,
       getStopsForRoute(Int)
  
  var baseURL: URL {
    return URL(string: "https://api.goswift.ly")!
  }
  
  var method: HTTPMethod { return .get }
  
  var headers: HTTPHeaders {
    return [
      "Authorization": "e9eec1ee6c480a4fc4a56db769ba1033",
      "Accept": "application/json"
    ]
  }
  
  var path: String {
    switch self {
    case .getRoutes, .getStopsForRoute:
      return "info/lametro-rail/routes"
      //    case .getStopsForRoute(let int):
      //      return "info"
    }
  }
  
  var parameters: Parameters? {
    switch self {
    case .getRoutes:
      return nil
    case .getStopsForRoute(let routeId):
      return ["verbose": "true", "route": "\(routeId)"]
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = baseURL.appendingPathComponent(path)
    var request = try URLRequest(url: url, method: method, headers: headers)
    
    if let params = parameters {
      try request = URLEncoding().encode(request, with: params)
    }
    
    return request
  }
}
