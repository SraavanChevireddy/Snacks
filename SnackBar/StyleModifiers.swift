//
//  StyleModifiers.swift
//  GenericButtons
//
//  Created by Sraavan Chevireddy on 7/20/22.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    /// AppTheme color will be applied by default. Feel free to override this whenever needed.
    var tintColor : Color = .accentColor
    var type: buttonType
    
    /// Default padding is applied as `small`. For more options you can play around with `margin` properties.
    var marginPadding : margin = .small
    
    /// Foreground Color applied to button will be based on the `buttonType` you choose. For `primaryButton` the foreground Color remains as white. And for `secondary` and `teritary`,  `tintColor` will be applied to foreground.
    var foregroundColor: Color = .white
    var style: Font.TextStyle = .body
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(style, design: .rounded))
            .padding(marginPadding.rawValue)
            .background(appliedTint)
            .foregroundColor(appliedForeground)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
            .overlay(
                appliedOverlay
            )
    }
    
    private var appliedTint : Color{
        if type == .primary{
            return tintColor
        }else{
            return .clear
        }
    }
    
    private var appliedForeground : Color{
        if type == .primary{
            return foregroundColor
        }else{
            return tintColor
        }
    }
    
    private var appliedOverlay : some View{
        Group{
            if type == .secondary{
                Capsule(style: .continuous)
                    .strokeBorder(appliedForeground, lineWidth: 1)
            }else{
                EmptyView()
            }
        }
    }
}



