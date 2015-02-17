import bb.cascades 1.2

Page {
    property variant data;
    
    function title() {
        return "Store #" + data.id + " information";
    }
    
    function address() {
        var a = "";
        var q = "";
        
        if (data.address_line_1) {
            a += data.address_line_1;
            q += data.address_line_1;
        }
        if (data.address_line_2) {
            a += "\n" + data.address_line_2;
            q += " " + data.address_line_2;
        }
        if (data.city) {
            a += "\n" + data.city;
            q += " " + data.city;
        }
        return "<html><a href='http://maps.google.com/?q=" + q + "'>" + a + "</a></html>";
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
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            Label {
                text: title()
                textStyle.fontSize: FontSize.XXLarge
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                bottomMargin: 50
                Label {
                    text: "Address"
                    textStyle.fontSize: FontSize.XLarge
                }
                TextArea {
                    text: address();
                    editable: false
                }
            }
            Container {
                id: hoursContainer
                bottomMargin: 50
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                horizontalAlignment: HorizontalAlignment.Fill
                
                Label {
                    text: "Hours"
                    textStyle.fontSize: FontSize.XLarge
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
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Wednesday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("wednesday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Thursday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("thursday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Friday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("friday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Saturday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("saturday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
                Container {
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    Label {
                        text: "Sunday"
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    Label {
                        text: hours("sunday")
                        horizontalAlignment: HorizontalAlignment.Right
                    }
                }
            }
        }
    }
}
