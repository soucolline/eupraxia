//
//  ChoiceRow.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct ChoiceRow: View {

    var text: String
    var icon: Image
    var feeling: ChoiceRepresentable

    var body: some View {
        HStack {
            Text(text)
                .font(.custom(K.Font.openSansSemiBold, size: 14))
                .foregroundColor(Color.darkPink)

            Spacer()

            HStack {
                icon
                Text(feeling.label)
                    .font(.custom(K.Font.openSansRegular, size: 14))
                    .foregroundColor(Color.choiceGrey)
            }

        }
        .padding(.horizontal, 28)
        .padding(.vertical, 26)
        .background(Color.white)
    }
}

struct ChoiceRow_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceRow(text: "How did you feel?", icon: Image(K.Icons.moodGood), feeling: Feeling.good)
    }
}
