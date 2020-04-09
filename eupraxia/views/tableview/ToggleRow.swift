//
//  ToggleRow.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct ToggleRow: View {

    @ObservedObject var viewModel: ToggleRowViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.text)
                    .font(.custom(K.Font.openSansSemiBold, size: 14))
                    .foregroundColor(Color.darkPink)

                if viewModel.details != nil {
                    Text(viewModel.details ?? "")
                        .font(.custom(K.Font.openSansRegular, size: 14))
                        .foregroundColor(Color.choiceGrey)
                }
            }

            Spacer()

            Toggle(isOn: $viewModel.isToggleOn) {
                EmptyView()
            }
            .hueRotation(Angle.degrees(220))
            .layoutPriority(-1)

        }
        .padding(.horizontal, 28)
        .padding(.vertical, 26)
        .background(Color.white)
    }
}

struct ToggleRow_Previews: PreviewProvider {
    static var previews: some View {
        ToggleRow(viewModel: ToggleRowViewModel(text: "Did you have sex today?", details: "Cereals", value: true))
    }
}
