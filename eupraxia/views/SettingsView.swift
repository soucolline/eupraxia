//
//  SettingsView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("App")) {
                    Toggle(isOn: $viewModel.hasEnabledNotifications.animation()) {
                        Text("Enable notifications")
                    }

                    if viewModel.hasEnabledNotifications {
                        DatePicker(selection: $viewModel.notificationTriggerTime, displayedComponents: .hourAndMinute) {
                            Text("Notification time")
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
            .listStyle(GroupedListStyle())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(viewModel: SettingsViewModel())
        }
    }
}
