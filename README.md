
# Revenue Analysis

This project involves fetching data from Magento and Google Analytics 4 (GA4) to perform revenue analysis.


## How to Run

1. **Clone the Repository**
    ```sh
    git clone https://github.com/alexkocev/revenue_analysis.git
    cd revenue_analysis
    ```

2. **Create a Virtual Environment**
    ```sh
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. **Install Requirements**
    ```sh
    pip install -r requirements.txt
    ```


## Steps to Follow

1. **Fetch Data**
    - Follow the instructions provided [here](https://www.notion.so/scandiweb/Revenue-Analysis-and-POC-173c346d72c0801691eaced7b18864db?pvs=4#17ac346d72c08052a4f0d1814abfbe69) to fetch Magento and GA4 data.
    - Place the fetched files in the `data/` folder.

2. **Convert Magento Data**
    - Open and run the notebook `xml_to_csv.ipynb` to convert Magento (M2) data from XML to CSV format.
    - Note: GA4 data is already in CSV format.

3. **Generate Visualizations**
    - Open and run all cells in the notebook `viz_generator.ipynb`.
    - Copy and paste all generated charts and tables into your analysis.

## Folder Structure

```
/data
  - magento_data.xml
  - ga4_data.csv
/xml_to_csv.ipynb
/viz_generator.ipynb
```