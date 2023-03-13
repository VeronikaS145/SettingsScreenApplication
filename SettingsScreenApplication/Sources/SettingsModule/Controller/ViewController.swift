//
//  ViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 01.02.2023.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var model: [[Cell]]?
    
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView()
        model = CellModel()
        
        configureView()
    }
}

// MARK: - Configurations

private extension ViewController {
    func configureView() {
        guard let models = model.createModels() else { return }
        mainView?.configureView(with: models)
    }
}
