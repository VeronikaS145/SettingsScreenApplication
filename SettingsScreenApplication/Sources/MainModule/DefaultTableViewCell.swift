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
    
    var cells: Cell? {
        didSet {
            changeColorBackgroundIcon()
            icon.image = UIImage(systemName: cells?.icon ?? "")
            titleLabel.text = cells?.title ?? ""
            subtitleLabel.text = cells?.subtitle ?? ""
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var view: UIView = {
        let view = UIView()
        view.addSubview(icon)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
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
    
    private func changeColorBackgroundIcon() {
        switch cells?.icon {
        case "airplane":
            view.backgroundColor = #colorLiteral(red: 1, green: 0.5709896088, blue: 0.01043915097, alpha: 1)
        case "wifi":
            view.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "bolt.horizontal":
            view.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "antenna.radiowaves.left.and.right":
            view.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "personalhotspot":
            view.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "bell.badge.fill":
            view.backgroundColor = #colorLiteral(red: 1, green: 0.235381335, blue: 0.1873847842, alpha: 1)
        case "speaker.wave.3.fill":
            view.backgroundColor = #colorLiteral(red: 1, green: 0.1730438173, blue: 0.3339608908, alpha: 1)
        case "moon.fill":
            view.backgroundColor = #colorLiteral(red: 0.6855691671, green: 0.3212314248, blue: 0.8708348274, alpha: 1)
        case "hourglass":
            view.backgroundColor = #colorLiteral(red: 0.6855691671, green: 0.3212314248, blue: 0.8708348274, alpha: 1)
        case "gear":
            view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case "switch.2":
            view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case "textformat.size":
            view.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "":
            view.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "figure.wave.circle":
            view.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "soccerball.circle.fill.inverse":
            view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case "faceid":
            view.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "sos":
            view.backgroundColor = #colorLiteral(red: 1, green: 0.235381335, blue: 0.1873847842, alpha: 1)
        case "battery.75":
            view.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "hand.raised":
            view.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        default: break
        }
    }
}
