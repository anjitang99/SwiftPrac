//
//  EnvPrac.swift
//  SwiftUI_tutorial#1
//
//  Created by jihoon an on 8/18/24.
//

import SwiftUI

struct SubView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Button("dismiss") {
                dismiss()
            }
        }
    }
}

struct EnvPrac: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SubView()
                } label: {
                    Text("SubView로 이동")
                }
            }
            .padding()
        }
    }
}

#Preview {
    EnvPrac()
}
