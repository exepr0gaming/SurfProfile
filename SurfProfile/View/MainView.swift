//
//  MainView.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI

struct MainView: View {
	var body: some View {
		GeometryReader { proxy in
			let topEdge = proxy.safeAreaInsets.top
			ProfileView(topEdge: topEdge)
				.ignoresSafeArea(.all, edges: .top)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
