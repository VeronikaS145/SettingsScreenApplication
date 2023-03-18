//
//  ViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 18.03.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func showDetails(cell: Cell)
}

class SettingsViewController: UIViewController, SettingsViewControllerDelegate {
    
    var model: SettingsModel?
    
    private var mainView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = mainView?.searchBar
        view.backgroundColor  = .systemGray4
        
        view = SettingsView()
        model = SettingsModel()
        
        configureView()
    }
    
    // MARK: - Actions
    
    func showDetails(cell: Cell) {
        let detailViewController = DetailSettingsViewController()
        detailViewController.cells = cell
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
// MARK: - Configurations

extension SettingsViewController {
    func configureView() {
        
        guard let models = model?.createModel else { return }
        
        mainView?.configureView(with: models)
        mainView?.delegate = self
    }
}
