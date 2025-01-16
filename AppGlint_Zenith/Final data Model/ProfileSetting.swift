//
//  ProfileSetting.swift
//  AppGlint_Zenith
//
//  Created by Devanshu Singh(chitkara)     on 23/12/24.
//

import Foundation
struct SettingsItem {
    let icon: String  // SF Symbol name
    let title: String
    let hasDisclosure: Bool
    let hasMessengerIcon: Bool
}

// Settings data
var settingsItems: [[SettingsItem]] = [
    [
        SettingsItem(icon: "person.circle", title: "Aditya Sharma", hasDisclosure: true, hasMessengerIcon: false)
    ],
    [
        SettingsItem(icon: "brain", title: "Autism category survey", hasDisclosure: true, hasMessengerIcon: false),
        SettingsItem(icon: "gearshape", title: "Settings", hasDisclosure: true, hasMessengerIcon: false)
    ],
    [
        SettingsItem(icon: "person.2", title: "About us", hasDisclosure: true, hasMessengerIcon: false),
        SettingsItem(icon: "lock", title: "Privacy", hasDisclosure: true, hasMessengerIcon: false),
        SettingsItem(icon: "questionmark.circle", title: "Help", hasDisclosure: true, hasMessengerIcon: false),
        SettingsItem(icon: "person.badge.plus", title: "Invite Friends", hasDisclosure: true, hasMessengerIcon: false)
    ]
]
