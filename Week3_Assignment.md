Week3_Assignment
========================================================
author: Danielle Hu
date: 2017-01-10
autosize: true

Fuel Economy for Cars -- Gas Mileage vs Other Factors
========================================================


```r
library("plotly")
data("mtcars")
mtcars$cyl <- as.factor(paste(mtcars$cyl," ", "cyl"))
p <- plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~cyl, 
        size = ~hp, text = ~paste0("Cylinder: ", cyl, '<br>Hp: ', hp) ) 
htmlwidgets::saveWidget(as.widget(p), file = "Week3_Assignment2.html")
```

Fuel Economy for Cars -- Gas Mileage vs Other Factors (Continue)
========================================================
<iframe src="Week3_Assignment2.html" style="position:absolute;height:100%;width:100%"></iframe>
