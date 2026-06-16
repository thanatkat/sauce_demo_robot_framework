*** Variables ***
&{checkout_overview_locator}
...    checkout_summary=id=checkout_summary_container
...    product_1_text=xpath=(//div[@class='inventory_item_price'])[1]
...    product_2_text=xpath=(//div[@class='inventory_item_price'])[2]
...    item_total_text=class=summary_subtotal_label
...    tax_text=class=summary_tax_label
...    total_text=class=summary_total_label
...    finish_btn=id=finish
...    item_total_title=Item total    
...    tax_title=Tax
...    total_title=Total
...    title=Checkout: Overview
...    path_url=checkout-step-two.html
...    product_prices=class=inventory_item_price
