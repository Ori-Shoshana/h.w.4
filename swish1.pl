% תמיד גבר ראשון - זוגות נשואים
married(john, mary).
married(bob, alice).
married(mike, nancy).
married(david, sophia).
married(ori, may).

% גברים
male(john).
male(bob).
male(mike).
male(david).
male(yaakov).
male(ori).
male(amir).
% נשים
female(mary).
female(mia).
female(may).
female(alice).
female(nancy).
female(sophia).
female(lia).
female(tai).

% ילדים
parent(john, may).
parent(may, amir).
parent(john, mike).
parent(mary, mike).
parent(john, yaakov).
parent(mary, yaakov).
parent(bob, nancy).
parent(alice, nancy).
parent(mike, david).
parent(mike, mia).
parent(nancy, david).
parent(mike, sophia).
parent(nancy, sophia).
parent(amir,lia).
parent(david,tai).


% Grandparent definition לנכדים
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Family relationship predicates
father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

son(X, Y) :- parent(Y, X), male(X).

daughter(X, Y) :- parent(Y, X), female(X).

grandfather(X, Y) :- parent(Z, Y), parent(X, Z), male(X).

grandmother(X, Y) :- parent(Z, Y), parent(X, Z), female(X).

grandson(X, Y) :- grandparent(Y, X), male(X).

granddaughter(X, Y) :- grandparent(Y, X), female(X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

uncle(X, Y) :- male(X), parent(Z, Y), married(X, W), sibling(Z, W).

cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2), female(P2), male(Y), X \= Y.

brother_in_law(X, Y) :- male(X), (married(Z, Y), sibling(X, Z)); (married(Z, X), sibling(Y, Z)).

niece(X, Y) :- female(X), sibling(Y, Z), parent(Z, X).

second_cousin(X, Y) :- parent(A, X), parent(B, Y), cousin(A, B).
