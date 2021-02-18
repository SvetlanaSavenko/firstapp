//
//  AppointmentRepository.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

protocol AppointmentRepository {
	var appo: Appointment? {get}
	func getAppointment()


//	func getAppointment(callback: (Appointment)->())
//	func getAppointment(callback: (Appointment)->()) {
//	let userdef = UserDedaults()
//	let data = userdef.object(from key: "appointments").decode()
//	//return data
//	callback(data)
//
//
//	islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//	  if let error = error {
//		// Uh-oh, an error occurred!
//	  } else {
//		// Data for "images/island.jpg" is returned
//		callback(data)
//	  }
//	}
//
//	}



	func saveAppointment(appointment: Appointment)
}
