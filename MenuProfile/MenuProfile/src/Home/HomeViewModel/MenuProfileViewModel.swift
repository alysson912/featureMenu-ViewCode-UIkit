//
//  MenuProfileViewModel.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel {

  private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                print(success)
            }
        case .request:
            self.service.getMenu { success, error in
                print(success)
            }
        }
    }
}
