//
//  UITextField + Ex.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 03.02.2023.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        iconView.tintColor = #colorLiteral(red: 0.6394177079, green: 0.6397551894, blue: 0.6501116157, alpha: 1)
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
