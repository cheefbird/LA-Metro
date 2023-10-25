//
//  Stop.swift
//  LA-Metro
//
//  Created by Francis Breidenbach on 10/24/23.
//

import Foundation

struct Stop {
  
  var id: String
  var name: String
  var code: Int
  var latitude: Double
  var longitude: Double
  var destinations: [Destination]?
  
}
