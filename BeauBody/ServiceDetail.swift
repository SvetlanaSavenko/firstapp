//
//  TutorDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ServiceDetail: View {

	@Binding var showModal: Bool
    var body: some View {
		VStack {
			DepilationMenu()
			Button("Готово"){
				self.showModal.toggle()
			}
		}
	}
}

struct DepilationMenu: View {
	@State var expand = true
	var body: some View {
		VStack() {
			HStack() {
				Text("Депиляция")
				Image(systemName: expand ? "chevron.up" : "chevron.down")
			}.onTapGesture {
				self.expand.toggle()
			}
			if expand {
				CheckboxField(label: .waxShinHip, callback: checkboxSelected)
				CheckboxField(label: .sugaringBikiniClassic, callback: checkboxSelected)
				CheckboxField(label: .armpits, callback: checkboxSelected)
			}
		}
	}

	func checkboxSelected(id: String, isMarked: Bool) {
		   print("\(id) is marked: \(isMarked)")
	   }
}

enum DepilationTypes: String {
    case waxShinHip = "Услуга 1"
    case sugaringBikiniClassic = "Услуга 2"
	case armpits = "Услуга 3"
}

struct CheckboxField: View {
	let label: String
	let callback: (String, Bool)->()
	init(
		label: DepilationTypes,
		callback: @escaping (String, Bool)->()
	) {
		self.label = label.rawValue
		self.callback = callback
	}

	@State var isMarked:Bool = false
	var body: some View {
		Button(action:{
			self.isMarked.toggle()
			self.callback(self.label, self.isMarked)
		}) {
			HStack() {
				Image(systemName: self.isMarked ? "checkmark.square" : "square")
				Text(label)
			}
		}
	}
}

struct ServiceDetail_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
