//
//  MonthlyView.swift
//  Calendar1
//
//  Created by Coldot on 2022/07/19.
//

import SwiftUI

struct MonthlyView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var scheduleViewToggle: Bool = true
    
    
    var body: some View {
        NavigationView() {
            ZStack {
                // background layer
                Color.gray
                    .opacity(0.075)
                    .ignoresSafeArea()
                
                // main layer
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                            .frame(height: 5)
                    }
                    
                    MonthlyCalendar()

                    DailyScheduleView()
                        .background(Color.backgroundColor)
                    BottomControlView()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: HStack {
                        Button (
                            action: {},
                            label: {
                                Image(systemName: "chevron.left")
                                Text(CalendarHelper().getYearMonthStr(dateHolder.date))
                            }
                        )
                    },
                    
                    trailing: HStack(spacing: 15){
                        Button(
                            action: {
                                scheduleViewToggle.toggle()
                            },
                            label: {
                                Image(systemName: "list.bullet.below.rectangle")
                            })
                        .padding(EdgeInsets.init(top: 1, leading: -4, bottom: 1, trailing: 4))
                        .foregroundColor(scheduleViewToggle ? Color.white : Color.accentColor)
                        .background(scheduleViewToggle ? Color.accentColor : nil)
                        .cornerRadius(5)
                        
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                        })
                })
            }
        }
        
    }
}

struct MonthlyView_Previews: PreviewProvider {
    
    static let newDateComp = DateComponents(year: 2022, month: 7, day: 3)
    static let newDate = Calendar.current.date(from: newDateComp)!

    static let dateHolder = DateHolder(newDate)
//    static let dateHolder = DateHolder()
    
    static var previews: some View {
        MonthlyView()
            .environmentObject(dateHolder)
            .previewDevice("iPhone 13 mini")
            
    }
}
