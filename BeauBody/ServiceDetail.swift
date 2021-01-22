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
	@Binding var services: Set<DepilationType>

	var body: some View {
		VStack {
			DepilationMenu(services: $services)
			Button("Готово"){
				self.showModal.toggle()
			}
		}
	}
}

enum DepilationType: String {
    case waxShinHip = "Услуга 1"
    case sugaringBikiniClassic = "Услуга 2"
	case armpits = "Услуга 3"
}

let allDepilationTypes: Set<DepilationType> = [.waxShinHip, .sugaringBikiniClassic, .armpits]

struct DepilationMenu: View {
	@State var expand = true
	@Binding var services: Set<DepilationType>

	var body: some View {
		VStack() {
			HStack() {
				Text("Депиляция")
				Image(systemName: expand ? "chevron.up" : "chevron.down")
			}.onTapGesture {
				self.expand.toggle()
			}
			if expand {
				ForEach(Array(allDepilationTypes), id: \.self) { depilationType in
					CheckboxField(state: services.contains(depilationType), label: depilationType.rawValue, callback: { if $0 {self.services.insert(depilationType)} else { self.services.remove(depilationType) }})
				}
			}
		}
	}
}

struct CheckboxField: View {
	@State var state: Bool
	let label: String
	let callback: (Bool)->()
	var body: some View {
		Button(action:{
			self.state.toggle()
			self.callback(self.state)
		}) {
			HStack() {
				Image(systemName: self.state ? "checkmark.square" : "square")
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
