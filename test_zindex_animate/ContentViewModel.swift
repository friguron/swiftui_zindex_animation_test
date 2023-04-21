//
//  ContentViewModel.swift
//  test_zindex_animate
//
//  Created by Isaac Santaolalla on 21/4/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
 
    @Published var arrayPieces:[Piece]=[.init(color: .red),.init(color: .orange),.init(color: .yellow),.init(color: .green),.init(color: .blue), .init(color: .purple), .init(color: .pink), .init(color: .brown),.init(color: .gray) ]
    @Published var columns:[GridItem] = [GridItem.init(.flexible()),GridItem.init(.flexible()),GridItem.init(.flexible() ) ]
    
}

/*
struct Piece: View, Hashable{
    
    var sizeLength:Double=100.0
    var color:Color
    var raised:Bool=false
    var superRaised:Bool=false
    var baseX:Double = 0.0
    var baseY:Double = 0.0
    
    var body: some View {
        Rectangle().fill(self.color)
            .frame(minWidth: sizeLength , minHeight: sizeLength)
            .shadow(color: .black, radius: 5)
            .scaleEffect(self.superRaised ?  1.3 : self.raised ? 1.2 : 1.0 )
            .position(x:baseX+sizeLength/2,y:baseY+sizeLength/2)
            .zIndex(self.superRaised ? 100.0 : self.raised ? 90.0 : 0.0 )
    }
}
*/


struct Piece: Identifiable, Hashable {
    
    let id = UUID()
    
    var sizeLength:Double=100.0
    var color:Color
    var raised:Bool=false
    var superRaised:Bool=false
    var baseX:Double = 0.0
    var baseY:Double = 0.0
}
