# Dummy Dafny Tutorial

## Insertion Sort

Prove a correctness property of Insertion Sort using the Dafny system. Work
on it until Dafny shows a thumbs up and something like following on its
statusbar at the bottom:

```
 "Verified | Proof Obligations: 42 | Errors: 0."
```

Describe who you helped (or got help from), and what kind of help.
Copy-paste your entire solution into a file sort.txt, and upload it at Tigerfile.

```{cmd="/workspaces/dafny-sort/dafny/dafny" args=["/stdin"] stdin=true output="text"}
predicate sorted(a: array<int>,  lo:int, hi:int)
 // Fix the bugs here by filling in some missing lines
 { forall j,k:: lo <= j < k < hi ==> a[j] <= a[k] }

method sort(a: array<int>)
 // fill in some missing lines here
 ensures sorted(a, 0, a.Length);
 // add enough assertions and invariants below to prove the "ensures"
 {var i: int;
  if (a.Length==0) {return;}
  i:=1;
  while (i<a.Length)
    {if (a[i]<a[0]) 
      {a[0],a[i]:=a[i],a[0];}
     i:=i+1;
    }
     
  i:=1;
  while (i<a.Length)
  {var j : int := i;
   var v : int := a[i];
   while (v < a[j-1])
    { a[j]:=a[j-1];
      j:=j-1;
    }
    a[j]:=v;
    i:=i+1;
  }
}
```

### Additional help

Before tackling Insertion Sort, you should work through some of the Dafny tutorials, 
particularly the "Guide" [1] and perhaps "Termination" [2].  You will not need anything
more advanced for this exercise, and you probably won't even need "Termination".

To show that this is only half of the specification of "sort": Rewrite the body
of the sort function so that it initializes the array a to all zeros, and prove
that it satisfies the "ensures" specification. Upload that as "sort-bogus.txt".

For the serious among you: Read about Multisets [3] in Dafny. Strengthen the
requires/ensures clauses of the sort function to specify that the output array
represents the same multiset as the input, and prove that in Dafny. Upload this
full specification of sort as "sort-full.txt".

[1] https://dafny-lang.github.io/dafny/OnlineTutorial/guide
[2] https://dafny-lang.github.io/dafny/OnlineTutorial/Termination
[3] https://dafny-lang.github.io/dafny/OnlineTutorial/ValueTypes


@import "Tutorial.dfy" {cmd="/workspaces/dafny-sort/dafny/dafny" args=["/stdin"] stdin=true output="text"}

