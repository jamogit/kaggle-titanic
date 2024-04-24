

# Load data
df_train <- read.csv("./data/titanic/train.csv")
df_test <- read.csv("./data/titanic/test.csv")



# Build logistic model
logit_model <- glm(Survived ~ Pclass, data = df_train, family = binomial)

# Summarize model
summary(logit_model)

# Predict
predictions <- predict(logit_model, df_test, type = "response")


# Create results dataframe
output <- data.frame(PassengerId = df_test$PassengerId, Survived = round(predictions))

# Write results to a file
write.csv(output, file = "./data/output/logit_model.csv", row.names = FALSE, quote = FALSE)



