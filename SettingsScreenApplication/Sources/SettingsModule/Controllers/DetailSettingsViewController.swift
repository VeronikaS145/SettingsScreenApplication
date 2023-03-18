//
//  DetailSettingsViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 18.03.2023.
//

import UIKit

class DetailSettingsViewController: UIViewController {
    
    var cells: Cell? {
        didSet {
            detailImage.image = UIImage(systemName: cells?.icon ?? "")
            detailTitle.text = cells?.title ?? ""
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var detailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var detailTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.backgroundColor  = .systemBackground
    }
    
    private func setupHierarchy() {
        view.addSubview(detailImage)
        view.addSubview(detailTitle)
    }
    
    private func setupLayout() {
        detailImage.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
            make.width.height.equalTo(250)
        }
        
        detailTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(16)
            make.centerX.equalTo(view)
        }
    }
}
