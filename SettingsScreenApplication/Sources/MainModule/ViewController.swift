//
//  ViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 18.03.2023.
//

import UIKit

    protocol ViewControllerDelegate: AnyObject {}

    // Подписать Контроллер под протокол делегата
    class ViewController: UIViewController, ViewControllerDelegate {
        
        var model: CellModel?

        private var tableView: MainView? {
            guard isViewLoaded else { return nil }
            return view as? MainView
        }

        // MARK: - Lifecycle

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Setings"
            navigationController?.navigationBar.prefersLargeTitles = true
            view.backgroundColor  = .systemGray4
            
            view = MainView()
            model = CellModel()
            
            configureView()
        }
    }

    // MARK: - Configurations
     extension ViewController {
        func configureView() {
            
            guard let models = model?.createModel else { return }
            
            tableView?.configureView(with: models)
            tableView?.delegate = self
        }
    }
