error id: file://<WORKSPACE>/example/src/main/scala/Example.scala:local26
file://<WORKSPACE>/example/src/main/scala/Example.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -ujson.
	 -scala/Predef.ujson.
offset: 978
uri: file://<WORKSPACE>/example/src/main/scala/Example.scala
text:
```scala
package app
object FormJsonPost extends cask.MainRoutes{
override def host: String = "0.0.0.0"


@cask.postJson("/isSorted")
def jsonEndpoints(char_input: ujson.Value, value2: Seq[Int]) = {

def compare: (Int, Int)=> Boolean = char_input.str match {
case "<=" => (a , b) => a <= b
case ">=" => (a , b) => a >= b
case _ => (_,_) => true
}  


val odp = value2.zip(value2.tail).forall{ case (a, b) => compare(a,b)}

ujson.Obj(
    "sorted" -> odp
)

}


@cask.postJson("/sum")
def jsonEndpoint(value1:Seq[Int], value2: Seq[Int], value3: Seq[Int]) = {

    def sum: (Seq[Int], Seq[Int]) => Seq[Int] = (a,b)=>a.zip(b).map {case (x,y)=>x+y}


    val odp = sum(value1, sum(value2,value3))
    ujson.Obj(
    "sum" -> odp
)

}


@cask.postJson("/setHead")
def jsonEndpoint(element1:ujson.Value, value2: Seq[ujson.Value]) = {
    val odp = element1 +: value2
    ujson.Obj(
    "sum" -> odp
)
}

@cask.postJson("/append")
def jsonEndpoint(position:Int, value2:ujson.Value, list3: Seq[u@@json.Value]) = {
    val odp =  list3.patch(position, Seq(value2), 0)

        ujson.Obj(
    "append" -> odp
)

}




  initialize()
}



```


#### Short summary: 

empty definition using pc, found symbol in pc: 