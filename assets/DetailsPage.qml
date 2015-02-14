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
    
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        Label {
            text: "Store Info"
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container {
            Label {
                text: "Address"
            }
            Label {
                text: address();
                multiline: true
            }
        }
    }
}
