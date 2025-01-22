class perceptronSimpleCode:
    def __init__(self, num_inputs,velocidadDeAprendizaje=0.1,interacciones=100):
        self.peso = [0.0] * num_inputs
        self.bias= 0.0
        self.velocidadDeAprendizaje = velocidadDeAprendizaje
        self.interacciones = interacciones
    def prediccion(self, inputs):
        peso_suma = sum(w*x for w,x in zip (self.peso,inputs))+self.bias
        return 1 if peso_suma >=0 else 0
    
    def entrenamiento(self,training_data):
        for interaccion in range(self.interacciones):
            for inputs, traget in training_data:
                prediccion = self.prediccion(inputs)
                error = traget -prediccion
                self.peso=[w+self.velocidadDeAprendizaje*error*x for w,x in zip(self.peso,inputs)]
                self.bias += self.velocidadDeAprendizaje *error

training_data = [((0,0),0),((0,1),0),((1,0),0),((1,1),1)]

perceptrons = perceptronSimpleCode(num_inputs=2)
perceptrons.entrenamiento(training_data)
print(perceptrons.prediccion((0,0)))  # Salida esperada: 0
print(perceptrons.prediccion((0,1)))  # Salida esperada: 0
print(perceptrons.prediccion((1,0)))  # Salida esperada: 0
print(perceptrons.prediccion((1,1)))  # Salida esperada: 1