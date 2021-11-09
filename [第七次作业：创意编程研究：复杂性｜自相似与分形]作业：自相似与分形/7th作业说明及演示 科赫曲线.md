### 7th作业说明及演示 科赫曲线

递归功能是分形图案的一种算法技术

但递归功能只能产生图案，而无法把图案当作对象，所以此时又出现了一种分形图案算法技术
有一位数学家科赫提出了一种算法

1. 画出一条线
2. 讲线段分成三段
3. 从中间线段部位垂直向上找到一个点，与中间段点两个点形成等边三角形
4. 删除中间线段
5. 不断地执行第2步~第4步

把科赫的每个线段当作单独的对象，从而参与物理模拟

```
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
}
```

主程序

```
ArrayList<KochLine> lines;

void setup(){
  size(666,666);
  
  lines = new ArrayList<KochLine>();
  
  PVector start = new PVector(0,200);
  PVector end = new PVector(width,200);
  
  lines.add(new KochLine(start,end));
}

void draw(){
  background(233);
  
  for(KochLine l:lines){
    l.display();
  }
}

void generate(){
  ArrayList next = new ArrayList<KochLine>();
  
  for(KochLine l:lines){
    next.add(new KochLine(a,b));
    next.add(new KochLine(b,c));
    next.add(new KochLine(c,d));
    next.add(new KochLine(d,e));
    }
    
    lines = next;
}
```

以上是科赫对象的基本框架

接下来我们进一步完善

首先主程序上的变化

```
ArrayList<KochLine> lines;

void setup(){
  size(666,666);
  
  lines = new ArrayList<KochLine>();
  
  PVector start = new PVector(0,200);
  PVector end = new PVector(width,200);
  
  lines.add(new KochLine(start,end));
  
   for (int i = 0; i < 5; i++) {
    generate();
  }
}

void draw(){
  background(233);
  
  for(KochLine l:lines){
    l.display();
  }
}

void generate(){
  ArrayList next = new ArrayList<KochLine>();
  
  for(KochLine l:lines){
    PVector a = l.kochA();                 
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    
    next.add(new KochLine(a,b));
    next.add(new KochLine(b,c));
    next.add(new KochLine(c,d));
    next.add(new KochLine(d,e));
    }
    
    lines = next;
}
```

在科赫对象中添加kochA~E的算法

- display
- kochA
- kochE
- kochB
- kochD
- kochC
- rotate()

```
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
```