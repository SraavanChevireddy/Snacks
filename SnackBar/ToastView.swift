//
//  ToastView.swift
//  SnackBar
//
//  Created by Sraavan Chevireddy on 8/1/22.
//

import SwiftUI

struct ToastView: ViewModifier {
    @EnvironmentObject var toastVM : ToastViewModel
    
    @Binding var triggerWith: Bool
    var title:String
    var iconName: String = "xmark.circle.fill"
    
    var refreshAction: ()->()
    var dismissAction: ()->()
    
    func body(content: Content) -> some View {
            content
            .overlay(alignment: .top, content: {
                if triggerWith{
                    miniToast
                        .animation(.easeIn, value: toastVM.toastStatus.value)
                        .transition(toastVM.toastStatus.value == .show ? .opacity : .move(edge: .bottom))
                }else{
                    EmptyView()
                }
            })
            .onChange(of: triggerWith) { newValue in
                if newValue{
                    withAnimation {
                        toastVM.objectWillChange.send()
                        toastVM.toastStatus.send(.show)
                    }
                }
            }
    }
    
    private var miniToast : some View{
        HStack(alignment: .center){
            HStack(alignment: .top){
                Image(systemName: iconName)
                    .foregroundColor(.white)
                Text(title)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
            }.padding(.leading, margin.small.rawValue)
            
            Spacer()
            
            Button(action: refreshAction) {
                Text("Refresh")
            }.buttonStyle(CustomButtonStyle(tintColor: .white, type: .primary, marginPadding: .medium, foregroundColor: .blue, style: .title3))
                .padding(margin.large.rawValue)
            
            
            Button {
                dismissAction()
                withAnimation {
                    triggerWith = false
                    toastVM.objectWillChange.send()
                    toastVM.toastStatus.send(.dismiss)
                }
            } label: {
                Text("Dismiss")
            }.buttonStyle(CustomButtonStyle(tintColor: .white, type: .teritary, style: .title3))
                .padding(margin.small.rawValue)
            
        }.foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.7))
            .cornerRadius(5)
            .padding([.horizontal, .vertical] ,margin.small.rawValue)
    }
}

extension View {
    func showSnackBar(with: Binding<Bool>,text: String, onRefresh:@escaping ()->(), onDismiss:@escaping ()->()) -> some View {
        modifier(ToastView(triggerWith: with, title: text, refreshAction: onRefresh, dismissAction: onDismiss))
    }
}
