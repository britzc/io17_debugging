//
//  PostView.swift
//  CoolSpots
//
//  Created by Corneile Britz on 24/05/2024.
//

import SwiftUI

struct PostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            .padding(.horizontal, 50)
            .bold()
        Button("Dismiss") {
            dismiss()
        }         
        .buttonStyle(.borderedProminent)
            .padding(.vertical,30)
    }
}

#Preview {
    PostView()
}
