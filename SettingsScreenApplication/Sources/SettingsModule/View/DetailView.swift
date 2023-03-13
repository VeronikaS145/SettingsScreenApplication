//
//  DetailViewController.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 03.02.2023.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - Configuration
    
    private var models = [[Cell]]()
    
    func configureDetailView(with models: [[Cell]]) {
        self.models = models
        detailTitle.text = cells?.title
        detailImage.image = UIImage(named: cells?.icon)
    }
    
    // MARK: - UI Elements
    
    var cells: Cell? {
        didSet {
            detailImage.image = UIImage(systemName: cells?.icon ?? "")
            detailTitle.text = cells?.title ?? ""
        }
    }
    
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
        backgroundColor  = .systemBackground
    }
    
    private func setupHierarchy() {
        addSubview(detailImage)
        addSubview(detailTitle)
    }
    
    private func setupLayout() {
        detailImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 250)

        detailTitle.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 16)
        detailTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
