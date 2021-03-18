//
//  TutorDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

//тест
struct ServiceDetail: View {
	@ObservedObject private var vm: ViewModelServiceDetail = Container.instance.provideServiceViewModel()
	@Binding var showServiceModal: Bool

	var body: some View {
		VStack {
			DepilationMenu(allServices: vm.allServices, selectedServices: $vm.unfinishedAppointmentServices)
			Button("Готово"){
				self.showServiceModal.toggle()

			}
		}
	}
}

enum DepilationType: String, Codable {
    case waxShinHip = "Услуга 1"
    case sugaringBikiniClassic = "Услуга 2"
	case armpits = "Услуга 3"
	case pusto = "Пусто"
}

struct DepilationMenu: View {
	@State var expand = true
	let allServices: [DepilationTyype]
	@Binding var selectedServices: [DepilationTyype]

	var body: some View {
		VStack() {
			HStack() {
				Text("Депиляция")
				Image(systemName: expand ? "chevron.up" : "chevron.down")
			}.onTapGesture {
				self.expand.toggle()
			}
			if expand {
				ForEach(allServices, id: \.self) { depilationType in
					Checkbox(state: selectedServices.contains(depilationType),
							label: depilationType.rawValue,
								  callback: {
									if $0 { self.selectedServices.append(depilationType) }
									else {
										if let index = selectedServices.firstIndex(of: depilationType) {
											selectedServices.remove(at: index)
										}
									}
								  }
								)
				}
			}
		}
	}
}

struct Checkbox: View {
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
