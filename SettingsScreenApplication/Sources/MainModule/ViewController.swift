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
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Поиск"
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
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
        
        hideKeyboard()
        setIconTextField()
    }
    
    // MARK: - Setups
    private func setupView() {
        title = "Настройки"
        view.backgroundColor  = #colorLiteral(red: 0.9499780536, green: 0.9505755305, blue: 0.9688754678, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        model = Cell.cells
        hideKeyboard()
        setIconTextField()
    }
    
    private func setupHierarchy() {
        view.addSubview(textField)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
            make.width.equalTo(350)
            make.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(1)
            make.bottom.left.right.equalTo(view)
        }
    }
    
    // MARK: - Private functions
    
    private func setIconTextField() {
        if let textFieldIcon = UIImage(systemName: "magnifyingglass") {
            textField.setLeftIcon(textFieldIcon)
        }
    }
    
    // MARK: - Actions
    
    // Hide keyboard using a tap gesture
    @objc func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        self.view.endEditing(true)
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
        let detailView = DetailViewController()
        detailView.cells = model?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
}

