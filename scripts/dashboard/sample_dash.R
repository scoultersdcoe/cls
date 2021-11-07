Introduction {data-icon="fa-comment-o"}
=======================================================================
  
  Column {data-width=550}
-----------------------------------------------------------------------
  
  ### What is Predictive Maintenance
  
  Predictive Maintenance is an increasingly popular strategy associated with Industry 4.0; it uses advanced analytics and machine learning to optimize machine costs and output (see Google Trends plot below).

A common use-case for Predictive Maintenance is to proactively monitor machines, so as to predict when a check-up is needed to reduce failure and maximize performance. In contrast to traditional maintenance, where each machine has to undergo regular routine check-ups, Predictive Maintenance can save costs and reduce downtime. A machine learning approach to such a problem would be to analyze machine failure over time to train a [supervised classification model](https://en.wikipedia.org/wiki/Supervised_learning) that predicts failure. Data from sensors and weather information is often used as features in modeling.

With different analysis and modeling techniques, Predictive Maintenance can also optimize asset availability, productivity and output quality, extend machine life, lower safety risks and thus increase customer satisfaction.
Predictive Maintenance is already being used with [wind turbines](http://www.windsystemsmag.com/article/detail/236/predictive-maintenance-strategies), [motor engines](http://www.ecmweb.com/content/preventive-maintenance-motors-and-controls), [cars](https://blog.bosch-si.com/categories/manufacturing/2013/02/iot-and-predictive-maintenance/) and a multitude of other machines. It is often central to [IoT technologies](https://www.forbes.com/sites/bernardmarr/2017/05/05/internet-of-things-and-predictive-maintenance-transform-the-service-industry/#2b430267eaf4).
                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                    ### Google Trends
                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                    ```{r}
                                                                                                                                                                                                                                                                                                                                                                                                                                  renderPlot({
                                                                                                                                                                                                                                                                                                                                                                                                                                    gt %>%
                                                                                                                                                                                                                                                                                                                                                                                                                                      ggplot(aes(x = week, y = predictive_maintenance)) +
                                                                                                                                                                                                                                                                                                                                                                                                                                      geom_smooth() +
                                                                                                                                                                                                                                                                                                                                                                                                                                      geom_line() +
                                                                                                                                                                                                                                                                                                                                                                                                                                      theme_bw() +
                                                                                                                                                                                                                                                                                                                                                                                                                                      labs(title = "Google search requests for 'Predictive Maintenance' over the last 5 years",
                                                                                                                                                                                                                                                                                                                                                                                                                                           x = "", y = "relative number of\nsearch requests")
                                                                                                                                                                                                                                                                                                                                                                                                                                  })
                                                                                                                                                                                                                                                                                                                                                                                                                                  ```
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  Column {data-width=450}
                                                                                                                                                                                                                                                                                                                                                                                                                                  -----------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                    ### Predictive Maintenance and Big Data
                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                    Because Predictive Maintenance relies on large amounts of data collected over long periods of time, [Big Data techniques](https://blog.codecentric.de/category/architektur/big-data/page/2/) are needed.
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  - **Databases**: The first step towards Predictive Maintenance is collecting and storing the data in an efficient and scalable way. There are [many different ways to store Big Data](http://www.computerweekly.com/feature/Big-data-storage-choices), either in the cloud or locally, like [Hadoop](https://blog.codecentric.de/2013/08/einfuhrung-in-hadoop-was-ist-big-data-hadoop-teil-1-von-5/), [AWS](https://www.codecentric.de/2017/04/06/digitalisierung-mit-codecentric-und-aws/) and many more.
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  - **Modeling**: Once the data is collected, machine learning models can be trained. When working with Big Data, we need model scalability and distributed computing. Here, we can e.g. make use of [Apache Spark](https://www.codecentric.de/schulung/apache-spark-einfuehrungsworkshop-fuer-entwickler/) or similar cluster computing services.
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  - **Prediction**: When a suitable model has been trained, it can be used to predict on future data points. With Predictive Maintenance, we generally talk about [(near) real-time analysis](https://blog.codecentric.de/en/2017/03/distributed-stream-processing-frameworks-fast-big-data/).
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  ### Example data
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  This analysis is based on a small example data set for predictive maintenance [(source: Kaggle)](https://www.kaggle.com/ludobenistant/predictive-maintenance).
                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                  The data set describes machine failure of `r nrow(maintenance)` instances: it contains the label "broken" (1 == broken: `r nrow(maintenance[which(maintenance$broken == 1), ])` instances, or `r nrow(maintenance[which(maintenance$broken == 1), ]) / 1000 * 100`%; 0 == not broken: `r nrow(maintenance[which(maintenance$broken == 0), ])` instances, or `r nrow(maintenance[which(maintenance$broken == 0), ]) / 1000 * 100`%) and `r ncol(maintenance) -1` features. A list of all features can be seen in the drop-down menu in the sidebar. 
                                                                                                                                                                                                                                                                                                                                                                                                                                  Feature distribution, correlation and bar plots are shown in the tab [Feature EDA](#section-feature-eda).
                                                                                                                                                                                                                                                                                                                                                                                                                                    To demonstrate a machine learning approach, this dataset was divided into 70% training data, 15% validation data and 15% test data. Predictions for every test case are shown in the tab [Machine Learning](#section-machine-learning).
                                                                                                                                                                                                                                                                                                                                                                                                                                      An exemplary Cox Proportional Hazards survival model is shown in the tab [Survival Analysis](#section-survival analysis).
                                                                                                                                                                                                                                                                                                                                                                                                                                        In order to demonstrate time series forecasting, this data set was augmented with dummy dates generated from the "lifetime" feature (see tab [Time Series Forecasting](#section-time-series-forecasting)).
                                                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                          Sidebar {.sidebar}
                                                                                                                                                                                                                                                                                                                                                                                                                                          =======================================================================
                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                            ### Example data: Machine failure
                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                            Learn more about the data in the [introduction](#section-introduction)
                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                                                                                                              ---
                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                Go to tab [Feature EDA](#section-feature-eda) to explore the distribution of a feature chosen below:
                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                  ```{r}
                                                                                                                                                                                                                                                                                                                                                                                                                                                  selectInput("feature", choices = colnames(maintenance)[-2], label = h4("Feature:"))
                                                                                                                                                                                                                                                                                                                                                                                                                                                  ```
                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                                                  ---
                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                    Go to tab [Machine Learning](#section-machine-learning) to explore the model used for prediction of a test case chosen below.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      ```{r}
                                                                                                                                                                                                                                                                                                                                                                                                                                                      radioButtons("type", "Show predictions for test cases that are labelled...",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                   c("broken" = "1",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     "not broken" = "0"))
                                                                                                                                                                                                                                                                                                                                                                                                                                                      selectInput("clusterNum", choices = "", label = h4("ID of test case:"))
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      observe({
                                                                                                                                                                                                                                                                                                                                                                                                                                                        updateSelectInput(session, "clusterNum",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                          choices = as.character(test_performance$id[test_performance$broken == input$type]))
                                                                                                                                                                                                                                                                                                                                                                                                                                                      })
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      num <- reactive(as.integer(input$clusterNum))
                                                                                                                                                                                                                                                                                                                                                                                                                                                      ```
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      ---
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                        © Shirin Glander
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      codecentric AG, 2017
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      Feature EDA {data-icon="fa-search"}
                                                                                                                                                                                                                                                                                                                                                                                                                                                      =======================================================================
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                        Column {data-width=600}
                                                                                                                                                                                                                                                                                                                                                                                                                                                      -----------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                        ### Exploratory Data Analysis (EDA)
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                        [EDA](https://en.wikipedia.org/wiki/Exploratory_data_analysis) is the first step in every data analysis workflow. It is crucial for understanding the features and for choosing suitable analysis techniques, methods and algorithms.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      Features are the variables that describe data in a data set (its "properties").
                                                                                                                                                                                                                                                                                                                                                                                                                                                      The response variable, or label, of a data set describes the output of interest. Here, for every measurement point we have a label that tells us whether the machine was broken ("1") or not ("0").
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      High-level exploration of the features and how they relate to the response variable can give us an intuitive understanding of major patterns, influencing factors and phenomena. Visualization can further help to get a feel for the data and to communicate main characteristics. Here, I am showing three techniques for EDA: Principal Component Analysis, correlation and distribution or bar plots.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Chosen feature plot:** Choose a feature from the drop-down menu in the sidebar to explore its [density distribution](https://en.wikipedia.org/wiki/Density_estimation) (for numeric variables) or [summary counts](https://en.wikipedia.org/wiki/Bar_chart) (for categorical variables). Numeric variables are plotted with additional information of "team" and "provider" on the y-axis.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Feature correlation plot:** This [correlation](https://en.wikipedia.org/wiki/Correlation_and_dependence) plot shows the relationship between variables: the strength of the correlation is represented by point size and color (negative correlation: blue, positive correlation: pink).
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Principal Component Analysis (PCA):** [PCA]((https://blog.codecentric.de/2017/09/fraud-analyse-mit-data-science-techniken/)) is a dimensionality reduction technique for identifying linear relationships between variables and for finding global patterns in the data. Point color shows whether a machine was broken (pink) or not (blue), while point size shows "lifetime".
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      From the density distribution of the variable "lifetime" (i.e. how old the machine was at the measurement point), we see that most machines break when they are between 60 and 100 days old. Considering the "provider" together with "lifetime", we also find that machines of provider 3 tend to break earlier than machines from provider 1, 2 and 3. Also, machines used by team C have a slightly earlier onset of breaking than with teams A and B. The remaining numeric variables don't show an obvious difference between broken and not-broken machines. Providers 1 and 3 have a few more broken machines than providers 2 and 3.

In the correlation plot, we confirm that the feature which is most strongly correlated with the response variable "broken" is "lifetime". "Team" and "provider" are [one-hot encoded](https://hackernoon.com/what-is-one-hot-encoding-why-and-when-do-you-have-to-use-it-e3c6186d008f) categorical variables and are therefore mutually exclusive, hence the negative correlations between them.

The effect of "lifetime" on the response variable is also clearly visible in the PCA plot, where the variables "lifetime" and "broken" seem to explain the majority of variation in the data.


Column {data-width=400}
-----------------------------------------------------------------------

### Chosen feature plot

```{r}
renderPlot({
  plot_feature(input$feature)
})
```

### Feature correlation plot

```{r}
renderPlot({
  corrplot(cor_m, method = "circle", type = "upper", 
           col = colorRampPalette(c("#00AED2", "darkgrey", "#E61B77"))(100),
           diag = FALSE)
})
```

### Principal Component Analysis (PCA)

```{r}
renderPlot({
  ggplot(df_pca, aes(x = PC1, y = PC2, fill = factor(broken), color = factor(broken), size = lifetime)) +
        geom_point(alpha = 0.5) +
        theme_bw() +
        scale_color_manual(values = c("#00AED2", "#E61B77")) +
        scale_fill_manual(values = c("#00AED2", "#E61B77")) +
        labs(fill = "broken", color = "broken")
}) 
```


Machine Learning {data-icon="fa-search"}
=======================================================================

Column {data-width=500}
-----------------------------------------------------------------------

### Machine Learning

Machine Learning models are used to learn patterns from past data to then apply these learned patterns to unknown or future data.

Here, a model was trained by testing and comparing different algorithms (random forests, gradient boosting, neural networks, stacked ensembles, etc.) using the machine learning framework **[H2O](https://www.h2o.ai/h2o/)**.
**H2O** is an open-source software for machine learning and big data analysis. It is particularly useful for real-time analysis and distributed parallel operations. It is massively scalable and can be seamlessly [integrated with Apache Spark](https://www.h2o.ai/download-2/sparkling-water/). H2O jobs can run on local or cloud-based clusters.

**ROC curve:** The [Receiver Operator Characteristic (ROC)](https://en.wikipedia.org/wiki/Receiver_operating_characteristic) curve shows the predictive performance of a binary classifier and together with sensitivity and specificity can be used to determine the optimal classification threshold, here found to be `r round(cutoff, digits = 2)`.

**Prediction of test case:** This field shows the prediction results for the test case chosen from the drop-down menu in the sidebar. The table shows the test case ID, whether it was labelled as broken, the prediction probability for brokenness, the predicted class based on the optimal cutoff determined before (`r round(cutoff, digits = 2)`) and whether the prediction was correct.

**Performance metrics and model type:** Here, the best model chosen by model comparison is described, together with performance metrics on the validation set: [MSE](https://en.wikipedia.org/wiki/Mean_squared_error), [RMSE](https://en.wikipedia.org/wiki/Root-mean-square_deviation), [mean residual deviance](https://en.wikipedia.org/wiki/Deviance_(statistics)) and [AIC](https://en.wikipedia.org/wiki/Akaike_information_criterion).

[**Confusion matrix:**](http://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/) The confusion matrix shows a comparison of correct and wrong classifications on the entire test data set.

**Fail score:** The fail score is based on the prediction probability from the machine learning model and gives an approximation of how "strongly" this particular test case was classified as broken.

Additional performance metrics for the machine learning model are shown below the fail score: [**accuracy**, **recall**, **precision**](https://en.wikipedia.org/wiki/Precision_and_recall), [**misclassification rate**](https://www.coursera.org/learn/machine-learning/lecture/x62iE/error-analysis) and [**null error rate**](http://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/).


### ROC curve

```{r}
renderPlot({
  data.frame(x = perf_2@x.values[[1]],
           y = perf_2@y.values[[1]]) %>%
  ggplot(aes(x = x, y = y)) +
    geom_line() +
    theme_bw() +
  labs(x = "False positive rate",
       y = "True positive rate")
})
```

Column {data-width=300}
-----------------------------------------------------------------------

### Prediction of chosen test case

```{r}
renderTable({
  test_performance %>%
    .[num(), ] %>%
    t() %>%
    as.data.frame() %>%
    rownames_to_column() %>%
    rename(metric = rowname,
           value = V1)
})
```

### Performance metrics and model type

```{r}
renderTable(perf)
```

### Confusion matrix

```{r}
renderPrint({
  confusion_matrix
})
```

Column {data-width=200}
-----------------------------------------------------------------------

### Fail score of test case {.gauge}

```{r}
renderGauge({
  gauge(round(as.numeric(test_performance[num(), "pred"]) * 100, digits = 2), min = 0, max = 100, symbol = '%', 
      gaugeSectors(danger = c(90, 100), warning = c(50, 89), success = c(0, 50)))
})
```

### Accuracy {.value-box}

```{r}
renderValueBox({
valueBox(round(accuracy, digits = 3), icon = "fa-check", caption = "Accuracy of ML model on test set", color = "danger")
})
```

### Misclassification rate {.value-box}

```{r}
renderValueBox({
valueBox(round(misclassification_rate, digits = 3), icon = "fa-check-circle", caption = "Misclassification rate", color = "primary")
})
```

### Recall {.value-box}

```{r}
renderValueBox({
valueBox(round(recall, digits = 3), icon = "fa-check-circle-o", caption = "Recall", color = "primary")
})
```

### Precision {.value-box}

```{r}
renderValueBox({
valueBox(round(precision, digits = 3), icon = "fa-check-square", caption = "Precision", color = "primary")
})
```

### Null Error Rate {.value-box}

```{r}
renderValueBox({
valueBox(round(null_error_rate, digits = 3), icon = "fa-check-square-o", caption = "Null Error Rate", color = "primary")
})
```

Survival Analysis {data-icon="fa-search"}
=======================================================================

Column {data-width=600}
-----------------------------------------------------------------------

### Time-to-event

As we have seen with [feature EDA](#section-feature-eda), all variables tell us something about when a machine will break. The variable "lifetime" describes a time-to-event and can therefore be used in a [survival analysis](https://en.wikipedia.org/wiki/Survival_analysis) model.

Here, the model was built with the model formula `(lifetime, broken) ~ pressureInd + moistureInd + temperatureInd + team + provider` and fit with a [Cox Proportional Hazards regression model](https://www.r-bloggers.com/cox-proportional-hazards-model/). This means that the time interval "lifetime" and the status indicator "broken" were modeled as additive effects of the remaining predictor variables. This allows us to determine how specific factors (i.e. variables) influence the rate of a particular event (here machine breaking) happening over time. This rate is called the event's hazard.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Survival model:** The summary of the survival model below shows a number of model metrics. Among the most informative is the exponential of the [regression coefficient](https://en.wikipedia.org/wiki/Linear_regression) `exp(coef)`: it describes the [hazard ratio](https://en.wikipedia.org/wiki/Hazard_ratio) (loosely defined as the risk of the event happening at a given time, i.e. the effect size of the co-variate) in relation to the baseline survival curve. A positive regression coefficient means that the hazard is higher for measurements with higher values of that variable; a negative regression coefficient means that the hazard is lower for measurements with higher values. The column "z" shows the Wald statistic value, which is the ratio of each regression coefficient divided by its standard error (z = coef/se(coef)). It is statistically significant with a p-value < 0.05. At the very bottom of the model summary we find additional significance statistics, like likelihood ratio test, score test, etc.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Baseline survival curve:** The baseline survival curve, or baseline hazard function describes the baseline risk. We use it to compare the influence of each modeled variable (its exponential of the regression coefficient) against.
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      **Predictions:** Finally, we can use the survival model to predict the time until breaking for the held out test cases. Because this model was kept very simple, we don't find a sufficient accuracy of prediction. Additional effort would be needed to tweak parameters and improve model performance.

### Survival model

```{r}
renderPrint({
  summary(cox)
})
```

Column {data-width=400}
-----------------------------------------------------------------------

###  Baseline survival curve

```{r}
renderPlot({
  plot(cox_fit, 
     xlab = "Lifespan",
     ylab = "Proportion not broken",
     main = "Baseline Hazard Curve")
})
```

### Predictions

```{r}
renderPlot({
  pred_surv %>%
  ggplot(aes(x = lifetime, y = predicted, color = factor(broken))) +
    geom_smooth(method = "lm") +
    geom_point() +
    theme_bw() +
    scale_color_manual(values = c("#00AED2", "#E61B77")) +
    labs(color = "broken",
         title = "Prediction vs observed lifetime") #,
         #subtitle = paste("RMSE broken:", 
         #                 round(RMSE(pred_surv$pred[pred_surv$broken == 1], pred_surv$lifetime[pred_surv$broken == 1]), digits = 2)))
})
```


Time Series Forecasting {data-icon="fa-search"}
=======================================================================

Column {data-width=400}
-----------------------------------------------------------------------

### Forecasting with Facebook's prophet
                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                      Another way to model machine failure if we have time series data is to use [forecasting](https://en.wikipedia.org/wiki/Time_series). To demonstrate an example, a dummy date variable was created and each numeric feature was forecast into the future 30 days with [Facebook's open-source **prophet** algorithm](https://research.fb.com/prophet-forecasting-at-scale/).
The predicted future values were then used as test cases with the same machine learning model used in the section about [Machine Learning](#section-machine-learning) to predict when a machine is likely to break.

**Prophet** shines particularly with smaller time series and when human-level influences are likely (holidays, seasonal, weekly or yearly rhythms, etc.).
Facebook [describes prophet as follows](https://research.fb.com/prophet-forecasting-at-scale/):

"At its core, the Prophet procedure is an additive regression model with four main components:

- A piece-wise linear or logistic growth curve trend. Prophet automatically detects changes in trends by selecting change-points from the data.
- A yearly seasonal component modeled using Fourier series.
- A weekly seasonal component using dummy variables.
- A user-provided list of important holidays."

Other forecasting techniques like [moving averages, ARIMA or ARFIMA](https://en.wikipedia.org/wiki/Time_series) models could alternatively.

**Forecast plot for one exemplary feature:** Here, the forecast plot for one exemplary variable is shown. Black dots show the values measured in the data set, while the blue line shows the regression curve with forecast values (and confidence intervals) for the upcoming 30 days.

**Prediction based on forecast:** This plot shows the predictions for the future 30-day period, i.e. it tells us which test case is likely to break in the upcoming 30 days and should therefore be checked soon. The horizontal line depicts the optimal cutoff threshold chosen in the section about [Machine Learning](#section-machine-learning).

Column {data-width=600}
-----------------------------------------------------------------------

### Forecast plot for one exemplary feature

![](prophet_plot.png)

### Prediction based on forecast

```{r}
renderPlot({
  predict_future %>%
  ggplot(aes(x = 1:nrow(.), y = pred, color = pred_class)) +
    geom_point() +
    geom_hline(yintercept = cutoff) +
    theme_bw() +
    scale_color_manual(values = c("#00AED2", "#E61B77")) +
    labs(x = "future test case ID",
         y = "prediction probability")
})
```

```{r eval=FALSE}
rsconnect::deployApp("/Users/shiringlander/Documents/Github/Demos/demo_pred_maint/demo_dashboard_pred_maint_fast/")
```