//
//  ViewTwo.swift
//  SnackBar
//
//  Created by Sraavan Chevireddy on 8/1/22.
//

import SwiftUI

struct ViewTwo: View {
    @State var showAgain = false
    var body: some View {
        List{
            ForEach(0..<100){ _ in
                Text("Hi")
                    .onTapGesture {
                        showAgain.toggle()
                    }
            }
        }
            .showSnackBar(with: $showAgain, text: "The API unexpectedly returned a null value. Tap on refresh to refresh the screen. If error persists contact IT support", onRefresh: {
                
            }, onDismiss: {
                
            })
            .navigationTitle("I'm view two")
    }
}

struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo()
    }
}
