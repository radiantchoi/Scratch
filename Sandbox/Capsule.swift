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
        HStack {
            Label {
                Text(title)
            } icon: {
                Image(uiImage: icon)
            }
            .tint(Color(uiColor: contentsColor))
        }
        .backgroundStyle(Color(uiColor: backgroundColor))
        .border(RoundedRectangle(cornerRadius: 10))
    }
}

