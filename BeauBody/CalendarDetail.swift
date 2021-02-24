//
//  CalendarView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 22.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct CalendarDetail: View {

	@ObservedObject private var vm: ViewModelCalendarDetail = Container.instance.provideCalendarViewModel()
	
	@Binding var showСalendarModal: Bool

	var body: some View {
		if #available(iOS 14.0, *) {
			DatePicker(
				"Start Date",
				selection: $vm.selectedDate,
				displayedComponents: [.date]
			)
			.datePickerStyle(GraphicalDatePickerStyle())
		} else {
			// Fallback on earlier versions
		}
		Button("Готово"){
			self.showСalendarModal.toggle()
		}
	}
}

struct CalendarDetail_Previews: PreviewProvider {
    static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
