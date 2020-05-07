//
//  SettingsView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var viewModel: SettingsViewModel

    @State private var showImportView = false
    @State private var showExportView = false

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

                Section(header: Text("Import / export")) {
                    Button(action: {
                        self.showImportView.toggle()
                    }, label: {
                        Text("Import data")
                    })
                    .sheet(isPresented: $showImportView) {
                        ImportView(
                            viewModel: ImportViewModel(
                                with: ImportManager(
                                    with: SurveysRepositoryImpl(with: self.context)
                                )
                            )
                        )
                    }

                    Button(action: {
                        self.showExportView.toggle()
                    }, label: {
                        Text("Export data")
                    })
                    .sheet(isPresented: $showExportView) {
                        ExportView(viewModel: ExportViewModel(with: SurveysRepositoryImpl(with: self.context)))
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
            SettingsView(
                viewModel: SettingsViewModel(with: NotificationsManager(with: UNUserNotificationCenter.current()))
            )
        }
    }
}
