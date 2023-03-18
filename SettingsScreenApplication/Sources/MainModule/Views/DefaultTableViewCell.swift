//
//  TableViewCell.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 02.02.2023.
//

import UIKit
import SnapKit

class DefaultTableViewCell: UITableViewCell {
    
    static let identifier = "DefaultTableViewCell"
    
    func configure(with model: Cell) {
        icon.image = UIImage(named: model.icon)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        
        
    }
    
    // MARK: - UI Elements
    
    private lazy var view: UIView = {
        let view = UIView()
        view.addSubview(icon)
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func prepareForReuse() {
        accessoryView = nil
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(icon)
        addSubview(view)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        view.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(35)
        }
        
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(14)
            make.width.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(icon.snp.right).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-40)
        }
    }
    
    // MARK: - Pirivate methods
    
    private func changeColorBackgroundIcon(model: Cell) {
        switch model.icon {
        case "airplane":
            view.backgroundColor = .systemOrange
        case "wifi":
            view.backgroundColor = .systemBlue
        case "bolt.horizontal":
            view.backgroundColor = .systemBlue
        case "antenna.radiowaves.left.and.right":
            view.backgroundColor = .systemGreen
        case "personalhotspot":
            view.backgroundColor = .systemGreen
        case "bell.badge.fill":
            view.backgroundColor = .systemPink
        case "speaker.wave.3.fill":
            view.backgroundColor = .systemRed
        case "moon.fill":
            view.backgroundColor = .systemPurple
        case "hourglass":
            view.backgroundColor = .systemPurple
        case "gear":
            view.backgroundColor = .systemGray2
        case "switch.2":
            view.backgroundColor = .systemGray2
        case "textformat.size":
            view.backgroundColor = .systemBlue
        case "figure.wave.circle":
            view.backgroundColor = .systemBlue
        case "soccerball.circle.fill.inverse":
            view.backgroundColor = .systemCyan
        case "faceid":
            view.backgroundColor = .systemGreen
        case "sos":
            view.backgroundColor = .systemRed
        case "battery.75":
            view.backgroundColor = .systemGreen
        case "hand.raised":
            view.backgroundColor = .systemBlue
        default: break
        }
    }
}
