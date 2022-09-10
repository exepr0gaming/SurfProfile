//
//  CustomCorner.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

// MARK: - Округлять любые углы
struct CustomCorner: Shape {
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(CustomCorner(radius: radius, corners: corners))
	}
}
