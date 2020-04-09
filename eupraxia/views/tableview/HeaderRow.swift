//
//  HeaderRow.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct HeaderRow: View {

    var text: String

    var body: some View {
        HStack {
            Text(text)
                .font(.custom(K.Font.openSansSemiBold, size: 14))
                .foregroundColor(Color.darkPink)

            Spacer()
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 19)
        .background(Color.background)

    }
}

struct HeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        HeaderRow(text: "Header")
    }
}
