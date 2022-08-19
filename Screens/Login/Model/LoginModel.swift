//
//  InfosModel.swift
//  testSantander
//
//  Created by Paulo Lazarini on 08/06/22.
//

import Foundation

struct User: Codable {
    let customerName: String
    let accountNumber: String
    let branchNumber: String
    let checkingAccountBalance: Int
    let id: String
}
