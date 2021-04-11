//
//  InsetGallaryView.swift
//  Africa
//
//  Created by Mariana Steblii on 11/04/2021.
//

import SwiftUI

struct InsetGallaryView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: LOOP
            } //: HSTACK
        } //: SCROLL
    }
}

    // MARK: - PREVIEW

struct InsetGallaryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGallaryView(animal: animals[0])
            .padding(.all)
            .previewLayout(.sizeThatFits)
    }
}
