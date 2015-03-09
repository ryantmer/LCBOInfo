import bb.cascades 1.2
import bb.system.phone 1.0

Page {
    property variant data: {}
    attachedObjects: [
        Phone {
            id: phone
        },
        Invocation {
            id: mapInvoke
            query.mimeType: "text/plain"
            query.invokeActionId: "bb.action.OPEN"
            query.invokeTargetId: "sys.browser"
            onArmed: {
                mapInvoke.trigger(mapInvoke.query.invokeActionId);
            }
        }
    ]
    
    function mapLink() {
        var a = data.address_line_1 + ", " + data.city;
        return "http://maps.google.com/?q=" + a;
    }
    function hours(day) {
        if (!data[day + "_open"]) {
            return "CLOSED";
        }
        var open = data[day + "_open"];
        var close = data[day + "_close"];
        
        var oh = parseInt(open / 60);
        oh = oh > 12 ? oh - 12 : oh; //Subtract 12 if past 12
        var om = (open % 60);
        om = om == 0 ? om + "0" : om; //Add trailing zero if required
        var ot = open / 60 >= 12 ? "PM" : "AM"
        var ch = parseInt(close / 60);
        ch = ch > 12 ? ch - 12 : ch; //Subtract 12 if past 12
        var cm = (close % 60);
        cm = cm == 0 ? cm + "0" : cm; //Add trailing zero if required
        var ct = close / 60 >= 12 ? "PM" : "AM"
        
        return oh + ":" + om + ot + " - " + ch + ":" + cm + ct;
    }
    
    Container {
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                topPadding: 20
                rightPadding: topPadding
                bottomPadding: topPadding
                leftPadding: topPadding
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                
                Label {
                    text: data.address_line_1
                    multiline: true
                    textStyle.fontSize: FontSize.XLarge
                    horizontalAlignment: HorizontalAlignment.Center
                }
                //Hours
                Label {
                    text: "Hours"
                    textStyle.fontSize: FontSize.Large
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
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
                    textStyle.fontSize: FontSize.Large
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_parking ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Parking"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_transit_access ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Transit Access"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_product_consultant ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Product Consultant"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_tasting_bar ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Tasting Bar"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_beer_cold_room ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Beer Cold Room"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_vintages_corner ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Vintages Corner"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_wheelchair_accessability ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Wheelchair Accessible"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_bilingual_services ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Bilingual Services"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    
                    ImageView {
                        imageSource: data.has_special_occasion_permits ?
                        "asset:///images/yes.png" : "asset:///images/no.png"
                        rightMargin: 10
                        preferredHeight: 30
                        preferredWidth: 30
                        verticalAlignment: VerticalAlignment.Center
                    }
                    Label {
                        text: "Special Occasion Permits"
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                //Location and contact
                Label {
                    text: "Location & Contact - Store #" + data.id
                    textStyle.fontSize: FontSize.Large
                }
                Button {
                    text: "Map it!"
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: {
                        mapInvoke.query.uri = mapLink();
                        mapInvoke.query.updateQuery();
                    }
                }
                Button {
                    text: data.telephone
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: {
                        phone.initiateCall(data.telephone);
                    }
                }
            }
        }
    }
}
