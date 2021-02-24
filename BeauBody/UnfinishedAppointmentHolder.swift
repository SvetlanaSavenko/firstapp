//
//  UnfinishedAppointment.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 22.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class UnfinishedAppointmentHolder: ObservableObject {

	@Published var appointment: UnfinishedAppointment

	// свойство, при изменении которого будут меняться наблюдатели во всех вью моделях
//	var services: [DepilationTyype]? = nil // откуда-то будем брать эту запись
//	var time: Date? = nil // откуда-то будем брать эту запись
	
}

