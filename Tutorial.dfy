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