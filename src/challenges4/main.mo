import Array "mo:base/Array";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Car "custom";
import Animal "animal";
import List "mo:base/List";

actor {
  public type Car = Car.Car;
  public type Animal = Animal.Animal;

  let tiger : Animal = {
    species = "Tiger";
    energy = 329;
  };

  public func fun() : async Text {
    let myCar : Car = {
      model = "Maxima";
      miles = 47;
    };

    myCar.model
  };

  public func create_animal_then_takes_a_break(species: Text, energy: Nat): async Animal {
    var asleepAnimal: Animal = {
      species = species;
      energy = energy;
    };
   
    if(asleepAnimal.energy > 0) {
      asleepAnimal := {
          species = species;
          energy = 0;
      }
    };

    asleepAnimal;
  };

  var animalList = List.nil<Animal>();

  public func push_animal(animal: Animal): async () {
    animalList := List.push(animal, animalList)
  };

  public func get_animals(animal: Animal): async [Animal] {
    List.toArray(animalList)
  }
};