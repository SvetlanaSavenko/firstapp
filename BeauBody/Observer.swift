//
//  Observer.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.03.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

protocol Observer: class {

	func update(subject: UnfinishedAppointmentHolder)
}
