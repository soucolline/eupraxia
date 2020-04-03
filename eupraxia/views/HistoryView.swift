//
//  HistoryView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0...10, id: \.self) { _ in
                    Text("Fake data")
                }
            }
            .navigationBarTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
