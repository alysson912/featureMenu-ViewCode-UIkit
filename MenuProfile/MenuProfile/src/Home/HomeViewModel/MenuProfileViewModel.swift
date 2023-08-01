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

protocol MenuProfileViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    private var hiddenSection = Set<Int>()
    
    
    public func delegate(delegate: MenuProfileViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.delegate?.success()
                }else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.delegate?.success()
                }else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfSections: Int {
        return data.count
    }
    public func titleForSection(section: Int) -> String {
        return data[section].title ?? ""
    }
    
    public var numberOfRowsInSection: Int {
        return 0
    }
    
    public func containsSection(_ section: Int) -> Bool{
        return hiddenSection.contains(section)
    }
}
