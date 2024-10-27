% 1. Reverse a list
reverse([], []). 
reverse([H|T], Z) :- 
    reverse(T, RT), 
    append(RT, [H], Z).

% 2. Check membership
member(X, [X|_]). 
member(X, [_|T]) :- 
    member(X, T).

% 3. Check for palindrome
palindrome(L) :- 
    reverse(L, L).

% 4. Check if sorted
sorted([]). 
sorted([_]). 
sorted([X, Y | T]) :- 
    X =< Y, 
    sorted([Y | T]).

% 5. Generate permutations
permutation([], []). 
permutation(L, [H|T]) :- 
    select(H, L, R), 
    permutation(R, T).
