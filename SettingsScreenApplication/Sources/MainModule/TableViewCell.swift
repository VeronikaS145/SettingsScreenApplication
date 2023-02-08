//
//  TableViewCell.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 02.02.2023.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    var cells: Cell? {
        didSet {
            setupLayoutCell()
            changeColorBackgroundIcon()
            titleLabel.text = cells?.title ?? ""
            subtitleLabel.text = cells?.subtitle ?? ""
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupLayoutCell() {
        switch cells?.icon {
        case "user":
            icon.image = UIImage(named: cells?.icon ?? "")
            icon.clipsToBounds = true
            icon.layer.cornerRadius = 30
            
            titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
            subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            
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
        default:
            icon.image = UIImage(systemName: cells?.icon ?? "")
            icon.layer.cornerRadius = 5
            icon.tintColor = .white
            titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            subtitleLabel.textColor = .systemGray
            
            icon.snp.makeConstraints { make in
                make.centerY.equalTo(self)
                make.left.equalTo(self).offset(10)
                make.width.height.equalTo(30)
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
    }
    
    // MARK: - Pirivate methods
    
    private func changeColorBackgroundIcon() {
        switch cells?.icon {
        case "airplane":
            icon.backgroundColor = #colorLiteral(red: 1, green: 0.5709896088, blue: 0.01043915097, alpha: 1)
        case "wifi":
            icon.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "bolt.horizontal":
            icon.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "antenna.radiowaves.left.and.right":
            icon.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "personalhotspot":
            icon.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "bell.badge.fill":
            icon.backgroundColor = #colorLiteral(red: 1, green: 0.235381335, blue: 0.1873847842, alpha: 1)
        case "speaker.wave.3.fill":
            icon.backgroundColor = #colorLiteral(red: 1, green: 0.1730438173, blue: 0.3339608908, alpha: 1)
        case "moon.fill":
            icon.backgroundColor = #colorLiteral(red: 0.6855691671, green: 0.3212314248, blue: 0.8708348274, alpha: 1)
        case "hourglass":
            icon.backgroundColor = #colorLiteral(red: 0.6855691671, green: 0.3212314248, blue: 0.8708348274, alpha: 1)
        case "gear":
            icon.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case "switch.2":
            icon.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case "textformat.size":
            icon.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "":
            icon.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "figure.wave.circle":
            icon.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        case "soccerball.circle.fill.inverse":
            icon.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case "faceid":
            icon.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "sos":
            icon.backgroundColor = #colorLiteral(red: 1, green: 0.235381335, blue: 0.1873847842, alpha: 1)
        case "battery.75":
            icon.backgroundColor = #colorLiteral(red: 0.1500607431, green: 0.8031201363, blue: 0.2538867891, alpha: 1)
        case "hand.raised":
            icon.backgroundColor = #colorLiteral(red: 0, green: 0.4797462821, blue: 0.9981841445, alpha: 1)
        default: break
        }
    }
}
