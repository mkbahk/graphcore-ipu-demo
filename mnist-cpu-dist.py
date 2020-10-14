# Copyright 2020 Graphcore Ltd.
import tensorflow as tf
from tensorflow import keras
import time

print(tf.config.list_physical_devices("CPU"), "\n\n")

if tf.__version__[0] != '2':
    raise ImportError("TensorFlow 2 is required for this example")

# The input data and labels.
mnist = tf.keras.datasets.mnist

start = time.time() # 시작 시간 저장

(x_train, y_train), (x_test, y_test) = mnist.load_data()
(x_train, x_test) = (x_train / 255.0, x_test / 255.0)

# Add a channels dimension.
x_train = x_train[..., tf.newaxis]
x_test = x_test[..., tf.newaxis]

def create_train_dataset():
    print("==============================Processing Training DataSet==============================\n\n")
    train_ds = tf.data.Dataset.from_tensor_slices((x_train, y_train)).shuffle(60000).batch(1, drop_remainder=True)
    train_ds = train_ds.map(lambda d, l: (tf.cast(d, tf.float32), tf.cast(l, tf.float32)))
    return train_ds.repeat()
#end of def

def create_test_dataset():
    print("==============================Processing Test  DataSet==============================\n\n")
    test_ds = tf.data.Dataset.from_tensor_slices((x_test, y_test)).shuffle(10000).batch(1, drop_remainder=True)
    test_ds = test_ds.map(lambda d, l: (tf.cast(d, tf.float32), tf.cast(l, tf.float32)))
    return test_ds.repeat()
#end of def


# Create the model using the IPU-specific Sequential class instead of the
# standard tf.keras.Sequential class
def create_model():
    model = keras.Sequential([
        keras.layers.Flatten(),
        keras.layers.Dense(128, activation='relu'),
        keras.layers.Dense(256, activation='relu'),
        keras.layers.Dense(128, activation='relu'),
        keras.layers.Dense(10, activation='softmax')])
    return model
#end of def

strategy = tf.distribute.get_strategy()

def main():
    with strategy.scope():
       # Get the training dataset.
       print("==============================Getting Training DataSet==============================\n\n")
       ds1 = create_train_dataset()
       print("==============================Getting Test DataSet==============================\n\n")
       ds2 = create_test_dataset()

       # Create an instance of the model.
       print("==============================Building Model==============================\n\n")
       model = create_model()

       # Train the model.
       print("==============================Start Model Training==============================\n\n")
       model.compile(loss = tf.keras.losses.SparseCategoricalCrossentropy(), optimizer = tf.keras.optimizers.Adam(),  metrics=['sparse_categorical_accuracy'])
       model.fit(ds1, steps_per_epoch=2000, epochs=50)

       print("\n\n==============================Checking the result==============================\n\n")
       (loss, accuracy) = model.evaluate(ds2, steps=1000)
       print("Validation loss: {}".format(loss))
       print("Validation accuracy: {}%".format(100.0 * accuracy))
       print("\n\n==============================Job Done by Intel CPU with 2 Sockets, 40 Cores !!!==============================")
   #end of with:
#end of main


if __name__ == '__main__':
    main()

print("Running Time :", round(time.time() - start, 2),"(Sec.)")  # 현재시각 - 시작시간 = 실행 시간
