import bb.cascades 1.2

Page {
    property variant data;
    
    function address() {
        var a = data.address_line_1;
        if (data.address_line_2) {
            a += "\n" + data.address_line_2;
        }
        if (data.postal_code) {
            a += "\n" + data.postal_code;
        }
        return a;
    }
    
    function hours(day) {
        if (!data[day + "_open"]) {
            return "CLOSED";
        }
        var open = data[day + "_open"];
        var close = data[day + "_close"];
        
        var oh = (open / 60) % 12;
        var om = (open % 60) + "";
        var ot = open / 60 >= 12 ? "PM" : "AM"
        var ch = (close / 60) % 12;
        var cm = (close % 60) + "";
        var ct = close / 60 >= 12 ? "PM" : "AM"
        
        return oh + ":" + om + ot + "-" + ch + ":" + cm + ct;
    }
    
    Container {
        layout: DockLayout {}
        background: Color.create("#BBCACB")
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top
            
            Label {
                text: "Store Info"
                textStyle.fontSize: FontSize.XLarge
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                bottomMargin: 50
                Label {
                    text: "Address"
                }
                Label {
                    text: address();
                    multiline: true
                }
            }
            Container {
                bottomMargin: 50
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    text: "Hours"
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Monday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("monday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Tuesday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("tuesday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
            }
        }
    }
}
