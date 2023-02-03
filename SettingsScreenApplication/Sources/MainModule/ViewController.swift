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
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
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
        view.backgroundColor  = UIColor(red: 242, green: 242, blue: 247, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        model = Cell.cells
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

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if model?[indexPath.section] == model?[0] { return 80 } else { return 40 }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?[section].count ?? 0
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.cells = model?[indexPath.section][indexPath.row]
                
        if cell?.cells?.title == "Авиарежим" {
            let toggle = UISwitch(frame: .zero)
            toggle.setOn(false, animated: true)
            cell?.accessoryView = toggle
        } else {
            cell?.accessoryType = .disclosureIndicator
        }
        
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

