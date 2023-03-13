//
//  CellModel.swift
//  SettingsScreenApplication
//
//  Created by Nika Semenkova on 13.03.2023.
//

import Foundation

final class CellModel {
    
    func createModels() -> [[Cell]] {
        return [Cell(title: "Veronika Semenkova", subtitle: "AppleID, iCloud+, контент и покупки", icon: "user")],
        
        [Cell(title: "Авиарежим", icon: "airplane"),
         Cell(title: "Wi-Fi", subtitle: "Выкл.", icon: "wifi"),
         Cell(title: "Bluetooth", subtitle: "Вкл.", icon: "bolt.horizontal"),
         Cell(title: "Сотовая связь", icon: "antenna.radiowaves.left.and.right"),
         Cell(title: "Режим модема", subtitle: "Вкл.", icon: "personalhotspot")],
        
        [Cell(title: "Уведомления", icon: "bell.badge.fill"),
         Cell(title: "Звуки, тактильные сигналы", icon: "speaker.wave.3.fill"),
         Cell(title: "Фокусирование", icon: "moon.fill"),
         Cell(title: "Экранное время", icon: "hourglass")],
        
        [Cell(title: "Основные", icon: "gear"),
         Cell(title: "Пункт управления", icon: "switch.2"),
         Cell(title: "Экран и яркость", icon: "textformat.size"),
         Cell(title: "Универсальный доступ", icon: "figure.wave.circle"),
         Cell(title: "Обои", icon: "soccerball.circle.fill.inverse"),
         Cell(title: "Face ID и код-пароль", icon: "faceid"),
         Cell(title: "Экстренный вызов - SOS", icon: "sos"),
         Cell(title: "Аккумулятор", icon: "battery.75"),
         Cell(title: "Конфиденциальность и безопасность", icon: "hand.raised")]
    }
}
