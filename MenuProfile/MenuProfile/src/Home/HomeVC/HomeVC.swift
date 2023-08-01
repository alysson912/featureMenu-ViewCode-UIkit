//
//  ViewController.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//

import UIKit

class HomeVC: UIViewController {

    private var screen: HomeScreen?
    private let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetch(.request)
        
    }


}

extension HomeVC: MenuProfileViewModelDelegate {
    func success() {
        screen?.configTableView(delegate: self, dataSource: self)
        screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("deu ruim -> \(message)")
    }
    
    
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { // passa uma view para que ela seja uma setion
        
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tapSection), for: . touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: viewModel.titleForSection(section: section))
        view.expandButton(value: viewModel.containsSection(section))
        return view
    }
    
    @objc func tapSection(_ sender: UIButton){
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil // retira espaçamento da tableView
    }
}
