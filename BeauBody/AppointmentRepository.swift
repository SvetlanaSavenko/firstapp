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
	func saveAppointment(appointment: Appointment)
}
