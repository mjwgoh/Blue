import SwiftUI

struct CellView: View {
    var body: some View {
        ZStack(alignment: .center,
               content: {
            RoundedRectangle(cornerRadius: 25)    .fill(.white).opacity(0.90)
        }
        ).foregroundColor(.black)
    }
}

struct QuickButtonsView: View {
    
    let input_icon: String
    let input_text: String
    
    var body: some View {
        
        ZStack{
            CellView()
            VStack{
                Image(systemName: input_icon).font(.title).padding(.bottom, 4)
                Text(input_text).font(.caption)
            }
        }
    }
}

func AMPM(hour: Int) -> String {
    let is_aft = hour / 12
    if is_aft >= 1 {
        return "PM"
    } else {
        return "AM"
    }
}

func weekday(weekday: Int) -> String {
    
    switch weekday {
        
    case 1: return "Monday"
    case 2: return "Tuesday"
    case 3: return "Wednesday"
    case 4: return "Thursday"
    case 5: return "Friday"
    case 6: return "Saturday"
    case 7: return "Sunday"
    default: return "The time now is:"
        
    }
    
}

func month_of_year(month: Int) -> String {
    
    switch month {
        
    case 1:
        return "January"
    case 2:
        return "February"
    case 3:
        return "March"
    case 4:
        return "April"
    case 5:
        return "May"
    case 6:
        return "June"
    case 7:
        return "July"
    case 8:
        return "August"
    case 9:
        return "September"
    case 10:
        return "October"
    case 11:
        return "November"
    case 12:
        return "December"
        
    default: return "Invalid Month"
        
    }
    
}

func currentDateComponents() -> (weekday: String, day: Int, month: String, hour: Int, minutes: Int) {
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.weekday, from: date)
    let month = calendar.component(.month, from: date)
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    
    let weekdayString = weekday(weekday: day)
    let monthString = month_of_year(month: month)
    
    return (weekdayString, day, monthString, hour, minutes)
}

struct ContentView: View {
    var body: some View {
        
        //VStack combines all the ZStack components within the VStack
        VStack{
            ZStack{
                CellView()
                VStack{
                    Text(currentDateComponents().weekday + ", " + String(currentDateComponents().day) + " " + currentDateComponents().month)
                    Text(String(currentDateComponents().hour % 12) + ":" + String(format: "%02d", currentDateComponents().minutes) + " " + AMPM(hour: currentDateComponents().hour)).font(.largeTitle)
                }
            }
            .frame(height: 100)
            .padding(.bottom, 4)
            HStack{
                ZStack{
                    HStack{
                        QuickButtonsView(input_icon: "house", input_text: "Go Home")
                        QuickButtonsView(input_icon: "phone", input_text: "Call Family")
                    }
                }
            }.frame(height: 100)
            ZStack{
                CellView()
                VStack{
                    Text("Today's Schedule").font(.largeTitle)
                    Text("tap to begin activity")
                }
            }
            ZStack{
                CellView()
                Text("View Historical Activities")
            }.frame(height: 75)
        }.background(Image("Food")).padding(.all)
    }
}
































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
