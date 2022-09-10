//
//  ProfileView.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

struct ProfileView: View {
	let maxHeight = UIScreen.main.bounds.height / 2.3
	var topEdge: CGFloat
	
	@State var offset: CGFloat = 0
	
	var body: some View {
		VStack {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(spacing: 0) {
					GeometryReader { proxy in
						ProfileHeaderView(topEdge: topEdge, maxHeight: maxHeight, offset: $offset)
						// Sticky effect
							.frame(maxWidth: .infinity)
							.frame(height: getHeaderHeight(), alignment: .bottom)
							.background(Color("bg"))
						// Top nav view in Overlay
							.overlay(alignment: .top, content: { topNavView })
					}
					.frame(height: maxHeight)
					// Fixing at top
					.offset(y: -offset)
					.zIndex(1)
					
					// MARK: - Content
					VStack(alignment: .leading, spacing: 20) {
						LineView(image: "percent", textBut: "Промокоды и подписки")
						LineView(image: "slider.horizontal.3", textBut: "Настройки")
						LineView(image: "doc.plaintext", textBut: "Пользовательское соглашение")
						LineView(image: "envelope", textBut: "Связаться с нами")
					}
					.padding()
					
					// MARK: - hidden comments
					VStack {
						Color.clear
							.frame(height: UIScreen.main.bounds.height / 2)
						Text("1. Идея странная, надеюсь на практике такого нет.\n2. Закругленные углы без тени вообще не видны, практичнее был бы сделать закругленный header с тенями, и убирать их при прокрутке, выглядит классно, проверил)\n3. Простенький макет, картинку под iPad конечно можно увеличить, под малышек проверить шрифт/minimumScaleFactor/numberOflines ну а так тут всё динамическое.\n4. Ну и конечно максимально структурировать 200 строк кода и создавать VM было не актуально.")
							.font(.subheadline)
							.opacity(topBatTitleOpacity())
					}
					.padding()
				}
				.modifier(OffsetModifier(offset: $offset))
			}
			.coordinateSpace(name: "SCROLL")
			
			// MARK: - Bottom
			bottomView
		}
	} // body
	
	// MARK: - Top Nav View
	var topNavView: some View {
		HStack {
			Button {} label: {
				Image(systemName: "arrow.left")
					.foregroundColor(.black).opacity(0.8)
			}
			
			Spacer()
			
			HStack {
				Image("iam")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 35, height: 35)
					.clipShape(Circle())
				
				Text("Такого парня надо брать")
			}
			.opacity(topBatTitleOpacity())
			
			Spacer()
		}
		.padding(.horizontal)
		.frame(height: 40) 	// maxHeight
		.padding(.top, topEdge)
	}
	
	var bottomView: some View {
			LineView(image: "arrow.backward.square", textBut: "Выйти")
				.padding(.top)
		.padding()
	}
	
	// MARK: - Functions
	func getHeaderHeight() -> CGFloat {
		let topHeight = maxHeight + offset
		return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
	}
	func getCornerRadius() -> CGFloat {
		let progress = -offset / (maxHeight - (60 + topEdge))
		let value = 1 - progress
		let radius = value * 50
		return offset < 0 ? radius : 50
	}
	func topBatTitleOpacity() -> CGFloat {
		let progress = -(offset + 60) / (maxHeight - (40 + topEdge))
		return progress
	}
	
}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
