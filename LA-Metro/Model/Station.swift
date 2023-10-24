//
//  Station.swift
//  LA-Metro
//
//  Created by Francis Breidenbach on 10/23/23.
//

import Foundation
import RealmSwift

class Station: Object {
  @Persisted(primaryKey: true) var _id: String
}
