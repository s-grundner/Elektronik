# C\#

## Funktionen

### ### Ref Parameters

```cs
static void Foo(ref int num) { num = 5;}

int num = 0;
Bar(out num); // num == 5 ✅

```

### Out Parameters

```cs
static void Bar(out int num) { num = 5;}

int num = 0;
Bar(out num); // num == 5 ✅

```

### Named Parameters

```cs
static void Foo(string name, int age) { /*...*/ 

/* Call */ Foo(name: "Some Name", age: 20);
/* Call */ Foo(age: 20, name: "Some Name");
```

### Optionale Parameter

```cs
static int Add(int a, [Optional] int b) {
    return a + b;
}

static int Add(int a, int b = default) { // default value of datatype (for int its 0)
    return a + b;
}
```

## String

> [!info] Verbatim Operator @
> `string path = "C:\\Users\\Smon\\source"` $\iff$
> `string path = @"C:\Users\Smon\source"` String mit @ Operator: Es müssen keine Zeichen escaped werden

> [!info] Empty String: `""` $\iff$ `string.Empty`

### Formatting

```cs
int age = 21;
string name = "simon";
Console.WriteLine("Your name is " + name + ", and your age is " + age); // String concatenation
Console.WriteLine("Your name is {0}, and your age is {1}", name, age); // String formatting
Console.WriteLine($"Your name is {name}, and your age is {age}"); // String interpolation
```