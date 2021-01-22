//
//  CalendarView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 22.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
	@Binding var showСalendarModal: Bool
	@State private var date = Date()

	var body: some View {
		if #available(iOS 14.0, *) {
			DatePicker(
				"Start Date",
				selection: $date,
				displayedComponents: [.date]
			)
			.datePickerStyle(GraphicalDatePickerStyle())
		} else {
			// Fallback on earlier versions
		}
	}
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
