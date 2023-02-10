//
//  UserTableViewCell.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 09.02.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    
    var cells: Cell? {
        didSet {
            icon.image = UIImage(named: cells?.icon ?? "")
            titleLabel.text = cells?.title ?? ""
            subtitleLabel.text = cells?.subtitle ?? ""
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(icon)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.width.equalTo(230)
            make.height.equalTo(50)
            make.bottom.equalTo(self).offset(-3)
            make.left.equalTo(icon.snp.right).offset(15)
        }
    }
}
