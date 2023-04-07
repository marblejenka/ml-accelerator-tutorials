<h1><span style="color:#2d7eea">README - Machine Learning Accelerator Tutorials</span></h1>

<h2><span style="color:#2d7eea">Overview</span></h2>

This Looker Block defines Explores based on several BigQuery public datasets and is intended to demonstrate how business analysts can use the **Machine Learning Accelerator** (available for download through [Looker Marketplace](/marketplace/view/bqml-ext)) to access BigQuery and Vertex AI's machine learning capabilities. The data that powers the block is only available in BigQuery and will work with any Looker instance with an existing BigQuery connection.

><font size = "3"><font color = "red"> <i class='fa fa-exclamation-triangle'></i><b>Note, in order to use these Explores with the Machine Learning Accelerator application, this model must be configured to use the same BigQuery connection as the application.

<h2><span style="color:#2d7eea">Machine Learning Accelerator</span></h2>

The ML Accelerator is a purpose-built Looker application designed to give business users access to BigQuery and Vertex AI's machine learning capabilities. It provides a user-friendly interface designed to guide the user through each step of creating a machine learning model. Because of its simple, no-code interface, the application serves as a pathway for business analysts to learn and use predictive analytics in Looker. From Looker, download the application [here](/marketplace/view/bqml-ext).

View the [ML Model Creation Flow](https://github.com/looker-open-source/app-ml-accelerator/blob/main/ML%20Model%20Creation%20Flow.md) document for an example of an end-to-end user journey.

To install the ML Accelerator application follow these [installation instructions](https://github.com/looker-open-source/app-ml-accelerator/blob/main/README.md).

Report bugs or feature requests with [this form](https://docs.google.com/forms/d/e/1FAIpQLSd97ptoU3TUuasZeFjSBHT9FQiyrDzjHUm7NTspEjz5kwNSAA/viewform). Contact [ml-accelerator-feedback@google.com](mailto:ml-accelerator-feedback@google.com) with questions or comments.

---

### ML ACCELERATOR TUTORIAL INSTALLATION INSTRUCTIONS


#### 1. Installation Options

The Looker Block can be installed directly from [Looker Marketplace](https://marketplace.looker.com/) (recommended) or manually installed following the steps below.

  **Option A: Marketplace Install**

  Refer to the [Looker Docs for installing a tool from Marketplace](https://cloud.google.com/looker/docs/marketplace#installing_a_tool_from_the_marketplace). Select the BigQuery connection name chosen in Step 1 during installation.

  **Option B: Manual Install**
  - [Fork this GitHub repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository)
  - [Create a blank LookML project](https://cloud.google.com/looker/docs/create-projects#creating_a_blank_project)
  - [Connect the blank LookML project to the new fork repository](https://cloud.google.com/looker/docs/setting-up-git-connection)
  - Update the value of the CONNECTION_NAME constant in the `manifest.lkml` file
  - [Commit and deploy changes to production](https://cloud.google.com/looker/docs/version-control-and-deploying-changes#getting_your_changes_to_production)

#### 2. Choose a BigQuery Connection

To use with the ML Accelerator application, you will need to select the same BigQuery connection used for the application. Only Looker Explores using the same connection as the application will be accessible from within the application.


---

### EXPLORES

The following Explores can be used to demonstrate use of the ML Accelerator application.



  | **Explore Name**                  | **Description**                             | **Tutorial** |
  |-----------------|--------------------------------------------|----|
  | [Purchase Propensity (E-Commerce)](https://pantheon.corp.google.com/marketplace/product/obfuscated-ga360-data/obfuscated-ga360-data)                    | The dataset provides 12 months (August 2016 to August 2017) of obfuscated Google Analytics 360 data from the Google Merchandise Store, a real ecommerce store that sells Google-branded merchandise, in BigQuery. This Explore provides behaviors and other attributes about the visitor collected during first visit to the website. Features like device type, time on site, last step reached during checkout process, visitor source, and country are included. The `Dataframe` dimension divides the dataset into **Train** (first 10 months of data) and **Predict** (last 1 month of data). The dimension `Will Buy on Return Visit` provides labeled examples as to whether the customer made a purchase during return visit or not. With this dataset, you can build an ML model to get the probability of future purchase based on the data gleaned about a customer's first session. | Create a `classification` model to predict the probability that a first-time visitor to the Google Merchandise Store will make a purchase in a later visit. Note, with the training data the labeled examples are imbalanced. Recommend editing the model settings to set the **Auto Class Weights** to _True_ in order to balance the class weights. Then apply the model to a new set of data to make predictions. Identifying these high-value users can help your marketing team to target them with special promotions and ad campaigns to ensure a conversion while they comparison shop between visits to the ecommerce site.  |
  | [Census Income](https://pantheon.corp.google.com/bigquery/analytics-hub/exchanges(analyticshub:projects/1057666841514/locations/us/dataExchanges/google_cloud_public_datasets_17e74966199/listings/372e6bee11a54d0c83738d9c1e0fc461)) | This Explore contains the demographic and income information of US residents from 2000 and 2010. The data includes employment status, job category, level of education, and income data. Census participants fall into one of two income brackets: <=50K or >50K. The `Dataframe` dimension divides the dataset into Train (90%) and Predict (10%).  |  Create a `classification` model to predict whether a US Census respondent's income falls into one of two ranges based on the respondent's demographic attributes. |
  | [Penguins](https://pantheon.corp.google.com/bigquery?p=bigquery-public-data&d=ml_datasets&t=penguins&page=table&_ga=2.119486729.1676501336.1679369074-1395295061.1678222032) | This Explore provides attributes like weight, sex, flipper length for over 340 penguins across three species. The `Dataframe` dimension divides the dataset into `train` and `predict`. | Create a `regression` model that predicts the weight (body mass) of a penguin based on the penguin's species, island of residence, culmen length and depth, flipper length, and sex where `Dataframe` equals **train**. Then use the model to predict weight for an unseen set of penguins where `Dataframe` equals **predict**. |
  | [Machine Failure](https://www.kaggle.com/c/predictive-maintenance) | The data for this Explore originates from Kaggle and has been loaded into a public BigQuery dataset. The `Dataframe` column divides the data into **Train** and **Predict** datasets. This dataset contains two labeled dimensions. `Machine Failure` provides _Yes_ or _No_ values and can be used for a binary classification model. The dimension 'Failure Type' indicates different categories of failure, such as heat, power, overstrain, random or no failure. Use `Failure Type` to create a multiple classification model.  | Create a `classification` model to understand key drivers behind machine failure and predict likelihood a machine will fail given remaining-use-of-life metrics. The target or labeled column with known outcomes of machine failure are in the column `Machine Failed` or `Failure Type`, so choose only one of these to model. |
  | [Telco Customer Churn](https://www.kaggle.com/c/customer-churn-prediction-2020/data) | This Explore is based on a Kaggle dataset which has been loaded into a public BigQuery dataset. The `Dataframe` column divides the data into **Train** and **Predict** datasets. The training dataset contains over 4,000 telco customers with 19 features (international plan, voice mail plan, total service calls, etc...). About 14% of the training dataset have canceled service (see `Churn (Yes/No)` dimension). | Create `classification` model to predict likelihood a customer will cancel telco service given account activity and other characteristics. |
