//
//  PainView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 05/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct PainView: View {
    var text: String
    var isEnabled = false

    var body: some View {
        ZStack {
            VStack {
                Image(isEnabled ? K.Icons.done : K.Icons.error)

                Text(text)
                    .lineLimit(1)
                    .foregroundColor(isEnabled ? Color.text : Color.white)
                    .font(.custom(K.Font.openSansSemiBold, size: 12))
            }
            .frame(width: 71, height: 60)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isEnabled ? Color.border : Color.clear, lineWidth: 2)
            )
        }
        .background(isEnabled ? Color.white : Color.buttonSalmon)
        .cornerRadius(12)

    }
}

struct PainView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PainView(text: "No pain", isEnabled: true)
            PainView(text: "Pain", isEnabled: false)
        }
    }
}
