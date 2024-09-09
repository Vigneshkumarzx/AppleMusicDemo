//
//  MiniPlayerView.swift
//  AppleMusicDemo
//
//  Created by vignesh kumar c on 08/09/24.
//

import SwiftUI
import UIKit

struct MiniPlayerView: View {
    var animation: Namespace.ID
    @Binding var isExpand: Bool
    var height = UIScreen.main.bounds.height / 3
    
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var volume: CGFloat = 0
    @State var offSet: CGFloat = 0
    
    var body: some View {
        VStack {
            
            Capsule()
                .fill(Color.gray)
                .frame(width: isExpand ? 60 : 0, height: isExpand ? 4 : 0)
                .opacity(isExpand ? 1 : 0)
                .padding(.top, isExpand ? safeArea?.top : 0)
                .padding(.vertical, isExpand ? 30 : 0)
            HStack(spacing: 15) {
                // centering Image
                if isExpand {Spacer(minLength: 0)}
                Image("i2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: isExpand ?  height : 55, height: isExpand ? height : 55)
                    .cornerRadius(15)
                if !isExpand {
                        Text("Vilambara Idaiveli")
                            .font(.title2)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !isExpand {
                    Button {
                        
                    } label: {
                        Image(systemName: "play.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }

            }
            .padding(.horizontal)
            
            VStack(spacing: 15) {
                Spacer(minLength: 0)
                HStack {
                    if isExpand {
                        Text("Vilambara Idaiveli")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                }
                .padding()
                .padding(.top, 20)
                
                // live
                
                HStack {
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                        ).frame(height: 4)
                    
                    Text("Live")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.1), Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                        ).frame(height: 4)
                            
                }
                .padding()

                Button {
                    
                } label: {
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }

                Spacer(minLength: 0)
                
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    
                    Slider(value: $volume)
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: 22) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }

                    Button {
                        
                    } label: {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
                
            }
            .frame(width: isExpand ? nil : 0, height: isExpand ? nil : 0)
            .opacity(isExpand ? 1 : 0)
            
        }
        .frame(maxHeight: isExpand ? .infinity : 80)
        .background(
            VStack(spacing: 0) {
                BlurView()
                Divider()
            }
                .onTapGesture(perform: {
                    withAnimation(.spring) {
                        isExpand.toggle()
                    }
                })
            
            )
        .cornerRadius(isExpand ? 15 : 0)
        .offset(y: isExpand ? 0 : -48)
        .offset(y: offSet)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && isExpand {
            offSet = value.translation.height
        }
        
    }
    
    func onEnded(value: DragGesture.Value) {
    
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            
            if value.translation.height > height {
                isExpand = false
            }
            offSet = 0
        }
    }
}


/*
 VStack {
     
     Capsule()
         .fill(Color.gray)
         .frame(width: isExpand ? 60 : 0, height: isExpand ? 4 : 0)
         .opacity(isExpand ? 1 : 0)
         .padding(.top, isExpand ? safeArea?.top : 0)
         .padding(.vertical, isExpand ? 30 : 0)
     

     HStack(spacing: 15) {
         
         if isExpand { Spacer(minLength: 0)}
         
         Image("i2")
             .resizable()
             .aspectRatio(contentMode: .fill)
             .frame(width: isExpand ? height : 55, height: isExpand ? height : 55)
             .cornerRadius(15)
         
         if !isExpand {
             Text("Urvasi Urvasi")
                 .font(.title2)
                 .fontWeight(.bold)
                 .matchedGeometryEffect(id: "Label", in: animation)
         }
         
         Spacer(minLength: 0)
         
         if !isExpand {
             Button {
                 
             } label: {
                 Image(systemName: "play.fill")
                     .font(.title2)
                     .foregroundColor(.red)
             }
             
             Button {
                 
             } label: {
                 Image(systemName: "forward.fill")
                     .font(.title2)
                     .foregroundColor(.red)
             }
             
         }
     }
     .padding(.horizontal)
     
     VStack(spacing: 15) {
       
         //  Spacer(minLength: 0)
         
         HStack {
             if isExpand {
                 Text("Urvasi Urvasi")
                     .font(.title2)
                     .foregroundColor(.primary)
                     .fontWeight(.bold)
                     .matchedGeometryEffect(id: "Label", in: animation)
             }
             
             Spacer(minLength: 0)
             
             Button(action: {
                 
             }, label: {
                 Image(systemName: "ellipsis.circle")
                     .font(.title2)
                     .foregroundColor(.primary)
             })
         }
         .padding()
         .padding(.top, 20)
         
         HStack {
             Capsule()
                 .fill(
                     LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                 ).frame(height: 4)
             
             Text("Live")
                 .fontWeight(.bold)
                 .foregroundColor(.primary)
             
             Capsule()
                 .fill(
                     LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.1), Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                 ).frame(height: 4)
                     
         }
         .padding()
         
         Button {
             
         } label: {
             Image(systemName: "stop.fill")
                 .font(.largeTitle)
                 .foregroundColor(.primary)
         }

         
         Spacer(minLength: 0)
         
         HStack(spacing: 15) {
             Image(systemName: "speaker.fill")
             
             Slider(value: $volume)
             Image(systemName: "speaker.wave.2.fill")
         }
         .padding()
         
         HStack(spacing: 22) {
             Button {
                 
             } label: {
                 Image(systemName: "arrow.up.message")
                     .font(.title2)
                     .foregroundColor(.primary)
             }

             Button {
                 
             } label: {
                 Image(systemName: "airplayaudio")
                     .font(.title2)
                     .foregroundColor(.primary)
             }
             
             Button {
                 
             } label: {
                 Image(systemName: "list.bullet")
                     .font(.title2)
                     .foregroundColor(.primary)
             }
         }
         .padding()
         Spacer(minLength: 0)
         .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
     }
     .frame(height: isExpand ? 0 : nil)
     .opacity(isExpand ? 1 : 0)
 }
 .frame(maxHeight: isExpand ? .infinity : 80)
 .background(
     VStack(spacing: 0) {
         BlurView()
         Divider()
     })
 .onTapGesture {
     withAnimation(.spring()) {
         isExpand = true
     }
 }
 .cornerRadius(isExpand ? 20 : 0)
 .offset(y: isExpand ? 0 : -48)
 .offset(y: offSet)
 .gesture(DragGesture().onEnded(onEnded(value: )).onChanged(onChanged(value:)))
// .ignoresSafeArea()

 */
