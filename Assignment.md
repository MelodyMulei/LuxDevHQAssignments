# Assignment 2  
## Data Analysis Dashboard Project  

### Project Title  
**Jumia Product Performance Dashboard: Analyzing Pricing, Discounts, and Customer Reviews**

---

## Project Objective  
The objective of this project is to design and build an interactive Excel dashboard that analyzes the performance of products listed on Jumia.  

Students will explore how pricing, discounts, reviews, and ratings influence product performance and customer engagement.  

The final dashboard should support data-driven decision-making in an e-commerce context.  

---

## Dataset Overview  
The dataset contains product-level data with the following columns:

- **Product** – Name of the product  
- **Current Price** – Current selling price in Kenyan Shillings (KSh)  
- **Old Price** – Original price before discount in Kenyan Shillings (KSh)  
- **Discount** – Discount percentage applied to the product  
- **Reviews** – Number of customer reviews  
- **Rating** – Average customer rating out of 5  

---

## Data Cleaning and Preparation  

- Check for and handle missing values, especially in the **Reviews** and **Rating** columns  
- Identify and remove duplicate product entries  
- Convert price columns into numeric format by removing `"KSh"`, commas, and text  
  - Use **Text to Columns** (Data tab) or **Find and Replace (Ctrl + H)**  
- Ensure the **Discount** column is numeric and properly formatted as a percentage  
  - Use Find and Replace, `LEFT/RIGHT` functions, or Text to Columns  
- Convert the **Rating** column from text format (e.g., `"4.5 out of 5"`) into numeric values  
- Convert negative reviews to positive  

---

## Data Enrichment  

Create the following additional columns:

### 1. Discount Amount (KSh)  
- `Old Price - Current Price`

### 2. Rating Category  
- **Poor** → Ratings below 3  
- **Average** → Ratings between 3 and 4.4  
- **Excellent** → Ratings of 4.5 and above  

### 3. Discount Category  
- **Low Discount** → Below 20%  
- **Medium Discount** → Between 20% and 40%  
- **High Discount** → Above 40%  

---

## Data Analysis  

### Descriptive Analysis  
- What is the average **current price**, **old price**, **discount percentage**, and **rating**?  
- Which product is the most expensive and which is the least expensive?  
- What is the average rating and discount by **discount category**?  
- How are products distributed across **rating categories**?  

### Trend and Relationship Analysis  
- Analyze the relationship between **discount percentage** and **number of reviews**  
- Analyze the relationship between **rating** and **number of reviews**  
- Determine whether higher discounts lead to increased customer engagement  
- Determine whether higher-rated products tend to have more reviews  

### Product Performance Analysis  
- Identify the **top 10 products with the highest discounts**  
- Identify the **top 10 products with the most reviews**  
- Identify the **top 5 highest-rated** and **bottom 5 lowest-rated products**  
- Compare high-discount and low-discount products based on:
  - Average rating  
  - Number of reviews  

---

## Dashboard Design  

### Dashboard Requirements  
Create a single interactive Excel dashboard containing the following sections:

### 1. Overview  
- Total number of products  
- Average rating  
- Average discount percentage  
- Total number of reviews  

### 2. Product Performance  
- Top products by rating  
- Top products by number of reviews  
- Top products by discount percentage  

### 3. Trend Analysis  
- Visualizations showing:
  - Discount percentage vs reviews  
  - Rating vs reviews  

### 4. Product Categories  
- Breakdown of products by **rating category**  
- Breakdown of products by **discount category**  

---

## Visualization Guidelines  

- Use **Pivot Tables** as the primary data source  
- Use appropriate charts such as:
  - Bar charts  
  - Column charts  
  - Pie or donut charts  
  - Scatter plots  
- Apply **conditional formatting** to highlight:
  - High discounts  
  - Low ratings  
- Include **slicers** for:
  - Rating category  
  - Discount category  
  - Price range (where applicable)  