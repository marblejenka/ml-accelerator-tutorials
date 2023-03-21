<h1><span style="color:#2d7eea">README - Machine Learning Accelerator Tutorials</span></h1>

<h2><span style="color:#2d7eea">Overview</span></h2>

This Looker Block defines Explores based on several BigQuery public datasets and is intended to demonstrate how business analysts can use the **Machine Learning Accelertor** to access BigQuery and Vertex AI's machine learning capabilities. The data that powers the block is only available in BigQuery and will work with any Looker instance with an existing BigQuery connection. Note, in order to use these Explores with the Machine Learning Accelerator application, this model must be configured to use the same BigQuery connection as the application.

<h2><span style="color:#2d7eea">Machine Learning Accelerator</span></h2>

The ML Accelerator is a purpose-built Looker application designed to give business users access to BigQuery and Vertex AI's machine learning capabilities. It provides a user-friendly interface designed to guide the user through each step of creating a machine learning model. Because of its simple, no-code interface, the application serves as a pathway for business analysts to learn and use predictive analytics in Looker.

View the [ML Model Creation Flow](https://github.com/looker-open-source/app-ml-accelerator/blob/main/ML%20Model%20Creation%20Flow.md) document for an example of an end-to-end user journey.

To install the ML Accelerator application follow these [installation instructions](https://github.com/looker-open-source/app-ml-accelerator/blob/main/README.md)

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

  | **Explore Name**                  | **Description**                             | **Tutorial**
  |---------------------------------------------------|-----------------------------------------------------------|
  | [NYC Citi Bike Trips](https://pantheon.corp.google.com/marketplace/product/city-of-new-york/nyc-citi-bike)       | Citi Bike is the nation's largest bike share program, with 10,000 bikes and 600 stations across Manhattan, Brooklyn, Queens, and Jersey City. This dataset includes Citi Bike trips since Citi Bike launched in September 2013 and is updated daily. The data has been processed by Citi Bike to remove trips that are taken by staff to service and inspect the system, as well as any trips below 60 seconds in length, which are considered false starts. | use to ????? |
  | [Purchase Propensity with Google Analytics](https://pantheon.corp.google.com/marketplace/product/obfuscated-ga360-data/obfuscated-ga360-data)                    | The dataset provides 12 months (August 2016 to August 2017) of obfuscated Google Analytics 360 data from the Google Merchandise Store , a real ecommerce store that sells Google-branded merchandise, in BigQuery. This Explore provides bounces (did customer leave site immediately) and time on site during a customer's first visit to merchandise site. It also includes labeled examples as to whether the customer made a purchase during return visit. With this dataset, you can build an ML model is to get the probability of future purchase based on the data gleaned about their first session.         | Create a Machine Learning model with ML Accelerator to predict whether or not a new user is likely to purchase in the future. Identifying these high-value users can help your marketing team to target them with special promotions and ad campaigns to ensure a conversion while they comparison shop between visits to the ecommerce site.  |
  | [Census Adult Income](https://pantheon.corp.google.com/bigquery/analytics-hub/exchanges(analyticshub:projects/1057666841514/locations/us/dataExchanges/google_cloud_public_datasets_17e74966199/listings/372e6bee11a54d0c83738d9c1e0fc461)) | This Explore contains the demographic and income information of US residents from 2000 and 2010. The data includes employment status, job category, level of education, and income data. Census participants fall into one of two income brackets: <=50K or >50K. The dataframe column divides the dataset into Training (80%), Evaluation (10%) and Prediction (10%).  |  Create a classification model to predict whether a US Census respondent's income falls into one of two ranges based on the respondent's demographic attributes. |
