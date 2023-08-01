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
        screen?.configTableView(delegate: self, dataSource: self)
    }


}

extension HomeVC: MenuProfileViewModelDelegate {
    func success() {
        print("deu bom")
    }
    
    func error(_ message: String) {
        print("deu ruim -> \(message)")
    }
    
    
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
