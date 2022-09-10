//
//  ProfileHeaderView.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
	var topEdge: CGFloat
	var maxHeight: CGFloat
	@Binding var offset: CGFloat
	
	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 15) {
				Image("iam")
					.resizable()
					.scaledToFill()
					.frame(width: 80, height: 80)
					.cornerRadius(40)
				
				HStack {
					VStack(alignment: .leading) {
						Text("Курдин Андрей")
							.font(.title)
							.fontWeight(.semibold)
							.foregroundColor(.black).opacity(0.8)
						Text("Могу верстать любые штуки")
							.font(.system(size: 13, weight: .regular, design: .default))
							.foregroundColor(.black).opacity(0.35)
					}
					Spacer()
					
					Image(systemName: "chevron.right")
						.foregroundColor(.black).opacity(0.8)
				}
			}
			.padding()
			.opacity(getOpacity())
			
			Color.white
				.frame(height: 40)
				.cornerRadius(25, corners: [.topLeft, .topRight])
		}
		
	}
	// Calculation opacity
	func getOpacity() -> CGFloat {
		// 70 = some random amount of time to visible on scroll
		let progress = -offset / 70
		let opacity = 1 - progress
		return offset < 0 ? opacity : 1
	}
}
