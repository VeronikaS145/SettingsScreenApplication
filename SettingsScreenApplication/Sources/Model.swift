//
//  Model.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 01.02.2023.
//

import Foundation

struct CommonTable: Hashable {
    var title: String
    var subtitle: String?
    var icon: String
    var `switch`: Bool?
}

class SettingsScreenModel {
    var model: [[CommonTable]] = [
        [CommonTable(title: "Veronika Semenkova", subtitle: "AppleID, iCloud+, контент и покупки", icon: "user")],
        
        [CommonTable(title: "Авиарежим", icon: "airplane"),
         CommonTable(title: "Wi-Fi", subtitle: "Выкл.", icon: "wifi"),
         CommonTable(title: "Bluetooth", subtitle: "Вкл.", icon: "bluetooth"),
         CommonTable(title: "Сотовая связь", icon: "antenna.radiowaves.left.and.right"),
         CommonTable(title: "Режим модема", subtitle: "Вкл.", icon: "personalhotspot"),
         CommonTable(title: "VPN", subtitle: "Не подключен", icon: "vpn")],
        
        [CommonTable(title: "Уведомления", icon: "bell.badge.fill"),
         CommonTable(title: "Звуки, тактильные сигналы", icon: "speaker.wave.3.fill"),
         CommonTable(title: "Фокусирование", icon: "moon.fill"),
         CommonTable(title: "Экранное время", icon: "hourglass")]
    ]
}

