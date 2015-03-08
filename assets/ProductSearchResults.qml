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
        background: Color.create("#BBCACB");
        
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
                            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                            topPadding: 20
                            bottomPadding: topPadding
                            leftPadding: topPadding
                            rightPadding: topPadding
                            
                            WebView {
                                url: ListItemData.image_thumb_url
                                minWidth: 120
                                minHeight: 160
                                preferredHeight: 160
                                preferredWidth: 120
                                rightMargin: 20
                            }
                            Container {
                                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                                
                                Label {
                                    text: ListItemData.name + "\n" +
                                        ListItemData.package + "\n" +
                                        itemContainer.ListItem.view.price(ListItemData.price_in_cents)
                                    multiline: true
                                    verticalAlignment: VerticalAlignment.Center
                                }
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
