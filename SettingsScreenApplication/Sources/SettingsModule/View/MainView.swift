//
//  MainView.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 13.03.2023.
//

import UIKit

class MainView: UIView {

    // MARK: - Configuration
    
    private var models = [[Cell]]()
    
    func configureMainView(with models: [[Cell]]) {
        self.models = models
        tableView.reloadData()
    }
    
    // MARK: - UI Elements
    
    private lazy var searchBar: UISearchController = {
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

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Настройки"
        backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBar
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(-20) // ?
            make.bottom.left.right.equalTo(view)
        }
    }
}

// MARK: - UITableViewDataSource

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if models?[indexPath.section] == models?[0] { return 80 } else { return 40 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models?[indexPath.section] {
        case models?[0]:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.cells = models?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell
            cell?.cells = models?[indexPath.section][indexPath.row]
            
            switch cell?.cells?.icon {
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

// MARK: - UITableViewDelegate

extension MainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailView = DetailView()
        detailView.cells = models?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
}
