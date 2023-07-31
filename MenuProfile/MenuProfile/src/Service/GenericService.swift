//
//  GenericService.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//

import UIKit
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String, Swift.Error)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}
 
