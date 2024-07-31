//
//  Capsule.swift
//  Sandbox
//
//  Created by 러닝포인트 on 7/31/24.
//

import SwiftUI
import UIKit

struct CapsuleView: View {
    let icon: UIImage
    let title: String
    
    let backgroundColor: UIColor
    let contentsColor: UIColor
    let borderColor: UIColor
    
    var body: some View {
        HStack(spacing: 5) {
            Image(uiImage: icon)
                .renderingMode(.template)
                .frame(width: 8, height: 8)
            
            Text(title)
                .font(Font(UIFont.systemFont(ofSize: 15, weight: .bold)))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(Color(uiColor: contentsColor))
        .background(
            Capsule().fill(
                Color(
                    uiColor: backgroundColor
                )
            )
            .overlay(
                Capsule()
                    .strokeBorder(Color(uiColor: borderColor), lineWidth: 2)
            )
        )
    }
}

