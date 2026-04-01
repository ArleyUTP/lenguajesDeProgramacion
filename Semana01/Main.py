class Suma:
    def __init__(self,num1,num2):
        self.num1=num1
        self.num2=num2
    
    def suma(self):
        return self.num1+self.num2
    

suma = Suma(5,10)
print("El resultado de la suma es:",suma.suma())