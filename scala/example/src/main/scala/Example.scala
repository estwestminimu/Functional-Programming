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


/*4*/

@cask.postJson("/append-option")
def jsonEndpointOptional(position:Int, value:ujson.Value, list: Seq[ujson.Value]) = {
   
  append(position, value, list) match
  {
  case Some(result) =>ujson.Obj("append" -> result)
  case None =>ujson.Obj("append" -> "error")
  }



}
def append(position:Int, value:ujson.Value, list: Seq[ujson.Value]) : Option[Seq[ujson.Value]] =
  {
  if (position<0 || position > list.length)
  {
    None
  }
  else
  {
    Some(list.patch(position, Seq(value), 0))
  }
  }




@cask.postJson("/variance")
def jsonVarianceOptional(list: Seq[ujson.Value]) = {
   
  variance(list) match
  {
  case Some(result) =>ujson.Obj("variance" -> result)
  case None =>ujson.Obj("variance" -> "error")
  }



}


def variance(list: Seq[ujson.Value]) : Option[Double] =
  {
  if (list.length<2)
  {
    None
  }
  else
  {
    val numbers = list.map(_.num)

    val average = numbers.sum/numbers.length;
    val tobepower = numbers.map(_ - average)
    val power = tobepower.map(x => x*x )
    val fin = power.sum/(numbers.length-1)
    Some(fin)
  }
  }












// zad 5

case class KeyValue[K, V](key: K, value: V)

trait MapRed[In, Key, Value, Reduced] 
{ 
  def mapper(input: In): Seq[KeyValue[Key, Value]]
  def reducer(key: Key, values: Seq[Value]) : KeyValue[Key, Reduced] 
} 


class NumberCounter extends MapRed[List[Int], Int, Int, Int] 
{ 
  override def mapper(input: List[Int]): Seq[KeyValue[Int, Int]] = { 
    input.map(x => KeyValue(x, 1)) 
  }

  override def reducer(key: Int, values: Seq[Int]): KeyValue[Int, Int] = {
     KeyValue(key, values.sum) 
  } 
} 
     



@cask.postJson("/dic-number")
def jsonDicNumber(list: Seq[ujson.Value]) = {
 

def mapReduce(list: Seq[ujson.Value]): Map[Int, Int] = {
  val counter = new NumberCounter()
  // //json na liste int 
  // val numbers = list.map(_.num.toInt).toList

  // //tworzymy kucze
  // val mapped = counter.mapper(numbers)

  // //grupujemy wedlug kluczka
  // val grouped = mapped.groupBy(_.key)

  val tmp =counter.mapper(list.map(_.num.toInt).toList).groupBy(_.key)


  val reduced: Map[Int, Int] = {
    tmp.map { 
      case (key, valu) =>
      val data = valu.map(_.value)
      val result = counter.reducer(key, data)
      (key, result.value)
    }
  }

  reduced
}





    ujson.Obj.from(
      mapReduce(list).map {
        case (key, value) => 
        key.toString -> ujson.Num(value)
    }
)

}


// zadanie 3.5

class NumberPowerOfThree extends MapRed[List[Int], Int, Int, Int] 
{ 
  override def mapper(input: List[Int]): Seq[KeyValue[Int, Int]] = { 
    input.map(x => KeyValue(x, x*x*x)) 
  }

  override def reducer(key: Int, values: Seq[Int]): KeyValue[Int, Int] = {
     KeyValue(key, values.head) 
  } 
} 
  




@cask.postJson("/dic-power")
def jsonDicPower(list: Seq[ujson.Value]) = {
 


def mapReduce(list: Seq[ujson.Value]): Map[Int, Int] = {
  val counter = new NumberPowerOfThree()
  // //json na liste int 
  // val numbers = list.map(_.num.toInt).toList

  // //tworzymy kucze
  // val mapped = counter.mapper(numbers)

  // //grupujemy wedlug kluczka
  // val grouped = mapped.groupBy(_.key)

  val tmp =counter.mapper(list.map(_.num.toInt).toList).groupBy(_.key)


  val reduced: Map[Int, Int] = {
    tmp.map { 
      case (key, valu) =>
      val data = valu.map(_.value)
      val result = counter.reducer(key, data)
      (key, result.value)
    }
  }

  reduced
}






 
    ujson.Obj.from(
      mapReduce(list).map {
        case (key, value) => 
        key.toString -> ujson.Num(value)
    }
)

}





initialize()
}


