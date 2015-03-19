import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: detailsPage
            content: StoreDetails {}
        }
    ]
    
    Container {
        layout: DockLayout {}
        
        Container {
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            
            Label {
                text: "No results"
                textStyle.fontSize: FontSize.XLarge
                visible: listView.dataModel.empty
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
            }
            ListView {
                id: listView                
                layout: StackListLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                dataModel: storesModel
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        Container {
                            id: itemContainer
                            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                            
                            Container {
                                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                                topPadding: 10
                                rightPadding: topPadding
                                leftPadding: topPadding
                                
                                Container {
                                    layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                                    layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                                    
                                    Label {
                                        text: "<html>Store #" + ListItemData.id + " - " +
                                        itemContainer.ListItem.view.openClosed(ListItemData) + "</html>"
                                        textStyle.fontSize: FontSize.Medium
                                        verticalAlignment: VerticalAlignment.Center
                                    }
                                    Label {
                                        text: ListItemData.address_line_1 + "\n" +
                                        ListItemData.city
                                        multiline: true
                                        verticalAlignment: VerticalAlignment.Center
                                    }
                                }
                                Label {
                                    text: ListItemData.distance_in_meters / 1000 + "km"
                                    visible: ListItemData.distance_in_meters != undefined
                                    verticalAlignment: VerticalAlignment.Center
                                }
                            }
                            Divider {}
                        }
                    }
                ]
                onTriggered: {
                    var data = dataModel.data(indexPath);
                    var page = detailsPage.createObject();
                    page.data = data;
                    navPane.push(page);
                }
                function openClosed(data) {
                    var datetime = new Date();
                    var day = datetime.getDay();
                    var minsSinceMidnight = datetime.getHours() * 60 + datetime.getMinutes();
                    var open, close;
                    
                    switch (day) {
                        case 0:
                            open = data.sunday_open;
                            close = data.sunday_close;
                            break;
                        case 1:
                            open = data.monday_open;
                            close = data.monday_close;
                            break;
                        case 2:
                            open = data.tuesday_open;
                            close = data.tuesday_close;
                            break;
                        case 3:
                            open = data.wednesday_open;
                            close = data.wednesday_close;
                            break;
                        case 4:
                            open = data.thursday_open;
                            close = data.thursday_close;
                            break;
                        case 5:
                            open = data.friday_open;
                            close = data.friday_close;
                            break;
                        case 6:
                            open = data.saturday_open;
                            close = data.saturday_close;
                            break;
                        default:
                            break;
                    }
                    
                    if (minsSinceMidnight < close && minsSinceMidnight > open) {
                        return "<span style='color:green'>OPEN</span>";
                    } else {
                        return "<span style='color:red'>CLOSED</span>";
                    }
                }
            }
        }
    }
}
