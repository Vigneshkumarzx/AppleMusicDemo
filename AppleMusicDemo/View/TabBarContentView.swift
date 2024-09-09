//
//  TabBarContentView.swift
//  AppleMusicDemo
//
//  Created by vignesh kumar c on 08/09/24.
//

import SwiftUI

struct TabBarContentView: View {
    @State var current = 2
    
    @State var isExpand: Bool = false
    
    @Namespace var animation
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current) {
                Text("Library")
                    .tag(0)
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        
                        Text("Library")
                    }
                
                Text("Radio")
                    .tag(1)
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        
                        Text("Radio")
                    }
                
                SearchView()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        
                        Text("Search")
                    }
            }
            
            MiniPlayerView(animation: animation, isExpand: $isExpand)
        })
    }
}

#Preview {
    TabBarContentView()
}
