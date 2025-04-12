import SwiftUI

struct FlightSearchView: View {
    
    @State private var selectedTab = 0

    var body: some View {
        NavigationStack {
            // Custom Tab Selector with underline effect
            HStack(spacing: 20) {
                TabText(title: "FLIGHTS", tag: 0, selectedTab: $selectedTab)
                TabText(title: "TRAIN", tag: 1, selectedTab: $selectedTab)
                TabText(title: "BUS", tag: 2, selectedTab: $selectedTab)
                TabText(title: "HOTEL", tag: 3, selectedTab: $selectedTab)
            }
            .padding()

            // Tab Content
            TabView(selection: $selectedTab) {
                VStack {
                    ScrollView(.vertical){
                        SearchFormView()
                            .padding(.bottom, 10)
                        
                        MostRecommendedView()
                            .frame(maxWidth: .infinity)
                    }
                }
                .tag(0)


                VStack {
                    Text("🚆 Train View")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .tag(1)


                VStack {
                    Text("🚌 Bus View")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .tag(2)


                Text("🏨 Hotel View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .tag(3)

        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}


struct TabText: View {
    let title: String
    let tag: Int
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(selectedTab == tag ? .bold : .regular)
                .foregroundColor(selectedTab == tag ? Color.black : Color.gray)
                .onTapGesture {
                    selectedTab = tag
                }
            
            // Underline indicator for selected tab
            Rectangle()
                .frame(height: selectedTab == tag ? 2 : 0)
                .foregroundColor(selectedTab == tag ? Color(red: 0.54, green: 0.37, blue: 0.89) : .clear)
                .animation(.easeInOut(duration: 0.2), value: selectedTab)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    FlightSearchView()
}
