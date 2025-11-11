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

@cask.postJson("/append")
def jsonEndpoint(position:Int, value2:ujson.Value, list3: Seq[ujson.Value]) = {
    val odp =  list3.patch(position, Seq(value2), 0)

        ujson.Obj(
    "append" -> odp
)

}


/*
check Implementacja listy
tail - usuwanie pierwszego elementu lsisty
NIll jako parametrz

cask wiec robimy przerzucenie typu an seq i z seq na wynik bo trzeba zwrocic json a sosujemy ujson?
*/

//szablonik
sealed trait LinkedNode[+A]
{
  def tail: LinkedNode[A];
}

//istnieje
case class Node[A](ele: A, next: LinkedNode[A]) extends LinkedNode[A]
{
  def tail: LinkedNode[A]=next;

}

case object EmptyNode extends LinkedNode[Nothing]
{
  def tail: LinkedNode[Nothing]=EmptyNode;

}

object LinkedNode
{

  def fromInput[A](seq: Seq[A]): LinkedNode[A] = 
  {
    if (seq.isEmpty)
      {
        EmptyNode;
      }
      else
      {
          Node(seq.head, fromInput(seq.tail));
      }
  }



  def toInput[A](list: LinkedNode[A]): Seq[A] = 
    (
      Seq.unfold(list)
      {
        case EmptyNode => None
        case Node(ele, next) => Some((ele, next))
      }
    )


}



@cask.postJson("/tail")
def jsonEndpoint(list: Seq[ujson.Value]) = {
  val mylist =  LinkedNode.fromInput(list)


        ujson.Obj(
    "tail" -> LinkedNode.toInput(mylist.tail)
)


}






  initialize()
}


