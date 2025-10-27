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









  initialize()
}


