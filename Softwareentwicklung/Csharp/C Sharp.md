# C\#

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

