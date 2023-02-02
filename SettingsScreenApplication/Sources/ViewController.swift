//
//  ViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 01.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var model = [[CommonTable]]()
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupView() {
        title = "Настройки"
        view.backgroundColor  = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.left.right.equalTo(view)
        }
    }
}

// MARK: - Extensions

//extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        model.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = ""
//        return cell
//    }
//}
//
//extension ViewController: UITableViewDelegate {
//    
//}

