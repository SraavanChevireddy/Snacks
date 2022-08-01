//
//  ToastViewModel.swift
//  SnackBar
//
//  Created by Sraavan Chevireddy on 8/1/22.
//

import Combine
import Foundation
import SwiftUI

class ToastViewModel: ObservableObject{
    var toastStatus = CurrentValueSubject<showCase, Never>(.dismiss)
    var subscriptions = Set<AnyCancellable>()
    
    private var workItem: DispatchWorkItem!
    
    init(){
        addSubscriptions()
    }
    
    private func addSubscriptions(){
        
        toastStatus.sink { [weak self] newStatus in
            guard let self = self else{
                return
            }
            if self.toastStatus.value == .inProgress{
              
            }
        }.store(in: &subscriptions)
    }
    
    private func hideMe(){
        withAnimation {
            self.objectWillChange.send()
            toastStatus.send(.dismiss)
        }
    }
}

enum showCase{
    case show
    case dismiss
    case inProgress
}
