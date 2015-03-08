import bb.cascades 1.2

Page {
    property variant data: {}
    
    Container {
        Label {
            text: data.name
        }
    }
}
