//
//  MenuProfile.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//


import Foundation

// MARK: - MenuProfile
struct MenuProfileGroup: Codable {
    var group: [MenuProfile ]?
}

// MARK: - MenuProfileGroup
struct MenuProfile: Codable {
    var title: String?
    var child: [Item]?
}

// MARK: - Child
struct Item: Codable {
    var title: String?
}
