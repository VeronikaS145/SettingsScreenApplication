//
//  ViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 01.02.2023.
//
import UIKit

class SettingsView: UIView {
    
    weak var delegate: SettingsViewControllerDelegate?
    
    func configureView(with models: [[Cell]]) {
        self.models = models
    }
    
    private var models = [[Cell]]()
    
    // MARK: - UI Elements
    
    lazy var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        search.obscuresBackgroundDuringPresentation = true
        search.searchBar.autocapitalizationType = .words
        search.searchBar.layer.cornerRadius = 5
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.identifier)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

// MARK: - Extensions
extension SettingsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if models[indexPath.section] == models[0] { return 80 } else { return 40 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case models[0]:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.configure(with: models[indexPath.section][indexPath.row])
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell
            cell?.configure(with: models[indexPath.section][indexPath.row])
            
            switch models[indexPath.section][indexPath.row].icon {
            case "airplane":
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                cell?.accessoryView = switchView
            default:
                cell?.accessoryType = .disclosureIndicator
            }
            
            return cell ?? UITableViewCell()
        }
    }
}

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.showDetails(cell: models[indexPath.section][indexPath.row])
    }
}
