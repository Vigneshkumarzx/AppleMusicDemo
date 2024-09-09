//
//  SearchView.swift
//  AppleMusicDemo
//
//  Created by vignesh kumar c on 08/09/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var search = ""
    
    var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                HStack {
                    Text("Search")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                    
                    TextField("Search", text: $search )
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(15)
                
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(1...10, id: \.self) { index in
                        
                        Image("i\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                            .cornerRadius(15)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .padding(.bottom, 80)
        }
    }
}

