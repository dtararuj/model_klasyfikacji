library(keras)

max_len<-500
max_features<-2000

imdb<-dataset_imdb(num_words = max_features)

c(c(x_train, y_train), c(x_test, y_test)) %<-% imdb

x_train<- pad_sequences(x_train, maxlen = max_len)
x_test<-pad_sequences(x_test, maxlen = max_len)

dir.create("C:/Users/Dawid/Documents/my_log_dir3")

tensorboard("C:/Users/Dawid/Documents/my_log_dir3")

model <-keras_model_sequential() %>% 
  layer_embedding(input_dim = max_features, output_dim = 128, input_length = max_len, name="embed") %>% 
  layer_conv_1d(filters = 32, kernel_size = 7, activation = "relu") %>% 
  layer_max_pooling_1d(pool_size = 5) %>% 
  layer_conv_1d(filters = 32, kernel_size = 7, activation = "relu") %>% 
  layer_global_max_pooling_1d() %>% 
  layer_dense(units=1)

callbacks_list<-list(
  callback_early_stopping(
    monitor = "acc",
    patience = 1),
  callback_model_checkpoint(
    filepath = "C:/Users/Dawid/Documents/my.model.h5",
    monitor="val_loss",
    save_best_only = TRUE),
  callback_reduce_lr_on_plateau(
    monitor="val_loss",
    factor=0.1,
    patience=10),
  callback_tensorboard(
    log_dir="C:/Users/Dawid/Documents/my_log_dir",
    histogram_freq = 1,
    embeddings_freq=1)
)

model %>%  compile(
  optimizer= "rmsprop",
  loss="binary_crossentropy",
  metrics=c("acc")
)

history<- model %>%  fit(
  x_train, y_train,
  epochs=20,
  batch_size=128,
  validation_split=0.2,
  callbacks=callbacks_list
)

model %>%  fit(
  x_train, y_train,
  epochs=20,
  batch_size = 128
)

result <- model %>%  evaluate(x_test, y_test)

