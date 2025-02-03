
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
    - Run the SQL queries stored in extract_bq.sql inside BigQuery Project. It will fetch data from GA4 and Magento2.
    - Place the fetched files in the `data/` folder as shwon in each Query comment

2. **Clean data**
    - Open and run the first cells in the notebook `viz_generator_bq.ipynb`.
    - Look at the first outputs, you will be able to filter:
        - select domain names to filter out (test, client email, etc)
        - select product categories to keep (category0, category1, etc)
        - select order status to filter out (canceled, refund, etc)

3. **Generate Visualizations**
    - Open and run all followng cells in the notebook `viz_generator_bq.ipynb`.
    - Copy and paste all generated charts and tables into your analysis.


Now, you can use a report template to add those tables and charts and comment each of them.
Report example: https://docs.google.com/document/d/1mJi98MuDFS0rKY9QmGnxF_U4ABjRfPqt1NBQtOw7Bak/edit?tab=t.0




## Notes
    - Open and run the notebook `xml_to_csv.ipynb` to convert Magento (M2) data from XML to CSV format.


Contact alexandre.kocev@scandiweb if any questions.