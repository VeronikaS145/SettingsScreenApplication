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
        view.backgroundColor  = #colorLiteral(red: 0.9499780536, green: 0.9505755305, blue: 0.9688754678, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBar
        model = Cell.cells
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
        switch model?[indexPath.section] {
        case model?[0]:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.cells = model?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell
            cell?.cells = model?[indexPath.section][indexPath.row]
            
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailView = DetailViewController()
        detailView.cells = model?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
}
