//
//  ContentView.swift
//  test_zindex_animate
//
//  Created by Isaac Santaolalla on 21/4/23.
//

import SwiftUI

struct ContentView: View {
 
    @StateObject var vm=ContentViewModel()
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: vm.columns, content:
            {
                ForEach ($vm.arrayPieces) { $tmpPiece in
                    Rectangle()
                        .fill(tmpPiece.color)
                        .frame(minWidth: tmpPiece.sizeLength , minHeight: tmpPiece.sizeLength)
                        .shadow(color: .black, radius: 5)
                        .scaleEffect(tmpPiece.superRaised ?  1.3 : tmpPiece.raised ? 1.2 : 1.0 )
                        .position(x:tmpPiece.baseX+tmpPiece.sizeLength/2,y:tmpPiece.baseY+tmpPiece.sizeLength/2)
                        .zIndex(tmpPiece.superRaised ? 100.0 : tmpPiece.raised ? 90.0 : 0.0 )
                }

            })
            
            Button(action: {
                withAnimation {
                    vm.arrayPieces[0].baseX = 290.0
                    vm.arrayPieces[0].baseY = 216.0
                    
                    vm.arrayPieces[8].baseX = -290.0
                    vm.arrayPieces[8].baseY = -216.0
                    
                    vm.arrayPieces[0].superRaised = true
                    vm.arrayPieces[0].raised = false
                    
                    vm.arrayPieces[8].superRaised = false
                    vm.arrayPieces[8].raised = true
                    
                }
            }, label: {
                Text("animate flags and positions of red and grey")
            })
            
            Button(action: {
                withAnimation {
                    vm.arrayPieces[0].baseX = 0.0
                    vm.arrayPieces[0].baseY = 0.0
                    
                    vm.arrayPieces[8].baseX = 0.0
                    vm.arrayPieces[8].baseY = 0.0
                    
                    vm.arrayPieces[0].superRaised = false
                    vm.arrayPieces[0].raised = false
                    
                    vm.arrayPieces[8].superRaised = false
                    vm.arrayPieces[8].raised = false
                }
            }, label: {
                Text("animate resetting back flags and positions of red and grey")
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
