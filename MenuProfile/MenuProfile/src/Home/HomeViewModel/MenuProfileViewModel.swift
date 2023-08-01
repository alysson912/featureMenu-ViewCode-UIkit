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
enum TypeHiddenSection {
    case remove
    case insert
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
                    self.hiddenAllSection()
                    self.delegate?.success()
                }else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.hiddenAllSection()
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
    
    public func numberOfRowsInSection(section: Int) -> Int{
        if containsSection(section){
            return 0
        } else {
           return childCount(section)
        }
    }
    
    public func containsSection(_ section: Int) -> Bool{
        return hiddenSection.contains(section)
    }
    
    public func tappedSection(type: TypeHiddenSection, section: Int){
        if type == .insert {
            hiddenSection.insert(section)
        } else {
            hiddenSection.remove(section)
        }
    }
    
    public func indexPathForSection(_ section: Int) -> [IndexPath]{
        var indexPath = [IndexPath]()
        let size = childCount(section)
        for row in 0..<size {
            indexPath.append(IndexPath(row: row, section: section))
        }
        return indexPath
    }
    
    private func childCount(_ section: Int) -> Int {
        return data[section].child?.count ?? 0
    }
    
    private func hiddenAllSection() {
        let size = numberOfSections
        for indexMenu in 0..<size {
            hiddenSection.insert(indexMenu)
        }
    }
}
 
