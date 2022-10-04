//
//  MenuCardViewModel.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 02/09/2022.
//

import Foundation
import Combine

protocol MenuCardViewModelType: ObservableObject {
    var foodMenu: Food? { get set }
    var segmentSelection: Int { get set }
    var headerText: String { get set }
    var firstSectionHeader: String { get set }
    var upcomingLunchMenus: [Food] {get set }
    var upcomingDinnerMenus: [Food] { get set }
    var showAlert: Bool { get set }
    var errorText: String { get set }
    var showMenuForUpcomingDays: Bool { get set }
    var isToggle: Bool { get set }
    func toggleMenu()
}

final class MenuCardViewModel: MenuCardViewModelType {
    
    //MARK:- Outputs
    @Published
    var foodMenu: Food?
    @Published
    var segmentSelection: Int = 0
    @Published
    var upcomingLunchMenus: [Food] = []
    @Published
    var upcomingDinnerMenus: [Food] = []
    @Published
    var firstSectionHeader: String = "Lunch"
    @Published
    var headerText: String = ""
    @Published
    var showAlert: Bool = false
    @Published
    var errorText: String = ""
    @Published
    var showMenuForUpcomingDays: Bool = true
    @Published
    var isToggle: Bool = false
    
    private var lunchMenu: Food?
    private var dinnerMenu: Food?

    private var food: [Food] = []
    private var subscriptions: [AnyCancellable] = []
    private let service: FoodMenuServiceType
    
    init(service: FoodMenuServiceType) {
        self.service = service
        self.headerText = getHeaderText()
        
        requestFood()
        
        $segmentSelection.sink {[weak self] valueß in
            guard let self = self else { return }
            self.foodMenu = valueß == 0 ? self.lunchMenu : self.dinnerMenu
            self.firstSectionHeader = valueß == 0 ? "Lunch Menu" : "Dinner Menu"
        }.store(in: &subscriptions)
    }
    
    func toggleMenu(){
        if !showMenuForUpcomingDays {
            isToggle.toggle()
        }
    }
}

private extension MenuCardViewModel {
    
    private
    func requestFood(){
        self.service.getMenu().receive(on: RunLoop.main).sink { error in
            print(error)
        } receiveValue: {[weak self] menu in
            guard let self = self else { return }
            self.lunchMenu = self.getTodaysMenu(foodMenu: menu.lunchMenu, isLunch: true)
            self.foodMenu = self.lunchMenu
            self.dinnerMenu = self.getTodaysMenu(foodMenu: menu.dinnerMenu)
            self.upcomingLunchMenus = self.getFoodForTheWeek(menu: menu, isLunch: true)
            self.upcomingDinnerMenus = self.getFoodForTheWeek(menu: menu)
        }.store(in: &subscriptions)
    }
    
    private
    func getTodaysMenu(foodMenu: [Food], isLunch: Bool = false) -> Food {
        if let food = foodMenu.filter({ (isLunch) ? ($0.lunchDate?.dateFromString().isToday == true) : ($0.dinnerDate?.dateFromString().isToday == true) }).first {
            self.showMenuForUpcomingDays = false
            self.showAlert = false
            self.errorText = ""
            return food
        }
        else {
            self.showAlert = true
            self.errorText = "Hi! Menu is not updated yet. Please contact Ali Murad from iOS Team to update the menu of this month."
            return Food(dinnerDate: "", day: "", mainDish: "", sideDish: "", sweetDish: "", lunchDate: "")
        }

    }
    
    private
    func getHeaderText() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        return "Food For Today " + formatter.string(from: currentDateTime) + " is : "
    }
}

extension MenuCardViewModel {
    
    private
    func getFoodForTheWeek(menu: MenuResponse, isLunch: Bool = false)-> [Food] {
        let menu = isLunch ? menu.lunchMenu.filter { $0.lunchDate?.dateFromString().isDateInTheFuture == true } : menu.dinnerMenu.filter { $0.dinnerDate?.dateFromString().isDateInTheFuture == true }
        return menu
    }
}
