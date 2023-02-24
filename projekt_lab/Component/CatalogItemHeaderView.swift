//
//  CatalogItemHeaderView.swift
//  projekt_lab
//
//  Created by MarcinMB on 14/05/2022.
//

import SwiftUI

struct CatalogItemHeaderView: View {
    var item: CatalogItem
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Image(item.itemImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height: 510, alignment: .center)
                .clipped()
                .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
                .blur(radius: 4)
                .opacity(0.7)
            Image(item.itemImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .center)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
                .padding(40)
                .padding(.top, 90)
                .scaleEffect(isAnimating ? 1.0 : 0.2)
        }   .frame(height: 480)
            .onAppear() {
                withAnimation(.easeInOut(duration: 0.8)) {
                    isAnimating = true
                }
            }
    }
}

struct CatalogItemHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemHeaderView(item: catalogItems_fruits[5])
    }
}
