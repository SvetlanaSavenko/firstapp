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

//extension DepilationType: Hashable {
//
//    func hash(into hasher: inout Hasher) {
//
//        switch self {
//        case .waxShinHip:
//            hasher.combine(1)
//        case .sugaringBikiniClassic:
//            hasher.combine(2)
//        case .armpits:
//            hasher.combine(3)
//        }
//    }
//}

let allDepilationTypes: [DepilationType] = [.waxShinHip, .sugaringBikiniClassic, .armpits]

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
				ForEach(allDepilationTypes, id: \.self) { depilationType in
					CheckboxField(label: depilationType, callback: { if $0 {self.services.insert(depilationType)} else { self.services.remove(depilationType) }})
				}
			}
		}
	}
}

//self.services.remove(depilationType)
struct CheckboxField: View {
	let label: String
	let callback: (Bool)->()
	init(
		label: DepilationType,
		callback: @escaping (Bool)->()
	) {
		self.label = label.rawValue
		self.callback = callback
	}
	@State var isMarked:Bool = false
	var body: some View {
		Button(action:{
			self.isMarked.toggle()
			self.callback(self.isMarked)
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
