train_val_test_split <- function(df, 
                                 train_ratio = .6, 
                                 val_ratio = .2, 
                                 test_ratio = .2) {
  n_obs <- nrow(df)
  sample_size_train <- floor (train_ratio * n_obs)
  sample_size_valid <- floor (val_ratio * n_obs)
  sample_size_test <- floor (test_ratio * n_obs)
  
  indices_train <- sort(base::sample(1:n_obs, size = sample_size_train))
  indices_not_train <- setdiff(1:n_obs, indices_train)
  indices_validation <- sort(base::sample(indices_not_train, size = sample_size_valid))
  indices_test <- setdiff(indices_not_train, indices_validation)
  
  train <- df[indices_train, ]
  val <- df[indices_validation, ]
  test <- df[indices_test, ]
  list(train, val, test)
}