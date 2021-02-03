//
//  ViewModel.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 01.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelContent {
	
	let userDefaults: UserDefaults

	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}

	func saveValue(forKey key: String, value: Any) {
		userDefaults.set(value, forKey: key)
	}

	func saveAppointment(services: [DepilationType], date: Date) {
		let appointment = Appointment(services: services, date: date)
		do {
			let encoder = JSONEncoder()
			let data = try encoder.encode(appointment)
			saveValue(forKey: "appointments", value: data)

		} catch {
			print("Unable to Decode Note (\(error))")
		}
	}
}

//{ "appointments" : [
//	{ "12 oct", ["wax", "sugar"] },
//	{ "11 oct, [wax]" },
//	{ "12 oct, [wax]"}
//	]
//}
