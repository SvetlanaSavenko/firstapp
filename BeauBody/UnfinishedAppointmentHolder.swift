//
//  UnfinishedAppointment.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 22.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class UnfinishedAppointmentHolder: ObservableObject {

	var appointment: UnfinishedAppointment = UnfinishedAppointment(services: [], date: nil)
	
}

