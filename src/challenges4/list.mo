module {
  public func is_null(l: List<T>): Bool {
    switch(l) {
      case(null) {
        return true
      };
      case(?l) {
        return false
      };
    }
  };

  public func last(l: List<T>): ?T {
    switch l {
      case null { null };
      case (?(x, null)) { ?x };
      case (?(_, t)) { last<T>(t) };
    }
  };

   public func size<T>(l : List<T>) : Nat {
    func rec(l : List<T>, n : Nat) : Nat {
      switch l {
        case null { n };
        case (?(_, t)) { rec(t, n + 1) };
      }
    };
    rec(l,0)
  };

  public func get<T>(l : List<T>, n : Nat) : ?T {
    switch (n, l) {
      case (_, null) { null };
      case (0, (?(h, t))) { ?h };
      case (_, (?(_, t))) { get<T>(t, n - 1) };
    }
  };

  public func reverse<T>(l : List<T>) : List<T> {
    func rec(l : List<T>, r : List<T>) : List<T> {
      switch l {
        case null { r };
        case (?(h, t)) { rec(t, ?(h, r)) };
      }
    };
    rec(l, null)
  };
}