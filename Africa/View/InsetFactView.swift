//
//  InsetFactView.swift
//  Africa
//
//  Created by Mariana Steblii on 11/04/2021.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    
    // MARK: - PROPERTIES

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        } //: GROUPBOX
    }
}

    // MARK: - PREVIEW

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetFactView(animal: animals[0])
            .padding(.all)
            .previewLayout(.sizeThatFits)
    }
}
