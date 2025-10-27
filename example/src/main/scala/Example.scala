package app
object FormJsonPost extends cask.MainRoutes{
override def host: String = "0.0.0.0"


@cask.postJson("/isSorted")
def jsonEndpoints(char_input: ujson.Value, value2: Seq[Int]) = {

def compare: (Int, Int)=> Boolean = {
    val check= char_input.str
    if (check == "<=")
    {
        (a: Int, b:Int) => a<=b

    }else if (check == ">="){
        (a: Int, b:Int) => a>=b
    }
    else
    {
        (a:Int, b:Int) => true
    }
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



    

  initialize()
}


