# EvaluationComparisonApp
Shiny App for Developing Data Products Course

## Documentation of Shiny Application

This is a documentation of Shiny Application "Evaluation Comparison with Radar". You can use this app to see a visual comparison of different features with Radar plot. I created this app to compare evaluations given me as a work evaluation in my current job. 

### What You need?

If you want to use my app you should have some csv document with the data i.e:
```{r, echo=FALSE}
m<-matrix(data = sample(c(1:20), 15), nrow = 5, ncol = 3)
rownames(m) <- c("Thing1","Thing2", "Thing3", "Thing4", "Thing5")
colnames(m) <- c("Feature1","Feature2", "Feature3")
m <- data.frame(m)
m
```


### How to use my app?
1. Choose the csv file with the data.
2. If it is neccessery change the Seperator, it should be the same as you chose in csv file.
3. Then You can choose the evaluator to see their the competence values against others.
4. Have a lot fun =).

