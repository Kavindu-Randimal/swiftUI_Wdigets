//
//  Static_widget.swift
//  Static widget
//
//  Created by Randimal Geeganage on 2021-06-15.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WidgetViewView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Image("inbox")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .leading)
                    
                    Text("24")
                        .foregroundColor(.green)
                        .font(.system(size: 10))
                }
                
                Spacer()
                    .frame(width:30)
                VStack{
                    Image("inprocess")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .leading)
                    
                    Text("12")
                        .foregroundColor(.green)
                        .font(.system(size: 10))
                }
                
            }
            
            HStack{
                VStack{
                    Image("completed")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .leading)
                    
                    Text("04")
                        .foregroundColor(.green)
                        .font(.system(size: 10))
                }
                
                Spacer()
                    .frame(width:30)
                VStack{
                    Image("rejected")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .leading)
                    
                    Text("01")
                        .foregroundColor(.green)
                        .font(.system(size: 10))
                }
            }
        }
    }
    
    @main
    
    
    struct Static_widget: Widget {
        let kind: String = "Static_widget"
        
        
        var body: some WidgetConfiguration {
            IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
                WidgetViewView(entry: entry)
            }
            .configurationDisplayName("My Widget")
            .description("This is an example widget.")
            
        }
    }
    
    
    struct Static_widget_Previews: PreviewProvider {
        static var previews: some View {
            WidgetViewView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }


