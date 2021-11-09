class KochLine{
  PVector start;
  PVector end;
  
  KochLine(PVector a, PVector b){
    start = a.get();
    end = b.get();
  }
  
  void display(){
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
  
   PVector kochA() {
    return start.get();  //复制起点向量
  }
  
  PVector kochE() {
    return end.get();  //复制末尾向量
  }

  PVector kochB() {
    PVector v = PVector.sub(end, start); //得出静态向量
    v.div(3);  //缩短向量3倍
    v.add(start);   //与起点向量相加
    return v;  //返回v向量
  }    
  
  PVector kochD() {
    PVector v = PVector.sub(end, start);
    v.mult(2/3.0);  
    v.add(start);
    return v;
  }

  PVector kochC() {
    PVector a = start.get();
    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v); 
    v.rotate( -radians(60));
    a.add(v); 

    return a;
  }    
  
}
