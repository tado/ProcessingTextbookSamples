class ParticleSystem {
  //アレイリスト（アレイの数が自在に変化するアレイ）"Partcle"をparticlesとしてインスタンス化。
  ArrayList<Particle> particles;
  //PVector origin;

  //
  Particle part ;

  ParticleSystem(PVector location) {
    //origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) {
    //Class Particleでできた円をアレイparticlesに加えていく
    particles.add(new Particle(x, y));
  }

  void run() {
    //アレイparticleのラベルを総数から１ずつ減らしていく
    for (int i = particles.size()-1; i >= 0; i--) {
      //Class Particleをpartとしてインスタンス化する。アレイparticlesの値をpartに入れていく。
      part = particles.get(i);
      //Class Particleのrun(updateとdisplay)を実行
      part.run();

      if (part.finished()) {
        //寿命の来た円のデータをアレイparticleから削除する
        particles.remove(i);
      }
    }
  }
}