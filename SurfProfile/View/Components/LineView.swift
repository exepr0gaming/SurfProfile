//
//  LineView.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

struct LineView: View {
	var image: String
	var textBut: String
	
	var body: some View {
		Button {} label: {
			HStack(spacing: 14) {
				Image(systemName: image)
					.foregroundColor(.black.opacity(0.8))
					.font(.system(size: 24, weight: .medium, design: .default))
					.frame(width: 24, height: 24)
				
				Text(textBut)
					.foregroundColor(.black.opacity(0.8))
					.fontWeight(.medium)
				
				Spacer()
				
				Image(systemName: "chevron.right")
					.foregroundColor(.black).opacity(0.4)
			}
		}

	}
}
