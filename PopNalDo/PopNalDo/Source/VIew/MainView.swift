//
//  MainView.swift
//  PopNalDo
//
//  Created by dgsw8th16 on 10/20/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var state = MainState()
    
    var body: some View {
        ZStack {
            Image("background")
            
            VStack {
                Text("\(state.tabCount)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Image(state.isPressed ? "siu" : "siuReady")
                    .frame(width: 330, height: 700)
                    .gesture(
                        LongPressGesture(minimumDuration: 0.1)
                            .onChanged { _ in
                                state.isPressed.toggle()
                                state.tabCount += 1
                            }
                            .onEnded { _ in
                                state.isPressed.toggle()
                            }
                    )
            }
        }
    }
}

#Preview {
    MainView(state: MainState())
}
