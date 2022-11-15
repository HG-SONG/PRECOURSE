
import Foundation

class Matrix {
    var a : Double
    var b : Double
    var c : Double
    var d : Double
    
    init(a:Double=0,b:Double=0,c:Double=0,d:Double=0){
        self.a = a ; self.b = b ; self.c = c; self.d = d
    }
    
    func sum(with other:Matrix) -> Matrix {
        let result = Matrix(a: self.a + other.a, b: self.b + other.b, c: self.c + other.c, d: self.d + other.d)
        return result
    }
    
    func product(with other:Matrix) -> Matrix {
        let newA = self.a * other.a + self.b * other.c
        let newB = self.a * other.b + self.b * other.d
        let newC = self.c * other.a + self.d * other.c
        let newD = self.c * other.b + self.d * other.d
        let result = Matrix(a: newA, b: newB, c: newC, d: newD)
        return result
    }
}

var m1 = Matrix(a: 1.0 , b: 1.0 , c: 2.0 , d: 3.0)
var m2 = Matrix.init(a: 0.5, b: 2, c: 1.5, d: 1.0)

let sum = m1.sum(with: m2)
let prod = m1.product(with: m2)

