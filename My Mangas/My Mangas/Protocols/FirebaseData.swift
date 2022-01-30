//
//  FirebaseData.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation

typealias FirebaseJSON = [String: Any]

protocol FirebaseData {
    init?(data: FirebaseJSON)
    func asFirebaseJSON() -> FirebaseJSON
}
