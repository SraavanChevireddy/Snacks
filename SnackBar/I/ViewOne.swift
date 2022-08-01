//
//  ViewOne.swift
//  SnackBar
//
//  Created by Sraavan Chevireddy on 8/1/22.
//

import SwiftUI

struct ViewOne: View {
    @State var show = false
    
    var body: some View {
        VStack{
            Button(action: {
                show = true
            }, label: {
                Text("Tap me")
            })
                .navigationTitle("I'm view one")
                .showSnackBar(with: $show, text: "asdasdas") {
                    
                } onDismiss: {
                    
                }
            NavigationLink {
                ViewTwo()
            } label: {
                Text("Go ahead! ")
            }
        }

    }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ViewOne()
    }
}
