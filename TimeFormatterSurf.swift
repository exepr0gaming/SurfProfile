//
//  TimeFormatterSurf.swift
//  SurfProfile
//
//  Created by Курдин Андрей on 11.09.2022.
//

import SwiftUI
/// Простенький форматтер для преобразование кол-ва секунда в строку вида "12:02" или "1 ч. 12 мин."
public final class TimeFormatter {
		public init() {}
	
	// MARK: - return isShortFormat ? format: "%02d:%02d" : "%d ч. %d мин.
		public func format(_ seconds: Int, isShortFormat: Bool) -> String {
			let hours = seconds / 3600
			let minutes = (seconds - hours * 3600) / 60
			let seconds = seconds % 60
			
			switch isShortFormat {
				case true:
					return String(format: "%02d:%02d", minutes, seconds)
					
				case false:
					if hours > 0 && minutes > 0 {
							return String(format: "%d ч. %d мин.", hours, minutes)
					} else if hours > 0 {
							return String(format: "%d ч.", hours)
					} else if minutes > 0 {
							return String(format: "%d мин.", minutes)
					} else {
							return String(format: "%d сек", seconds)
					}
			}
		}
}
