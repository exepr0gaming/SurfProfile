//
//  OffsetModifier.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
	@Binding var offset: CGFloat
	
	func body(content: Content) -> some View {
		content
			.overlay(alignment: .top) {
				GeometryReader{ proxy -> Color in
					//let minY = proxy.frame(in: .global).minY
					//print(minY)
				
					let minY = proxy.frame(in: .named("SCROLL")).minY
					DispatchQueue.main.async {
						self.offset = minY
					}
					return Color.clear
				}
			}
	}
}
