module {
  public type Animal = {
    species : Text;
    energy : Nat;
  };

  public func animal_sleep(animal: Animal): Animal {
    var updatedAnimal = animal;

    updatedAnimal := {
      species = animal.species;
      energy = animal.energy + 10;
    };

    updatedAnimal
  }
};