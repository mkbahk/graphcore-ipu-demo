# 0. 모듈 인포트

from tensorflow import keras
from tensorflow.keras import utils
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation

# 1. 데이타셋 준비하기
(X_train, Y_train), (X_test, Y_test) = mnist.load_data()
X_train = X_train.reshape(60000, 28*28).astype('float32') / 255.0
X_test = X_test.reshape(10000, 28*28).astype('float32') / 255.0
Y_train = np_utils.to_categorical(Y_train)
Y_test = np_utils.to_categorical(Y_test)

# Overfitting을 찾아보기 위해 Traing Data세트중에서 Validation Set으로 추가분할
X_val = X_train[50000:60000]
Y_val = Y_train[50000:60000]
X_train = X_train[0:50000]
Y_train = Y_train[0:50000]

# 2. 모델 구성하기
model = Sequential()
model.add(Dense(64, input_dim=28*28, activation='relu', kernel_initializer='glorot_uniform', bias_initializer='zeros'))
model.add(Dense(32, activation='relu'))
model.add(Dense(16, activation='relu'))
model.add(Dense(10, activation='softmax'))

# 3. 모델 엮기
model.compile(optimizer=keras.optimizers.SGD(learning_rate=0.1), loss='categorical_crossentropy', metrics='accuracy')
model.summary()

# 4. 학습Training
model.fit(x=X_train, y=Y_train, epochs=10, batch_size=8, validation_data=(X_val, Y_val) )

# 5. 추론Inference
loss_and_metrics = model.evaluate(x=X_test, y=Y_test, batch_size=8)
print("loss_and_metrics : " + str(loss_and_metrics))
