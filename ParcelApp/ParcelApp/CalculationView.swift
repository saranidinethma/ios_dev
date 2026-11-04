//
//  CalculationView.swift
//  ParcelApp
//
//  Created by sarani dinethma on 2026-11-04.
//

import SwiftUI



struct CalculationView: View {
    
    @State private var isInsured: Bool = false
    @State private var insuaranceValue = 0.0
    
    @State private var weight: Double? = 10
    @State private var length: Double? = 10
    @State private var width: Double? = 10
    @State private var height: Double? = 10
    
    @State private var result: Double?
    
    private var volume: Double {
        (length ?? 0) * (width ?? 0) * (height ?? 0)
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Parcel Setup") {
                    Toggle(isOn: $isInsured) {
                        if isInsured {
                            Label("Business (Insured)", systemImage: "suitcase")
                                .foregroundStyle(.purple)
                                .fontWeight(.bold)
                        } else {
                            Label("Personal (Uninsured)", systemImage: "person")
                                .foregroundStyle(.blue)
                                .fontWeight(.bold)
                        }
                    }
                    
                    if isInsured {
                        VStack {
                            HStack {
                                Text("Insuarance Cover")
                                
                                Spacer()
                                
                                Text(String(format : "%.2f", insuaranceValue))
                                
                            }
                            Slider(value: $insuaranceValue, in: 0...100, step: 5)
                        }
                    }
                }
                
                Section("Dimensions & Weight") {
                    
                    ReusableTextFieldView(label: "Weight (Kg)", value: $weight)
                    
                    ReusableTextFieldView(label: "Length (cm)", value: $length)
                    
                    ReusableTextFieldView(label: "Width (cm)", value: $width)
                    
                    ReusableTextFieldView(label: "Height (cm)", value: $height)
                    
                }
                
                Section {
                    Button {
                        calculateCost()
                    } label: {
                        Text("Calculate Cost")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                if let unwrappedResult = result {
                    Section ("Results") {
                        HStack {
                            Text("Total Cost")
                            
                            Spacer()
                            
                            // 3 ways
                            /*
                             if let
                             guard let
                             force unwrap (!)
                             */
                            
                            
                            Text(String(format : "%.2f", unwrappedResult))
                        }
                    }
                }
                
                
                }
            }
            .navigationTitle("Parcel Cost")
        }
    
    private func personalCost(weight: Double, volume: Double) -> Double {
        let total = 3.00 + (weight * 0.50) + ((volume/1000)*0.10)
        
        return max (total, 4.00)
        
    }
    
    private func businessCost(weight: Double, volume: Double, insurance: Double) -> Double {
        5.00 + (weight * 1.50) + ((volume / 1000) * 0.75) + insurance
    }
    
    private func calculateCost() {
        guard let weight else { return }

        if isInsured {
            result = businessCost(weight: weight, volume: volume, insurance: insuaranceValue)
        } else {
            result = personalCost(weight: weight, volume: volume)
        }
    }
    
}

#Preview {
    CalculationView()
}
