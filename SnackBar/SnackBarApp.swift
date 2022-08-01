//
//  SnackBarApp.swift
//  SnackBar
//
//  Created by Sraavan Chevireddy on 8/1/22.
//

import SwiftUI

@main
struct SnackBarApp: App {
    @StateObject var toastVM = ToastViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
            .environmentObject(toastVM)
        }
    }
}
