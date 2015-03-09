import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: detailsPage
            content: ProductDetails {}
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
                dataModel: resultsModel
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        Container {
                            id: itemContainer
                            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                            
                            Container {
                                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                                topPadding: 20
                                bottomPadding: topPadding
                                leftPadding: topPadding
                                rightPadding: topPadding
                                
                                WebView {
                                    id: webView
                                    url: ListItemData.image_thumb_url
                                    minWidth: 120
                                    minHeight: 160
                                    preferredHeight: 160
                                    preferredWidth: 120
                                    rightMargin: 20
                                }
                                Label { //Non-sale label
                                    text: ListItemData.name + "\n" +
                                    ListItemData.package + "\n" +
                                    itemContainer.ListItem.view.price(ListItemData.price_in_cents)
                                    multiline: true
                                    visible: !ListItemData.has_limited_time_offer
                                    verticalAlignment: VerticalAlignment.Center
                                }
                                Label { //Sale label
                                    text: "<html>" + ListItemData.name + "\n" +
                                    ListItemData.package + "\n" +
                                    "<span style='text-decoration:line-through'>" +
                                    itemContainer.ListItem.view.price(ListItemData.regular_price_in_cents) +
                                    "</span>  <span style='color:red'>" +
                                    itemContainer.ListItem.view.price(ListItemData.price_in_cents) +
                                    "</span></html>"
                                    multiline: true
                                    visible: ListItemData.has_limited_time_offer
                                    verticalAlignment: VerticalAlignment.Center
                                }
                            }
                            Divider {
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                            }
                        }
                    }
                ]
                onTriggered: {
                    var data = dataModel.data(indexPath);
                    var page = detailsPage.createObject();
                    page.data = data;
                    navPane.push(page);
                }
                function price(price_in_cents) {
                    var price = price_in_cents / 100;
                    if (price_in_cents % 100 == 0) {
                        price += ".00"
                    } else if (price_in_cents % 10 == 0) {
                        price += "0"
                    }
                    return "$" + price
                }
            }
        }
    }
}
