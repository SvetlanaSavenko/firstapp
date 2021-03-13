//
//  UnfinishedAppointment.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 22.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class UnfinishedAppointmentHolder {

	var appointment: UnfinishedAppointment = UnfinishedAppointment(services: [], date: nil) {
		willSet { notify() }
	}

	private lazy var observers = [Observer]()

	func attach(_ observer: Observer) {
		observers.append(observer)
	}

	func notify() {
		observers.forEach({ $0.update(subject: self)})
	}
}
