//
//  HomeView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        TabView(selection: $vm.selectedTab) {
            CalculatorView()
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign")
                        Text("Calculator")
                    }
                }
                .tag(0)
                
            TaxRateLookupView()
                .tabItem {
                    VStack {
                        Image(systemName: "location.magnifyingglass")
                        Text("Tax Rate Lookup")
                    }
                }
                .tag(1)
        }
        .accentColor(.theme.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(dev.homeVM)
        }
    }
}
