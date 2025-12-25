# Instamart Product Scraping

## Approach

- Selenium with Python is used to automate the Swiggy Instamart website.
- Delivery pincode is set first to load location-specific products.
- Product keywords (e.g., Shampoo, Face Wash) are searched one by one.
- Products load dynamically, so page scrolling is used to load more items.
- Product details are extracted from each product card.
- Final data is saved into a CSV file using Pandas.

## Performance Considerations

- Explicit waits are used to handle dynamic page loading.
- Small delays are added to avoid website errors and timeouts.
- Scrolling is limited to required times to reduce load.
- Basic exception handling prevents script failure during scraping.

## Data Extracted

- Product Name  
- Brand (if available)  
- Price  
- Platform (Instamart)  
- Search Keyword  
- Pincode  

## Tools Used

- Python  
- Selenium  
- Pandas  
- Chrome WebDriver  

## Notes

- Website structure changes may require XPath updates.
- Excessive scraping may trigger rate limits.
