//
//  ViewModelCalendarDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 07.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelCalendarDetail: ObservableObject {

	@Published var selectedDate: Date = Date()

	init(unfinishedAppointment: UnfinishedAppointmentHolder) {
		if let date = unfinishedAppointment.appointment.date {
			self.selectedDate = date
		}
	}
}
