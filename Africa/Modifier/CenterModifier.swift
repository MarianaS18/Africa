//
//  CenterModifier.swift
//  Africa
//
//  Created by Mariana Steblii on 15/04/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
