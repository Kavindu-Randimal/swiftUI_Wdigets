//
//  WidgetView.swift
//  SwiftUI Widgets
//
//  Created by Randimal Geeganage on 2021-06-15.
//

import SwiftUI
import WidgetKit
import Intents


struct WidgetData {
    let weight : Measurement<UnitMass>
    let date : Date
    
}

extension WidgetData {
    static let previewData = WidgetData(weight: Measurement<UnitMass>(value: 1.0, unit: .kilograms), date: Date().advanced(by: (0)))
}

struct WidgetView: View {
    let data: WidgetData
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
            VStack(alignment: .center) {
                WeightView(data: data)
                Spacer()
                LastUpdatedView(data: data)
            }
            .padding(.all)
        }
        
    }
}

struct WeightView: View {
    let data : WidgetData
    var body: some View {
        
        HStack {
            VStack(alignment:.center) {
                Text("Weight")
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text(MeasurementFormatter().string(from:data.weight))
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(0.9)
            }
            Spacer()
        }
        .padding(.all,8)
        .background(ContainerRelativeShape().fill(Color(.black)))
    }
}

struct LastUpdatedView:View {
    let data: WidgetData
    var body: some View{
        VStack(alignment: .leading){
            Text("Last Updated")
                .font(.body)
                .bold()
                .foregroundColor(.white)
            Text("\(data.date, style: .relative) ago")
                .font(.caption)
                .foregroundColor(.white)
        }
    }
    
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
