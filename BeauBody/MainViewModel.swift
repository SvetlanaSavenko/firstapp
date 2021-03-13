//
//  OnlineAppointmentViewModel.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject, Observer {

	@Published var currentAppointment: Appointment? = nil
	@Published var unfinishedAppointment: UnfinishedAppointment? = nil
	@Published private(set) var isAppointmentButtonVisible = false

	init(currentAppointment: AppointmentRepository, unfinishedAppointment: UnfinishedAppointmentHolder) {
		self.loadAppointments(currentAppointment: currentAppointment, unfinishedAppointment: unfinishedAppointment)
		unfinishedAppointment.attach(self)
	}

	// weak self
	func loadAppointments(currentAppointment: AppointmentRepository, unfinishedAppointment: UnfinishedAppointmentHolder) {
		currentAppointment.getAppointment(callback: { self.currentAppointment = $0 })
		self.unfinishedAppointment = unfinishedAppointment.appointment
		self.updateButtonVisible()
	}

	private func updateButtonVisible() {
		self.isAppointmentButtonVisible = ((self.unfinishedAppointment?.services.count)!) > 0 && self.unfinishedAppointment?.date != nil
	}

	func saveAppointment() {
		
	}

	func update(subject: UnfinishedAppointmentHolder) {
		self.unfinishedAppointment = subject.appointment
	}

}
