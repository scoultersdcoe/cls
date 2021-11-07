

### Satisfaction
```{r}
h1 <- cls_results %>% group_by(satisfied) %>% 
  dplyr::summarise(count=n())

p1 <- plot_ly(type = "bar", 
              data = h1,
              x = h1$satisfied, 
              y = h1$count, 
              color = h1$satisfied, 
              text = paste(h1$count), 
              hoverinfo = "text") %>%
  layout(xaxis = list(showline = F, 
                      showticklabels = F, 
                      fixedrange = T, 
                      title = ""),
         yaxis = list(fixedrange = T, 
                      title = ""))
p1

Row
----------------------------------
  
  ### Movement by month
  ```{r}
h1=global %>% group_by(Month,`Type of movement`) %>% 
  summarise(count=n())
p1=plot_ly(data = h1,
           x=h1$Month,
           y=h1$count) %>% 
  add_lines(linetype = h1$`Type of movement`,
            data = h1$count,
            hoverinfo="text",
            text=paste(h1$count)) %>% 
  layout(xaxis=list(title="Month"),
         yaxis=list(title="Count")) 
p1
```

### Movement by Region
```{r}
#Count by month, entry/exit and country
h2=global %>% 
  group_by(Month,`Type of movement`,Country) %>% 
  summarise(count=n())
#Add long/lat info based on country name from countr_coor
h2=left_join(h2,country_coor[,2:4],by=c("Country"="name"))
#h2 is the table where I want the info
#country_coor[,2:4] selects only long, lat and name columns
# so that I can only add the long and lat cols to h2 after the join
#by=c() identifies the keys in both dataframes
p2=plot_geo(h2,locationmode="world") %>% 
  add_markers(x=h2$longitude,
              y=h2$latitude,
              size=h2$count,
              color=h2$`Type of movement`,
              hoverinfo="text",
              hovertext=paste(h2$`Type of movement`,": ",h2$count)) %>% 
  layout()
p2


Column {.tabset data-width=400}
-----------------------------------------------------------------------
  
  ### Sales by Category
  
  ```{r, fig.keep='none'}
data("Groceries", package = "arules")
dfitems <- tbl_df(Groceries@itemInfo)

set.seed(10)

dfitemsg <- dfitems %>%
  mutate(category = gsub(" ", "-", level1),
         subcategory = gsub(" ", "-", level2)) %>%
  group_by(category, subcategory) %>% 
  dplyr::summarise(sales = n()^3) %>% 
  ungroup() %>% 
  sample_n(31)

tm <- treemap(dfitemsg, index = c("category", "subcategory"),
              vSize = "sales", vColor = "sales",
              type = "value", palette = rev(viridis(6)))

highchart() %>% 
  hc_add_series_map(tm, allowDrillToNode = TRUE,
                    layoutAlgorithm = "squarified") %>% 
  hc_add_theme(thm)
```