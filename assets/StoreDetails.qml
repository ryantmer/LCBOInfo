import bb.cascades 1.2

Page {
    property variant data;
    
    function address() {
        var a = data.address_line_1 + ", " + data.city;
        
        return "<html><a href='http://maps.google.com/?q=" + a + "'>" + a + "</a></html>";
    }
    
    function hours(day) {
        if (!data[day + "_open"]) {
            return "CLOSED";
        }
        var open = data[day + "_open"];
        var close = data[day + "_close"];
        
        var oh = (open / 60);
        oh = oh > 12 ? oh - 12 : oh; //Subtract 12 if past 12
        var om = (open % 60) + "0";
        var ot = open / 60 >= 12 ? "PM" : "AM"
        var ch = (close / 60);
        ch = ch > 12 ? ch - 12 : ch; //Subtract 12 if past 12
        var cm = (close % 60) + "0";
        var ct = close / 60 >= 12 ? "PM" : "AM"
        
        return oh + ":" + om + ot + " - " + ch + ":" + cm + ct;
    }
    
    ScrollView {
        scrollViewProperties {
            scrollMode: ScrollMode.Vertical
        }
        Container {
            background: Color.create("#BBCACB")
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            Label {
                text: "Store #" + data.id
                textStyle.fontSize: FontSize.XXLarge
                horizontalAlignment: HorizontalAlignment.Center
            }
            
            //Contact info
            Label {
                text: "Location & Contact"
                textStyle.fontSize: FontSize.XLarge
            }
            Label {
                text: address()
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Phone"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: data.telephone
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Fax"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: data.fax
                }
            }
            
            //Hours
                Label {
                text: "Hours"
                textStyle.fontSize: FontSize.XLarge
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Monday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("monday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Tuesday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("tuesday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Wednesday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("wednesday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Thursday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("thursday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Friday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("friday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Saturday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("saturday")
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Label {
                    text: "Sunday"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    text: hours("sunday")
                }
            }
            
            //Services
            Label {
                text: "Services"
                textStyle.fontSize: FontSize.XLarge
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_parking ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Parking"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_transit_access ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Transit Access"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                    
                ImageView {
                    imageSource: data.has_product_consultant ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Product Consultant"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                    
                ImageView {
                    imageSource: data.has_tasting_bar ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Tasting Bar"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_beer_cold_room ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Beer Cold Room"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_vintages_corner ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Vintages Corner"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_wheelchair_accessability ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Wheelchair Accessible"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_bilingual_services ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Bilingual Services"
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                ImageView {
                    imageSource: data.has_special_occasion_permits ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                    rightPadding: 10
                    preferredHeight: 30
                    preferredWidth: 30
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {
                    text: "Special Occasion Permits"
                }
            }
        }
    }
}
