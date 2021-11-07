//1.模拟物理运动
//2.适应度
//3.选择
//4.繁殖
//5.获取最大适应度

class Population {

  float mutationRate;          // 计数器
  Rocket[] population;         // 火箭数组
  ArrayList<Rocket> matingPool;    // 火箭交配池
  int generations;             // 迭代


   Population(float m, int num) {
    mutationRate = m;
    population = new Rocket[num];
    matingPool = new ArrayList<Rocket>();
    generations = 0;

    for (int i = 0; i < population.length; i++) {
      PVector location = new PVector(width/2,height+20);
      population[i] = new Rocket(location, new DNA());
    }
  }
  
//1.模拟物理运动
  void live () {
    for (int i = 0; i < population.length; i++) {
      population[i].run();
    }
  }
  
//2.适应度
  void fitness() {  //适应度
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
    }
  }

//3.选择
  void selection() {    //选择
    matingPool.clear();
    float maxFitness = getMaxFitness();

    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(),0,maxFitness,0,1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }
  
//4.繁殖
  void reproduction() { //繁殖
    for (int i = 0; i < population.length; i++) {

      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      Rocket mom = matingPool.get(m);
      Rocket dad = matingPool.get(d);
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      DNA child = momgenes.crossover(dadgenes);
      child.mutate(mutationRate);
      PVector location = new PVector(width/2,height+20);
      population[i] = new Rocket(location, child);
    }
    generations++;
  }
  
//5.获取最大适应度
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
       if(population[i].getFitness() > record) {
         record = population[i].getFitness();
       }
    }
    return record;
  }
  
  int getGenerations() {
    return generations;
  }

}
